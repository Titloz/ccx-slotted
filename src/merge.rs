use std::collections::{HashMap, HashSet, VecDeque};
use std::cell::Cell;
use std::time::Instant;
use std::{panic, println, todo, vec};

use crate::*;

thread_local! {
    static MAX_RECURSION_DEPTH: Cell<usize> = Cell::new(DEFAULT_MAX_RECURSION_DEPTH);
    static RECURSION_DEPTH: Cell<usize> = Cell::new(0);
}

pub(crate) const DEFAULT_MAX_RECURSION_DEPTH: usize = 4_000;

pub fn set_max_recursion_depth(depth: usize) {
    MAX_RECURSION_DEPTH.with(|d| d.set(depth));
}

struct DepthGuard;

impl DepthGuard {
    fn enter() -> Option<DepthGuard> {
        let max = MAX_RECURSION_DEPTH.with(|d| d.get());
        let cur = RECURSION_DEPTH.with(|d| d.get());
        if cur >= max {
            return None;
        }
        RECURSION_DEPTH.with(|d| d.set(cur + 1));
        Some(DepthGuard)
    }
}

impl Drop for DepthGuard {
    fn drop(&mut self) {
        RECURSION_DEPTH.with(|d| d.set(d.get().saturating_sub(1)));
    }
}
// ---------------------------------------------------------------------------

pub(crate) type Unifier = HashMap<Slot, AppliedId>;

pub(crate) enum MguMemoEntry {
    InProgress,
    Done(AppliedId, AppliedId, Unifier, Vec<Unifier>),
}
pub(crate) type MguMemo = HashMap<(Id, Id), MguMemoEntry>;

fn pair_renaming(ra: &AppliedId, rb: &AppliedId, a: &AppliedId, b: &AppliedId) -> Option<SlotMap> {
    let mut r = SlotMap::new();
    for (repr, new) in [(ra, a), (rb, b)] {
        for (internal, ext_repr) in repr.m.iter() {
            let ext_new = new.m.get(internal)?;
            match r.get(ext_repr) {
                Some(t) if t != ext_new => return None, // conflicting renaming
                Some(_) => (),
                None => r.insert(ext_repr, ext_new),
            }
        }
    }
    if !r.is_bijection() {
        return None; // two distinct representative slots would collapse
    }
    Some(r)
}

/// Apply the renaming `r` to a slot; slots outside `r` are left unchanged.
fn rename_slot(r: &SlotMap, s: Slot) -> Slot {
    r.get(s).unwrap_or(s)
}

fn rename_applied_id(ai: &AppliedId, r: &SlotMap) -> Option<AppliedId> {
    let mut m = SlotMap::new();
    for (k, v) in ai.m.iter() {
        m.insert(k, rename_slot(r, v));
    }
    if !m.is_bijection() {
        return None;
    }
    Some(AppliedId::new(ai.id, m))
}

/// Transport a unifier along a slot renaming `r` (identity outside of `r`).
/// Returns `None` on any slot collision.
fn rename_unifier(sigma: &Unifier, r: &SlotMap) -> Option<Unifier> {
    let mut out = Unifier::new();
    for (s, ai) in sigma {
        let key = rename_slot(r, *s);
        if out.contains_key(&key) {
            return None; // two bindings collapse: not a faithful renaming
        }
        out.insert(key, rename_applied_id(ai, r)?);
    }
    Some(out)
}

fn transport_results(
    ra: &AppliedId, rb: &AppliedId, mu_repr: &Unifier, results: &Vec<Unifier>,
    a: &AppliedId, b: &AppliedId, mu: &Unifier,
) -> Option<Vec<Unifier>> {
    let r = pair_renaming(ra, rb, a, b)?;
    if &rename_unifier(mu_repr, &r)? != mu {
        return None; // the substitution contexts differ: results don't carry over
    }
    let mut out: Vec<Unifier> = vec![];
    for sigma in results {
        let t = rename_unifier(sigma, &r)?;
        if !out.contains(&t) {
            out.push(t);
        }
    }
    Some(out)
}


pub(crate) fn compute_mgus(eg: &MyEGraph, a: &AppliedId, b: &AppliedId, mu: &Unifier, memo: &mut MguMemo, budget: &mut usize) -> Vec<Unifier> {
    let _depth = match DepthGuard::enter() {
        Some(g) => g,
        None => return vec![],
    };

    // canonicalize
    let a = eg.find_applied_id(a);
    let b = eg.find_applied_id(b);
    let key = (a.id, b.id);

    match memo.get(&key) {
        Some(MguMemoEntry::InProgress) => return vec![],
        Some(MguMemoEntry::Done(ra, rb, mu_repr, results)) => {
            if let Some(l) = transport_results(ra, rb, mu_repr, results, &a, &b, mu) {
                return l;
            }
        }
        None => {
            if let Some(MguMemoEntry::InProgress) = memo.get(&(b.id, a.id)) {
                return vec![];
            }
        }
    }

    memo.insert(key, MguMemoEntry::InProgress);

    let mut l: Vec<Unifier> = vec![];
    if *budget <= 0 {
        return l;
    } 
    *budget -= 1;
    for na in eg.enodes_applied(&a) {
        for nb in eg.enodes_applied(&b) {
            match (na.clone(), nb) {
                (SimpleLang::App(ref c1, ref c2), SimpleLang::App(ref c3, ref c4)) => {
                    // Dec
                    let mu2s = compute_mgus(eg, c1, c3, mu, memo, budget);
                    for mu2 in mu2s {
                        let mu3s = compute_mgus(eg, c2, c4, &mu2, memo, budget);
                        for mu3 in mu3s {
                            if !l.contains(&mu3) {
                                l.push(mu3);
                            }
                        }
                    }
                },
                (SimpleLang::Symbol(f), SimpleLang::Symbol(g)) => {
                    if f==g {
                        // Dec
                        if !l.contains(mu){
                            l.push(mu.clone());
                        }
                    } else {
                        // DecFail
                        continue;
                    }
                },
                (SimpleLang::Number(n), SimpleLang::Number(m)) => {
                    if n==m {
                        // Dec
                        if !l.contains(mu){
                            l.push(mu.clone());
                        } 
                    } else {
                        // DecFail
                        continue;
                    }
                },
                (SimpleLang::Var(y), SimpleLang::Var(x)) => {
                    if x == y {
                        // Triv
                        if !l.contains(mu) {
                            l.push(mu.clone());
                        }
                    } else {
                        match mu.get(&y) {
                            Some(c) => {
                                // LazyRep
                                let l_bis = compute_mgus(eg, &c.clone(), &b, mu, memo, budget);
                                for el in l_bis {
                                    if !l.contains(&el) {
                                        l.push(el);
                                    }
                                }
                            },
                            None => {
                                if !occ(mu, &b, &y) {
                                    // Bind
                                    let mut sigma = mu.clone();
                                    sigma.insert(y, b.clone());
                                    if !l.contains(&sigma) {
                                        l.push(sigma);
                                    }
                                } else {
                                    // Check
                                    continue;
                                }
                            }
                        }
                    }
                },
                (SimpleLang::Var(y), _) => {
                    match mu.get(&y) {
                        Some(c) => { 
                            // LazyRep
                            let l_bis = compute_mgus(eg, &c.clone(), &b, mu, memo, budget);
                            for el in l_bis {
                                if !l.contains(&el) {
                                    l.push(el);
                                }
                            }
                        },
                        None => {
                            if !occ(mu, &b, &y) {
                                // Bind
                                let mut sigma = mu.clone();
                                sigma.insert(y, b.clone());
                                if !l.contains(&sigma) {
                                    l.push(sigma);
                                }
                            } else {
                                // Check
                                continue;
                            }
                        }
                    }
                },
                (_, SimpleLang::Var(x)) => {
                    match mu.get(&x) {
                        Some(c) => {
                            // LazyRep'
                            let l_bis = compute_mgus(eg, &a, &c.clone(), mu, memo, budget);
                            for el in l_bis {
                                if !l.contains(&el) {
                                    l.push(el);
                                }
                            }
                        },
                        None => {
                            if !occ(mu, &a, &x) {
                                // Bind'
                                let mut sigma = mu.clone();
                                sigma.insert(x, a.clone());
                                if !l.contains(&sigma) {
                                    l.push(sigma);
                                }
                            } else {
                                // Check'
                                continue;
                            }
                        }
                    }
                }
                _ => continue, // DecFail
            }
        }
    }

    memo.insert(key, MguMemoEntry::Done(a.clone(), b.clone(), mu.clone(), l.clone()));
    return l;
}

fn occ(mu: &Unifier, c: &AppliedId, v: &Slot) -> bool { //_eg: &MyEGraph, 
    for x in c.slots() {
        match mu.get(&x) {
            Some(c_bis) => {
                if c_bis.slots().contains(v) {
                    return true;
                }
            },
            None => continue,
        }
    }
    return false;
}

fn extract_all_lessthansize(eg: &MyEGraph, max: u64, a: &AppliedId) -> Vec<RecExpr<SimpleLang>> {
    let a = eg.find_applied_id(&a);
    let terms = extract_all_lessthansize_aux(eg, max, &a);
    let mut out = vec![];
    for t in terms {
        out.push(t.0);
    }
    out
}


fn extract_all_lessthansize_aux(eg: &MyEGraph, budget: u64, a: &AppliedId) -> Vec<(RecExpr<SimpleLang>, u64)> {
    // budget is initially called with the max size considered
    if budget <= 0 {
        return vec![];
    }
    let mut terms = vec![];
    for node in eg.enodes_applied(&a) {
        match node.clone() {
            SimpleLang::App(c, d) => {
                let terms_c = extract_all_lessthansize_aux(eg, budget-1, &c);
                let terms_d = extract_all_lessthansize_aux(eg, budget-1, &d);
                for tc in terms_c {
                    for td in terms_d.clone() {
                        if tc.1 + td.1 <= budget-1 {
                            terms.push((RecExpr {node: SimpleLang::App(AppliedId::null(), AppliedId::null()), children : vec![tc.0.clone(), td.0]}, tc.1 + td.1 + 1));
                        }
                    }
                }
            },
            _ => {
                terms.push((RecExpr { node, children: vec![] }, 1));
            },
        }
    }
    terms
}



pub(crate) fn compute_mgus_extern(eg: &mut MyEGraph, a: &AppliedId, b: &AppliedId, max: u64) -> Vec<Unifier> {
    let a = eg.find_applied_id(a);
    let b = eg.find_applied_id(b);
    let a_terms = extract_all_lessthansize(eg, max, &a);
    let b_terms = extract_all_lessthansize(eg, max, &b);

    // directly compute mgus between terms
    let mut out : Vec<Unifier> = vec![];
    for ta in a_terms {
        for tb in b_terms.clone() {
            if let Some(mu) = compute_mgu_terms(eg, &ta, &tb) {
                if !out.contains(&mu) {
                    out.push(mu);
                }
            }
        }
    }
    // we lack of mgus obtained after the permutations are applied here
    out
}

fn compute_mgu_terms(eg: &mut MyEGraph, t: &RecExpr<SimpleLang>, s: &RecExpr<SimpleLang>) -> Option<Unifier> {
    let mut mu = Unifier::new();
    //let mut mu_terms:HashMap<Slot,RecExpr<SimpleLang>> = HashMap::new();
    let mut mu_terms: Vec<(Slot, RecExpr<SimpleLang>)> = vec![];
    let mut equalities = vec![(t.clone(), s.clone())];
    while !equalities.is_empty() {
        let (t, s) = equalities.pop()?;
        match (t.node.clone(), s.node.clone()) {
            (SimpleLang::App(_,_), SimpleLang::App(_,_)) => { // Dec
                let tc = t.children.clone();
                let sc = s.children.clone();
                assert_eq!(tc.len(), sc.len());
                let eq0 = (tc[0].clone(), sc[0].clone());
                let eq1 = (tc[1].clone(), sc[1].clone());
                equalities.push(eq0);
                equalities.push(eq1);
            },
            (SimpleLang::Symbol(f), SimpleLang::Symbol(g)) => {
                if f==g { // Dec
                    continue;
                } else { // DecFail
                    return None;
                }
            },
            (SimpleLang::Number(n), SimpleLang::Number(m)) => {
                if n==m { // Dec
                    continue;
                } else { // DecFail
                    return None;
                }
            },
            (SimpleLang::Var(x), SimpleLang::Var(y)) => {
                if x==y { // Triv
                    continue;
                } else {
                    let mut seen = false;
                    for (z, u) in mu_terms.clone() {
                        if z == x { // LazyRep
                            equalities.push((u.clone(), s.clone()));
                            seen = true;
                            break;
                        }
                    }
                    if !seen {
                        if !occurs(&mu_terms, &s, &x) { // Bind
                            mu_terms.push((x, s.clone()));
                        } else { // Check
                            return None;
                        }
                    }
                }
            },
            (SimpleLang::Var(x), _) => {
                let mut seen = false;
                for (z, u) in mu_terms.clone() {
                    if z == x { // LazyRep
                        equalities.push((u.clone(), s.clone()));
                        seen = true;
                        break;
                    }
                }
                if !seen {
                    if !occurs(&mu_terms, &s, &x) { // Bind
                        mu_terms.push((x, s.clone()));
                    } else { // Check
                        return None;
                    }
                }
            },
            (_, SimpleLang::Var(y)) => {
                let mut seen = false;
                for (z, u) in mu_terms.clone() {
                    if z == y { // LazyRep'
                        equalities.push((t.clone(), u.clone()));
                        seen = true;
                        break;
                    }
                }
                if !seen {
                    if !occurs(&mu_terms, &t, &y) { // Bind'
                        mu_terms.push((y, t.clone()));
                    } else { // Check'
                        return None;
                    }
                }
            },
            (_,_) => { // DecFail
                return None;
            }
        }
    }
    for (x, term) in mu_terms {
        let aid = eg.add_expr(term);
        mu.insert(x, aid); // am I sure of the variables here?
    }
    Some(mu)
}

fn occurs(mu: &Vec<(Slot, RecExpr<SimpleLang>)>, term: &RecExpr<SimpleLang>, x: &Slot) -> bool {
    match term.node {
        SimpleLang::Var(y) => {
            for (z, u) in mu {
                if *z == y {
                    return occurs(mu, u, x);
                }
            }
            *x == y
        },
        SimpleLang::App(_,_) => {
            for child in term.children.clone() {
                if occurs(mu, &child, x) {
                    return true;
                }
            }
            false
        },
        _ => false,
    }
}


struct ApplyCtx<'a> {
    mu: &'a Unifier,
    memo: HashMap<AppliedId, AppliedId>,
    in_progress: HashSet<AppliedId>,
    changed: Vec<AppliedId>,
    budget: usize,
}

impl<'a> ApplyCtx<'a> {
    fn new(mu: &'a Unifier) -> Self {
        ApplyCtx {
            mu,
            memo: HashMap::new(),
            in_progress: HashSet::new(),
            changed: Vec::new(),
            budget: 10_000,
        }
    }

    fn record_union(&mut self, eg: &MyEGraph, c: &AppliedId) {
        let f = eg.find_applied_id(c);
        if !self.changed.contains(&f) {
            self.changed.push(f);
        }
    }
}

fn sigma_class(eg: &mut MyEGraph, ctx: &mut ApplyCtx, c: &AppliedId) -> Option<AppliedId> {
    if ctx.budget == 0 {
        return None;
    }
    ctx.budget -= 1;

    let _depth = DepthGuard::enter()?;

    let c = eg.find_applied_id(c);

    if c.slots().iter().all(|s| !ctx.mu.contains_key(s)) {
        return Some(c);
    }

    if let Some(r) = ctx.memo.get(&c) {
        return Some(eg.find_applied_id(r));
    }

    if ctx.in_progress.contains(&c) {
        return None; // cycle
    }
    ctx.in_progress.insert(c.clone());

    let nodes = eg.enodes_applied(&c);

    let mut image: Option<AppliedId> = None;
    let mut pending = nodes;
    loop {
        let mut progress = false;
        let mut still: Vec<SimpleLang> = Vec::new();
        for n in pending {
            match sigma_enode(eg, ctx, n.clone()) {
                None => still.push(n),
                Some(cn) => {
                    progress = true;
                    image = Some(match image.take() {
                        None => {
                            // first success: publish the image
                            let cn = eg.find_applied_id(&cn);
                            ctx.memo.insert(eg.find_applied_id(&c), cn.clone());
                            cn
                        }
                        Some(im) => {
                            let im = eg.find_applied_id(&im);
                            let cn = eg.find_applied_id(&cn);
                            if eg.union(&im, &cn) {
                                ctx.record_union(eg, &im);
                            }
                            eg.find_applied_id(&im)
                        }
                    });
                }
            }
        }
        if !progress || still.is_empty() {
            break;
        }
        pending = still;
    }

    ctx.in_progress.remove(&c);

    match image {
        Some(im) => {
            let im = eg.find_applied_id(&im);
            ctx.memo.insert(eg.find_applied_id(&c), im.clone());
            Some(im)
        }
        None => None,
    }
}

fn sigma_enode(eg: &mut MyEGraph, ctx: &mut ApplyCtx, n: SimpleLang) -> Option<AppliedId> {
    match n {
        SimpleLang::App(c1, c2) => {
            let a = sigma_class(eg, ctx, &c1)?;
            let b = sigma_class(eg, ctx, &c2)?;
            Some(eg.add(SimpleLang::App(a, b)))
        }
        SimpleLang::Var(x) => match ctx.mu.get(&x) {
            // Bindings may themselves contain bound slots (triangular
            // unifiers): recurse to apply `mu` exhaustively.
            Some(t) => sigma_class(eg, ctx, &t.clone()),
            None => Some(eg.add(SimpleLang::Var(x))),
        },
        other => Some(eg.add(other)),
    }
}

pub(crate) fn apply_unifier_class_init(eg: &mut MyEGraph, mu: &Unifier, c0: &AppliedId, c1: &AppliedId) -> (AppliedId, Vec<AppliedId>) {
    let mut ctx = ApplyCtx::new(mu);
    let n0 = sigma_class(eg, &mut ctx, c0);
    let n1 = sigma_class(eg, &mut ctx, c1);
    match (n0, n1) {
        (Some(n0), Some(n1)) => {
            let n0 = eg.find_applied_id(&n0);
            let n1 = eg.find_applied_id(&n1);
            if eg.union(&n0, &n1) {
                ctx.record_union(eg, &n0);
            }
            (eg.find_applied_id(&n0), ctx.changed)
        }
        // One of the instantiations was abandoned: report "nothing learned".
        _ => (eg.find_applied_id(c0), vec![]),
    }
}

fn rec_parents(eg: &MyEGraph, wo: &VecDeque<AppliedId>, changed: &Vec<Id>) -> Vec<AppliedId> {

    let mut parents_of: HashMap<Id, Vec<Id>> = HashMap::new();
    for i in eg.ids() {
        let ai = eg.mk_identity_applied_id(i);
        for n in eg.enodes_applied(&ai) {
            if let SimpleLang::App(c1, c2) = n {
                for child in [eg.find_id(c1.id), eg.find_id(c2.id)] {
                    parents_of.entry(child).or_default().push(i);
                }
            }
        }
    }

    let mut reaches: HashSet<Id> = HashSet::new();
    let mut queue: VecDeque<Id> = VecDeque::new();
    for i in changed {
        let i = eg.find_id(*i);
        if reaches.insert(i) {
            queue.push_back(i);
        }
    }
    while let Some(i) = queue.pop_front() {
        if let Some(ps) = parents_of.get(&i) {
            for p in ps {
                if reaches.insert(*p) {
                    queue.push_back(*p);
                }
            }
        }
    }
    
    let mut v: Vec<AppliedId> = vec![];
    for c0 in wo {
        if reaches.contains(&eg.find_id(c0.id)) {
            v.push(c0.clone());
        }
    }
    v
}


pub(crate) fn merge(eg: &mut MyEGraph, max: u64, time_limit: &Duration, wo: &mut VecDeque<AppliedId>, us: &mut VecDeque<AppliedId>, c0: &AppliedId) -> bool {
    let mut elapsed_time = Duration::from_secs(0);
    let mut start = Instant::now();
    let w1 = wo.clone();
    for c1 in w1 {
        let mgus = compute_mgus_extern(eg, c0, &c1, max); // , &empty, &mut memo, &mut budget
        // time check
        elapsed_time += start.elapsed();
        start = Instant::now();
        if elapsed_time > *time_limit {
            return false;
        }
        for mu in mgus {
            let (c_new, vec_modified) = apply_unifier_class_init(eg, &mu, c0, &c1);
            // time check
            elapsed_time += start.elapsed();
            start = Instant::now();
            if elapsed_time > *time_limit {
                return false;
            }
            eg.rebuild();
            update(eg, wo);
            update(eg, us);
            //wo_no_us(wo, us);
            // satisfiability of the class tested by the analyses
            if (*eg.analysis_data(c_new.id)).0 <= max {
                let mut subsumed = vec_modified.is_empty(); // all nodes that were added were already in the e-graph and no new equality between classes has been learned
                let mut has_break = false;
                for c in wo.clone() {
                    if test_subsumption(eg, max,&c, &c_new) {
                        subsumed = true;
                        has_break = true;
                        break;
                    }
                }
                if !has_break {
                    for c in us.clone() {
                        if test_subsumption(eg, max, &c, &c_new) {
                            subsumed = true;
                            has_break = true;
                            break;
                        }
                    }
                    if !has_break {
                        if test_subsumption(eg,  max,&c0, &c_new) {
                            subsumed = true;
                        }
                    }
                }
                if !subsumed {
                    // every e-class in wo that is modified should be deleted from wo and added to us
                    // checks if c_new subsumes any other class
                    for c in wo.clone() {
                        if test_subsumption(eg, max, &c_new, &c) {
                            delete_element(eg, wo, &c_new);
                            delete_element(eg, us, &c_new);
                        }
                    }
                    for c in us.clone() {
                        if test_subsumption(eg, max,&c_new, &c) {
                            delete_element(eg, wo, &c_new);
                            delete_element(eg, us, &c_new);
                        }
                    }
                    if test_subsumption(eg, max, &c_new, c0) {
                        delete_element(eg, wo, &c_new);
                        delete_element(eg, us, &c_new);
                        subsumed = true;
                    }
                    // time check
                    elapsed_time += start.elapsed();
                    start = Instant::now();
                    if elapsed_time > *time_limit {
                        return false;
                    }
                    // TODO think about if this part is really necessary?
                    let mut v = vec![];
                    for c in vec_modified {
                        let i = eg.find_id(c.id);
                        if !v.contains(&i) {
                            v.push(i);
                        }
                    }
                    let reachable_parents = rec_parents(eg, wo, &v); 
                    for rp in reachable_parents {
                        delete_element(eg, wo, &rp);
                        if !us.contains(&rp) {
                            us.push_back(rp);
                        }
                    }
                    // End TODO


                    if !us.contains(&c_new) {
                        us.push_back(c_new);
                    }
                    if subsumed { 
                        return false;
                    }
                }
            }
        }
    }
    return true;
}