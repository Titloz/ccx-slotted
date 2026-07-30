/* /* use std::{collections::{HashMap, HashSet, VecDeque}}; // , hash::Hash
use rand::prelude::*;
use crate::*;
//use rustc_hash::FxBuildHasher;

pub(crate) type Unifier = HashMap<Slot, AppliedId>;

fn compute_mgus(eg: &MyEGraph, a: &AppliedId, b: &AppliedId, mu: &Unifier, visited: &HashSet<(AppliedId, AppliedId)>)
     -> (Vec<Unifier>, HashSet<(AppliedId, AppliedId)>) {
    //println!("compute_mgus - entry with a = {:?} and b = {:?}", a.id, b.id);
    let mut l : Vec<Unifier> = vec![];
    if visited.contains(&(a.clone(),b.clone())) || visited.contains(&(b.clone(),a.clone())) {
        return (l, visited.clone());
    }

    let mut visited_bis = visited.clone();
    visited_bis.insert((a.clone(),b.clone()));
    // possibly change this part. directly use the language instead?
    for na in eg.enodes_applied(&a) {
        for nb in eg.enodes_applied(&b) {
            match (na.clone(), nb) {
                (SimpleLang::App(ref c1, ref c2), SimpleLang::App(ref c3, ref c4)) => {
                    // Dec
                    let (mu2s, visited_left) = compute_mgus(eg, c1, c3, mu, &visited_bis);
                    let mut l_res = vec![];
                    for mu2 in mu2s {
                        let (mu3s, _) = compute_mgus(eg, c2, c4, &mu2, &visited_left);
                        for mu3 in mu3s {
                            l_res.push(mu3);
                        }
                    }
                    for sigma in l_res {
                        if !l.contains(&sigma) {
                            l.push(sigma);
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
                                let (l_bis, _) = &compute_mgus(eg, c, b, mu, &visited_bis);
                                for el in l_bis {
                                    if !l.contains(&el) {
                                        l.push(el.clone());
                                    }
                                }
                            },
                            None => {
                                if !occ(mu, b, &y) {
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
                            let (l_bis,_) = &compute_mgus(eg, c, b, mu, &visited_bis);
                            for el in l_bis {
                                if !l.contains(el) {
                                    l.push(el.clone());
                                }
                            }
                        },
                        None => {
                            if !occ(mu, b, &y) {
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
                            let (l_bis, _) = &compute_mgus(eg, a, c, mu, &visited_bis);
                            for el in l_bis {
                                if !l.contains(el) {
                                    l.push(el.clone());
                                }
                            }
                        },
                        None => {
                            if !occ(mu, a, &x) {
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
    return (l, visited_bis);
}


// as of now, this function just replaces AppliedIds by Ids in visited. 
// this is not complete.
// what we want is actually to compute it once for the shape, and to retrieve the result every time it is called
// for actual AppliedIds
// TODO
//pub(crate) type Unifier = HashMap<Slot, AppliedId>;
 
/// Memoization table for `compute_mgus`, keyed by the pair of e-class [`Id`]s.
///
/// * `InProgress` plays the role of the old `visited` set: the pair is
///   currently being computed further up the call stack, so we cut the loop.
/// * `Done(ra, rb, mgus)` stores the applied-ids the computation was actually
///   made for (the "representatives") together with its result. For any later
///   query `(c, d)` with `c.id == ra.id` and `d.id == rb.id`, the result is
///   recovered by matching the slots of `c` onto those of `ra` and the slots
///   of `d` onto those of `rb`, instead of recomputing.
pub(crate) enum MguMemoEntry {
    InProgress,
    Done(AppliedId, AppliedId, Unifier, Vec<Unifier>),
}
pub(crate) type MguMemo = HashMap<(Id, Id), MguMemoEntry>;
 
/// The renaming of external slots that turns the representative pair
/// `(ra, rb)` into the queried pair `(a, b)`.
/// Requires `ra.id == a.id` and `rb.id == b.id`. Since the slot maps of two
/// applied-ids of the same e-class share their domain (the internal slots of
/// the class), the renaming maps, for every internal slot `s`,
/// `ra.m[s] -> a.m[s]` and `rb.m[s] -> b.m[s]`.
///
/// Returns `None` when the two pairs do not have the same slot-sharing
/// pattern, i.e. when the union of the two renamings is not a well-defined
/// bijection (e.g. `a` and `b` share a slot where `ra` and `rb` don't, or
/// vice versa). In that case the result cannot be transported and must be
/// recomputed.
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
 
/// Apply the renaming `r` to the external slots of an applied-id.
/// Returns `None` if this would break the bijection invariant of `AppliedId`
/// (a renamed slot colliding with an untouched one); in that case the result
/// cannot be transported and must be recomputed.
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
 
/// Try to answer `compute_mgus(a, b, mu)` from a memo entry computed for the
/// representatives `(ra, rb)` under `mu_repr`. This is possible when the slots
/// of `a`/`b` match those of `ra`/`rb` through a renaming `r` AND `mu` is
/// exactly `mu_repr` renamed through `r`: the whole computation is equivariant
/// under slot renamings, so the results are the stored ones renamed by `r`.
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
 
fn compute_mgus_bis(eg: &MyEGraph, a: &AppliedId, b: &AppliedId, mu: &Unifier, memo: &mut MguMemo) -> Vec<Unifier> {
 
    // Canonicalize, so that every call about the same pair of e-classes uses
    // the same key, and so that the slot maps of `a` and of the stored
    // representative are defined on the same internal slots.
    let a = eg.find_applied_id(a);
    let b = eg.find_applied_id(b);
    let key = (a.id, b.id);
 
    match memo.get(&key) {
        // This pair (of e-classes) is being computed further up the call
        // stack: cut the loop, like the old `visited` check did.
        Some(MguMemoEntry::InProgress) => return vec![],
        // Already computed for a pair of applied-ids of the same e-classes:
        // transport the result by renaming the slots.
        Some(MguMemoEntry::Done(ra, rb, mu_repr, results)) => {
            if let Some(l) = transport_results(ra, rb, mu_repr, results, &a, &b, mu) {
                return l;
            }
            // Either the slot patterns are incompatible or the substitution
            // context `mu` differs from the stored one: fall through and
            // recompute (the entry is overwritten below with the new context).
        }
        None => {
            // mirrors the old `visited.contains(&(b, a))` check
            if let Some(MguMemoEntry::InProgress) = memo.get(&(b.id, a.id)) {
                return vec![];
            }
        }
    }
 
    memo.insert(key, MguMemoEntry::InProgress);
 
    let mut l: Vec<Unifier> = vec![];
    for na in eg.enodes_applied(&a) {
        for nb in eg.enodes_applied(&b) {
            match (na.clone(), nb) {
                (SimpleLang::App(ref c1, ref c2), SimpleLang::App(ref c3, ref c4)) => {
                    // Dec
                    let mu2s = compute_mgus_bis(eg, c1, c3, mu, memo);
                    for mu2 in mu2s {
                        let mu3s = compute_mgus_bis(eg, c2, c4, &mu2, memo);
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
                                let l_bis = compute_mgus_bis(eg, &c.clone(), &b, mu, memo);
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
                            let l_bis = compute_mgus_bis(eg, &c.clone(), &b, mu, memo);
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
                            let l_bis = compute_mgus_bis(eg, &a, &c.clone(), mu, memo);
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


/* 
fn dec_case(eg: &MyEGraph, equalities: &mut Vec<(&AppliedId, &AppliedId)>, pairs: Vec<(Unifier, HashSet<(AppliedId, AppliedId)>)>)
    -> Vec<(Unifier, HashSet<(AppliedId, AppliedId)>)> {
    if equalities.len() == 0 {
        let mut pairs_cp = Vec::new();
        for (mu, v) in pairs {
            pairs_cp.push((mu.clone(), v.clone()));
        }
        return pairs_cp;
    }
    let (c,c_bis) = equalities.pop().unwrap();
    let mut l = Vec::new();
    for (mu, visited) in pairs {
        let (res, v_bis) = compute_mgus(eg, c, c_bis, &mu, &visited);
        for el in res {
            l.push((el, v_bis.clone()));
        }
    }
    return dec_case(eg, equalities, l);
}
*/

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

fn apply_unifier_class_init(eg: &mut MyEGraph, mu: &Unifier, c0: &AppliedId, c1: &AppliedId) -> (AppliedId, Vec<AppliedId>) {
    let mut visited: HashMap<Id, AppliedId> = HashMap::new();
    //let mut visited: HashMap<Id, (AppliedId, bool)> = HashMap::new();
    let (nc0, v0) = apply_unifier_class(eg, mu, c0, &mut visited); //_norec 
    let (nc1, v1) = apply_unifier_class(eg, mu, c1, &mut visited); //_norec

    let mut v = v0;
    for c in v1 {
        if !v.contains(&c) {
            v.push(c);
        }
    }
    //let nc_id = eg.find_id(nc0.id);
    //let nc : AppliedId = eg.mk_identity_applied_id(nc_id); // or just let nc = eg.find_applied_id(&nc0) ?
    //let nc = eg.find_applied_id(&nc0);
    println!("apply_unifier_class_init - before union with nc0 = {:?} and nc1 = {:?}", nc0, nc1);
    //println!("nc = {:?}", nc);
    if eg.union(&nc0, &nc1) {
        println!("apply_unifier_class_init - union true");
        v.push(eg.find_applied_id(&nc0).clone());
    }
    println!("apply_unifier_class_init - union false");
    (eg.find_applied_id(&nc0), v)
}

fn apply_unifier_class_norec(eg: &mut MyEGraph, mu: &Unifier, c0: &AppliedId, visited: &mut HashMap<Id, (AppliedId, bool)>) -> (AppliedId, Vec<AppliedId>) {
    println!("mu = {:?}", mu);
    println!("id = {:?}", c0.id);
    println!("slots = {:?}", c0.slots());
    // my feeling is that this Vec<AppliedId> thing is not useful.
    //let mut visited: HashMap<Id, (AppliedId, bool)> = HashMap::new();
    let mut in_visit: HashMap<Id, usize> = HashMap::new();
    let mut i;
    let mut app_id;

    let mut nodes;
    let mut nb_nodes;
    let mut j;
    let mut enode;
    let mut new_class = c0.clone();
    let mut v: Vec<AppliedId> = vec![];
    let mut call_stack : Vec<AppliedId> = vec![c0.clone()];
    let mut success_left;
    let mut success;
    let mut has_unioned;
    //let mut counter = 0;
    'loopw: while visited.get(&eg.find_id(c0.id)) == None { // && !call_stack.is_empty()         && counter < 20 
        /*print!("call_stack = [");
        for el in call_stack.clone() {
            let id = el.id;
            print!("{:?};", id);
        }
        print!("]\n"); */
        /*if call_stack.is_empty() {
            println!("no call stack");
            call_stack.push(c0.clone());
        }*/
        //counter += 1;
        app_id = call_stack.pop().unwrap();
        i = eg.find_id(app_id.id);
        success = false;
        has_unioned = false;
        let mut not_fully_applied = false;
        for y in mu.keys() {
            for z in app_id.slots() {
                if *y==z {
                    not_fully_applied = true;
                }
            }
        }
        if !not_fully_applied {
            visited.insert(i, (app_id.clone(), true));
            continue 'loopw;
        }
        match visited.get(&i) {
            None => {
                match in_visit.get(&i) {
                    None => {
                        j = 0;
                        let _ = in_visit.insert(i, 0);
                    },
                    Some(k) => {
                        j = *k;
                    }
                }
                nodes = eg.enodes_applied(&app_id);
                nb_nodes = nodes.len();
                if nb_nodes == 0 {
                    visited.insert(i, (app_id.clone(), true));
                    new_class = app_id;
                    continue 'loopw;
                }
                //if j < nb_nodes - 1 {
                //    let _ = in_visit.insert(i, j+1);
                //}
                enode = &nodes[j];
                success_left = false;
                match enode {
                    SimpleLang::App(c1, c2) => {
                        match visited.get(&eg.find_id(c1.id)) {
                            None => {
                                call_stack.push(app_id.clone());
                                call_stack.push(c1.clone());
                            },
                            Some((resc1, _vc1)) => {
                                new_class = resc1.clone();
                                success_left = true;
                            },
                        }
                        match visited.get(&eg.find_id(c2.id)) {
                            None => {
                                if success_left {
                                    call_stack.push(app_id.clone());
                                }
                                call_stack.push(c2.clone());
                            },
                            Some((resc2, _vc2)) => {
                                if success_left {
                                    new_class = eg.add(SimpleLang::App(new_class.clone(), resc2.clone()));
                                    visited.insert(i,(new_class.clone(), false));
                                    success = true;
                                }
                            }
                        }
                    },
                    SimpleLang::Var(x) => {
                        match mu.get(x) {
                            None => {
                                new_class = eg.add(enode.clone());
                                visited.insert(i, (new_class.clone(), false));
                                success = true;
                            },
                            Some(c) => {
                                // what is the sound behavior?
                                // 1) (and do I have to change the variables here?)
                                // note: this can only be sound if c does not contain any variable in the domain of mu
                                // it does not sound true if mu is "triangular"
                                //new_class = c.clone();
                                //visited.insert(i, (new_class.clone(), v.clone()));
                                //success = true;
                                // or 2) (same question) + looks very inefficient... is this really the right option?
                                //println!("some case");
                                /*let mut not_fully_applied = false;
                                for y in mu.keys() {
                                    for z in c.slots() {
                                        if *y==z { // z!=*x
                                            not_fully_applied = true;
                                        }
                                    }
                                }
                                if !not_fully_applied {
                                    visited.insert(eg.find_id(c.id), (c.clone(), true));
                                } else if !call_stack.contains(&c) {
                                    call_stack.push(c.clone());
                                }*/
                                new_class = c.clone();
                                visited.insert(i, (new_class.clone(), true));
                            },
                        }
                    },
                    _ => {
                        new_class = eg.add(enode.clone());
                        visited.insert(i, (new_class.clone(), false));
                        success = true;
                    },
                }
                if success {
                    let mut class_n;
                    let mut left_class;
                    for n in nodes {
                        match n {
                            SimpleLang::App(c1, c2) => {
                                match visited.get(&eg.find_id(c1.id)) {
                                    None => {
                                        call_stack.push(app_id);
                                        call_stack.push(c1.clone());
                                        continue 'loopw;
                                    },
                                    Some((c11,_)) => {
                                        left_class = c11.clone();
                                    },
                                }
                                match visited.get(&eg.find_id(c2.id)) {
                                    None => {
                                        call_stack.push(app_id);
                                        call_stack.push(c2.clone());
                                        continue 'loopw;
                                    },
                                    Some((c22,_)) => {
                                        class_n = eg.add(SimpleLang::App(left_class, c22.clone()));
                                    }
                                }
                            },
                            SimpleLang::Var(x) => {
                                match mu.get(&x) {
                                    None => {
                                        class_n = eg.add(n.clone());
                                    },
                                    Some(c) => {
                                        /*match visited.get(&eg.find_id(c.id)) {
                                            None => {
                                                call_stack.push(app_id);
                                                call_stack.push(c.clone());
                                                continue 'loopw;
                                            }, // we can not have all equalities 
                                            Some((cnew, _)) => class_n = cnew.clone(), 
                                        }*/
                                        // TEMPORARY?
                                        class_n = c.clone();
                                    },
                                }
                            },
                            _ => {
                                class_n = eg.add(n.clone());
                            }
                        }
                        if eg.union(&new_class, &class_n) {
                            has_unioned = true;
                        }
                    }
                    if has_unioned && !v.contains(&new_class) {
                        v.push(new_class.clone());
                    }
                    visited.insert(i, (new_class.clone(), true));
                } else {
                    if j < nb_nodes - 1 {
                        let _ = in_visit.insert(i, j+1);
                    } else {
                        let _ = in_visit.insert(i, 0); // cyclic behavior
                    }
                    continue 'loopw; 
                }
            },
            Some((nc, nv)) => {
                new_class = nc.clone();
                if !(*nv) {
                    let mut class_n;
                    let mut left_class;
                    let nodes = eg.enodes_applied(&app_id);
                    for n in nodes {
                        match n {
                            SimpleLang::App(c1, c2) => {
                                match visited.get(&eg.find_id(c1.id)) {
                                    None => {
                                        call_stack.push(app_id);
                                        call_stack.push(c1.clone());
                                        continue 'loopw;
                                    },
                                    Some((c11,_)) => {
                                        left_class = c11.clone();
                                    },
                                }
                                match visited.get(&eg.find_id(c2.id)) {
                                    None => {
                                        call_stack.push(app_id);
                                        call_stack.push(c2.clone());
                                        continue 'loopw;
                                    },
                                    Some((c22,_)) => {
                                        class_n = eg.add(SimpleLang::App(left_class, c22.clone()));
                                    }
                                }
                            },
                            SimpleLang::Var(x) => {
                                match mu.get(&x) {
                                    None => {
                                        class_n = eg.add(n.clone());
                                    },
                                    Some(c) => {
                                        match visited.get(&eg.find_id(c.id)) {
                                            None => {
                                                call_stack.push(app_id);
                                                call_stack.push(c.clone());
                                                continue 'loopw;
                                            }, // we can not have all equalities 
                                            Some((cnew, _)) => class_n = cnew.clone(), 
                                        }
                                    },
                                }
                            },
                            _ => {
                                class_n = eg.add(n.clone());
                            },
                        }
                        if eg.union(&new_class, &class_n) {
                            has_unioned = true;
                        }
                    }
                    if has_unioned && !v.contains(&new_class) {
                        v.push(new_class.clone());
                    }
                    visited.insert(i, (new_class.clone(), true));
                }
            },
        }
    }
    let (c, _) = visited.get(&eg.find_id(c0.id)).unwrap();
    return (c.clone(), v)
}

fn apply_unifier_class(eg: &mut MyEGraph, mu: &Unifier, c0: &AppliedId, visited: &mut HashMap<Id, AppliedId>) -> (AppliedId, Vec<AppliedId>) {
    let i = eg.find_id(c0.id);
    match visited.get(&i) {
        None => {
            //let number_nodes = eg.classes[&c0.id].nodes.len();
            let nodes = eg.enodes_applied(c0);
            //println!("number_nodes in class = {} and applied_nodes = {}", number_nodes, nodes.len());
            //assert_ne!(nodes.len(), 0, "empty e-class!");
            if nodes.len() == 0 {
                visited.insert(i, c0.clone());
                return (c0.clone(), vec![]);
            }
            println!("nodes.len() = {}", nodes.len());
            // In order to almost surely avoid being stuck in a loop, we need to pick the enode randomly each time. 
            // There must be one enode that can be applied without necessarily looping, and we are almost sure to find it.
            // Note: there might be a way to automatically get it... Maybe provide an e-class analysis that stores all nodes
            // that can reach a class from which the first class is not reachable?
            let mut rng = rand::rng();
            let j = (0..nodes.len()).choose(&mut rng).unwrap();
            let enode = &nodes[j];

            let (new_class, new_v) = apply_unifier_enode(eg, mu, enode.clone(), visited);
            visited.insert(i, new_class.clone()); // probably does not work if this eclass if reachable from this enode. Can I allocate a new (empty) eclass?
            let mut v = new_v;
            let mut has_unioned = false;
            for n in nodes {
                let (class_n, vn) = apply_unifier_enode(eg, mu, n, visited);
                if eg.union(&new_class, &class_n) {
                    has_unioned = true;
                    for c in vn {
                        if !v.contains(&c) {
                            v.push(c);
                        }
                    }
                }
            }

            if has_unioned {
                v.push(new_class.clone());
            }

            (new_class, v)
        },
        Some(c) => (c.clone(), vec![]),
    }
}

fn apply_unifier_enode(eg: &mut MyEGraph, mu: &Unifier, n: SimpleLang, visited: &mut HashMap<Id, AppliedId>) -> (AppliedId, Vec<AppliedId>) {
    match n {
        SimpleLang::App(c1, c2) => {
            let (c3, v3) = apply_unifier_class(eg, mu, &c1, visited);
            let (c4, v4) = apply_unifier_class(eg, mu, &c2, visited);
            let mut v = v3.clone();
            for c in v4 {
                if !v3.contains(&c) {
                    v.push(c);
                }
            }
            (eg.add(SimpleLang::App(c3, c4)), v) 
        },
        SimpleLang::Var(x) => {
            match mu.get(&x) {
                None => {
                    println!("just checking - None");
                    (eg.add(n), vec![])
                }, 
                Some(c) => {
                    println!("just checking");
                    apply_unifier_class(eg, mu, c, visited)
                }, 
            }
        },
        _ => (eg.add(n), vec![]), // nothing new is added but maybe i learn some equalities about e-classes
    }
}

fn rec_parents(eg: &MyEGraph, wo: &VecDeque<AppliedId>, changed: &Vec<Id>) -> Vec<AppliedId> {
    let mut v: Vec<AppliedId> = vec![];
    let mut visited: HashMap<Id, bool> = HashMap::new();
    for c0 in wo {
        let res_class = rec_parents_class(eg, c0, changed, &mut visited);
        if res_class {
            v.push(c0.clone());
        }
    }
    v
}

fn rec_parents_class(eg: &MyEGraph, c0: &AppliedId, changed: &Vec<Id>, visited: &mut HashMap<Id, bool>) -> bool {
    let i = eg.find_id(c0.id);
    match visited.get(&i) {
        None => {
            if changed.contains(&i) {
                visited.insert(i, true);
                return true;
            }
            let nodes = eg.enodes_applied(c0);
            for n in nodes {
                if rec_parents_nodes(eg, n, changed, visited) {
                    visited.insert(i, true);
                    return true;
                }
            }
            visited.insert(i, false);
            false
        },
        Some(b) => *b,
    } 
}

fn rec_parents_nodes(eg: &MyEGraph, n: SimpleLang, changed: &Vec<Id>, visited: &mut HashMap<Id, bool>) -> bool {
    match n {
        SimpleLang::App(c1, c2) => {
            rec_parents_class(eg, &c1, changed, visited) || rec_parents_class(eg, &c2, changed, visited)
        },
        _ => false,
    }
}

/// Non-recursive version of `rec_parents`: returns the elements of `wo` from
/// whose e-class some class of `changed` is reachable, following the children
/// of `App` nodes.
///
/// Instead of recursing downwards from every element of `wo`, this computes
/// once, by a breadth-first traversal of the *reversed* child graph starting
/// from `changed`, the set of all e-classes that can reach a changed class,
/// and then filters `wo` by membership. Unlike the recursive version, this
/// also terminates on cyclic e-graphs.
fn reach_parents(eg: &MyEGraph, wo: &VecDeque<AppliedId>, changed: &Vec<Id>) -> Vec<AppliedId> {
    // 1. Reversed child graph: for every e-class, the classes that contain an
    //    App node having it as a child.
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
    // 2. BFS from the changed classes along the reversed edges:
    //    `reaches` collects every e-class from which a changed class is reachable
    //    (the changed classes themselves included, as in the recursive version).
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
    // 3. Keep the elements of `wo` whose e-class reaches a changed class.
    let mut v: Vec<AppliedId> = vec![];
    for c0 in wo {
        if reaches.contains(&eg.find_id(c0.id)) {
            v.push(c0.clone());
        }
    }
    v
}



pub(crate) fn merge(eg: &mut MyEGraph, max: u64, wo: &mut VecDeque<AppliedId>, us: &mut VecDeque<AppliedId>, c0: &AppliedId) -> bool {
    println!("merge - entry");
    let w1 = wo.clone();
    println!("merge - size(w1) = {}", w1.len());
    for c1 in w1 {
        // quite unsure about this beginning
        //let hash_builder = rustc_hash::FxBuildHasher::from(FxBuildHasher {});
        let empty = HashMap::new();
        //let mut visited = HashSet::new();//with_hasher(hash_builder);
        println!("merge - before compute_mgus, eg has {:?} eclasses", eg.classes.len());
        //let (mgus,_) = compute_mgus(eg, c0, &c1, &empty, &visited); // compute_mgus, this version is not complete
        let mut memo: MguMemo = HashMap::new();
        let mgus = compute_mgus_bis(eg, c0, &c1, &empty, &mut memo);
        println!("merge - after compute_mgus");
        for mu in mgus {
            println!("there is a mu, mu = {:?}", mu);
            let (c_new, vec_modified) = apply_unifier_class_init(eg, &mu, c0, &c1); // there seems to be a slot issue happening here
            eg.rebuild(); 
            println!("merge - wo = {:?}", wo);
            println!("merge - us = {:?}", us);
            update(eg, wo);
            update(eg, us);
            println!("merge 2 - wo = {:?}", wo);
            println!("merge 2 - us = {:?}", us);
            //wo_no_us(wo, us);
            // satisfiability of the class tested by the analyses
            if *eg.analysis_data(c_new.id) <= max {
                let subsumed = vec_modified.is_empty(); // all nodes that were added were already in the e-graph and no new equality between classes has been learned
                // porbably an error here: it does not seem to reach
                if !subsumed {
                    // every e-class in wo that is modified should be deleted from wo and added to us
                    /* for c in wo.clone() {
                        if eg.find_id(c_new.id) == eg.find_id(c.id) {
                            let reachable_parents = rec_parents(eg, &c);
                            for c_bis in &reachable_parents {
                                if wo.contains(c_bis) {
                                    delete_element(eg, wo, c_bis);
                                    if !us.contains(&c_bis) {
                                        us.push_back(c_bis.clone());
                                    }
                                }
                            }
                        }
                        delete_element(eg, us, &c); 
                        if eg.find_id(c.id) == eg.find_id(c0.id) {
                            subsumed = true;
                        }
                    }
                    if !subsumed {
                        /* if an e-class is already in us, even if modified, it should stay in us!
                        //let mut new_subsumed = false;
                        for c in us.clone() {
                            if eg.find_id(c_new.id) == eg.find_id(c.id) {
                                todo!()
                            } 
                        } */
                        if !subsumed {
                            if eg.find_id(c_new.id) == eg.find_id(c0.id) {
                                todo!()
                            }
                        }
                    } */
                    let mut v = vec![];
                    for c in vec_modified {
                        let i = eg.find_id(c.id);
                        if !v.contains(&i) {
                            v.push(i);
                        }
                    }
                    println!("before rec_parents");
                    let reachable_parents = reach_parents(eg, wo, &v); 
                    println!("after rec_parents");
                    for rp in reachable_parents {
                        delete_element(eg, wo, &rp);
                        if !us.contains(&rp) {
                            us.push_back(rp);
                        }
                    }
                    if !us.contains(&c_new) {
                        us.push_back(c_new);
                    }
                    if subsumed { // as of now, unreachable
                        return false;
                    }
                }
            }
        }
    }
    return true;
} */



use std::collections::{HashMap, HashSet, VecDeque};

use crate::*;
//use rustc_hash::FxBuildHasher;

pub(crate) type Unifier = HashMap<Slot, AppliedId>;

/// Memoization table for `compute_mgus`, keyed by the pair of e-class [`Id`]s.
///
/// * `InProgress` plays the role of the old `visited` set: the pair is
///   currently being computed further up the call stack, so we cut the loop.
/// * `Done(ra, rb, mgus)` stores the applied-ids the computation was actually
///   made for (the "representatives") together with its result. For any later
///   query `(c, d)` with `c.id == ra.id` and `d.id == rb.id`, the result is
///   recovered by matching the slots of `c` onto those of `ra` and the slots
///   of `d` onto those of `rb`, instead of recomputing.
pub(crate) enum MguMemoEntry {
    InProgress,
    Done(AppliedId, AppliedId, Unifier, Vec<Unifier>),
}
pub(crate) type MguMemo = HashMap<(Id, Id), MguMemoEntry>;

/// The renaming of external slots that turns the representative pair
/// `(ra, rb)` into the queried pair `(a, b)`.
/// Requires `ra.id == a.id` and `rb.id == b.id`. Since the slot maps of two
/// applied-ids of the same e-class share their domain (the internal slots of
/// the class), the renaming maps, for every internal slot `s`,
/// `ra.m[s] -> a.m[s]` and `rb.m[s] -> b.m[s]`.
///
/// Returns `None` when the two pairs do not have the same slot-sharing
/// pattern, i.e. when the union of the two renamings is not a well-defined
/// bijection (e.g. `a` and `b` share a slot where `ra` and `rb` don't, or
/// vice versa). In that case the result cannot be transported and must be
/// recomputed.
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

/// Apply the renaming `r` to the external slots of an applied-id.
/// Returns `None` if this would break the bijection invariant of `AppliedId`
/// (a renamed slot colliding with an untouched one); in that case the result
/// cannot be transported and must be recomputed.
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

/// Try to answer `compute_mgus(a, b, mu)` from a memo entry computed for the
/// representatives `(ra, rb)` under `mu_repr`. This is possible when the slots
/// of `a`/`b` match those of `ra`/`rb` through a renaming `r` AND `mu` is
/// exactly `mu_repr` renamed through `r`: the whole computation is equivariant
/// under slot renamings, so the results are the stored ones renamed by `r`.
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

fn compute_mgus(eg: &MyEGraph, a: &AppliedId, b: &AppliedId, mu: &Unifier, memo: &mut MguMemo, budget: &mut usize) -> Vec<Unifier> {
    // Canonicalize, so that every call about the same pair of e-classes uses
    // the same key, and so that the slot maps of `a` and of the stored
    // representative are defined on the same internal slots.
    let a = eg.find_applied_id(a);
    let b = eg.find_applied_id(b);
    let key = (a.id, b.id);

    match memo.get(&key) {
        // This pair (of e-classes) is being computed further up the call
        // stack: cut the loop, like the old `visited` check did.
        Some(MguMemoEntry::InProgress) => return vec![],
        // Already computed for a pair of applied-ids of the same e-classes:
        // transport the result by renaming the slots.
        Some(MguMemoEntry::Done(ra, rb, mu_repr, results)) => {
            if let Some(l) = transport_results(ra, rb, mu_repr, results, &a, &b, mu) {
                return l;
            }
            // Either the slot patterns are incompatible or the substitution
            // context `mu` differs from the stored one: fall through and
            // recompute (the entry is overwritten below with the new context).
        }
        None => {
            // mirrors the old `visited.contains(&(b, a))` check
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

/* 
fn dec_case(eg: &MyEGraph, equalities: &mut Vec<(&AppliedId, &AppliedId)>, pairs: Vec<(Unifier, HashSet<(AppliedId, AppliedId)>)>)
    -> Vec<(Unifier, HashSet<(AppliedId, AppliedId)>)> {
    if equalities.len() == 0 {
        let mut pairs_cp = Vec::new();
        for (mu, v) in pairs {
            pairs_cp.push((mu.clone(), v.clone()));
        }
        return pairs_cp;
    }
    let (c,c_bis) = equalities.pop().unwrap();
    let mut l = Vec::new();
    for (mu, visited) in pairs {
        let (res, v_bis) = compute_mgus(eg, c, c_bis, &mu, &visited);
        for el in res {
            l.push((el, v_bis.clone()));
        }
    }
    return dec_case(eg, equalities, l);
}
*/

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

/// Unifier application.
///
/// `sigma_class(c)` computes an applied-id representing the instantiation of
/// `c` under `mu`: every exposed slot of `c` that is bound by `mu` is replaced
/// by (the instantiation of) its binding, the other slots are kept as
/// variables.
///
/// Design notes, addressing the unsoundness of the previous version:
/// * The memo is keyed by the **canonicalized `AppliedId`**, never by the
///   e-class `Id` alone: within one application `mu` is fixed, so the
///   instantiation is a function of the applied-id (class + slot map), while
///   two occurrences of the same class under different slot maps instantiate
///   differently.
/// * An occurrence none of whose exposed slots is bound instantiates to
///   itself. This is decided (and returned) **per occurrence**; it is never
///   recorded for the whole class. In particular, occurrences under fresh
///   slots — which is how `enodes_applied` materializes redundant slots —
///   take this path and can never poison other occurrences.
/// * Bindings of `mu` may themselves expose bound slots ("triangular"
///   unifiers): `Var(x) -> mu(x)` recurses into `sigma_class(mu(x))`, so
///   bindings are applied to exhaustion. Cycles through the e-graph or
///   through a cyclic unifier are detected with an `in_progress` set (plus a
///   global budget as a safety net); an enode whose instantiation would
///   re-enter an occurrence already being instantiated is skipped, which is
///   sound: `merge` then simply learns fewer equalities from this `mu`.
struct ApplyCtx<'a> {
    mu: &'a Unifier,
    /// canonical applied-id -> its instantiation (both at insertion time;
    /// lookups re-canonicalize, stale keys just miss and are recomputed)
    memo: HashMap<AppliedId, AppliedId>,
    /// canonical applied-ids currently being instantiated (cycle detection)
    in_progress: HashSet<AppliedId>,
    /// classes changed by a union performed during the application
    changed: Vec<AppliedId>,
    /// safety net against pathological interactions between the recursion
    /// and the e-graph mutations it performs
    budget: usize,
}

impl<'a> ApplyCtx<'a> {
    fn new(mu: &'a Unifier) -> Self {
        ApplyCtx {
            mu,
            memo: HashMap::new(),
            in_progress: HashSet::new(),
            changed: Vec::new(),
            budget: 100000,
        }
    }

    fn record_union(&mut self, eg: &MyEGraph, c: &AppliedId) {
        let f = eg.find_applied_id(c);
        if !self.changed.contains(&f) {
            self.changed.push(f);
        }
    }
}

/// Instantiate the class occurrence `c` under `ctx.mu`.
/// Returns `None` when the instantiation cannot be completed on this path
/// (cyclic dependency or exhausted budget); the caller must then skip.
fn sigma_class(eg: &mut MyEGraph, ctx: &mut ApplyCtx, c: &AppliedId) -> Option<AppliedId> {
    if ctx.budget == 0 {
        return None;
    }
    ctx.budget -= 1;

    let c = eg.find_applied_id(c);

    // Occurrence-local shortcut: nothing to substitute in this occurrence.
    // (Only returned, never recorded class-wide.)
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

    // The first enode that can be instantiated defines the image class; the
    // instantiations of the remaining enodes are unioned into it. Enodes
    // whose instantiation loops back into an in-progress occurrence are
    // skipped (sound: we only learn fewer equalities).
    let mut image: Option<AppliedId> = None;
    for n in nodes {
        if let Some(cn) = sigma_enode(eg, ctx, n) {
            image = Some(match image {
                None => cn,
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

    ctx.in_progress.remove(&c);

    match image {
        Some(im) => {
            let im = eg.find_applied_id(&im);
            ctx.memo.insert(eg.find_applied_id(&c), im.clone());
            Some(im)
        }
        // No enode could be instantiated (all cyclic), or the class was
        // empty: give up on this occurrence.
        None => None,
    }
}

/// Instantiate one enode under `ctx.mu`.
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

/// Instantiate `c0` and `c1` under `mu` and union the two images.
/// Returns the (found) image of `c0` together with the list of classes
/// changed by the unions performed along the way; the list is empty iff
/// nothing new was learned (which includes the case where one of the two
/// instantiations could not be completed).
fn apply_unifier_class_init(eg: &mut MyEGraph, mu: &Unifier, c0: &AppliedId, c1: &AppliedId) -> (AppliedId, Vec<AppliedId>) {
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

/// Non-recursive version of `rec_parents`: returns the elements of `wo` from
/// whose e-class some class of `changed` is reachable, following the children
/// of `App` nodes.
///
/// Instead of recursing downwards from every element of `wo`, this computes
/// once, by a breadth-first traversal of the *reversed* child graph starting
/// from `changed`, the set of all e-classes that can reach a changed class,
/// and then filters `wo` by membership. Unlike the recursive version, this
/// also terminates on cyclic e-graphs.
fn rec_parents(eg: &MyEGraph, wo: &VecDeque<AppliedId>, changed: &Vec<Id>) -> Vec<AppliedId> {
    // 1. Reversed child graph: for every e-class, the classes that contain an
    //    App node having it as a child.
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
    // 2. BFS from the changed classes along the reversed edges:
    //    `reaches` collects every e-class from which a changed class is reachable
    //    (the changed classes themselves included, as in the recursive version).
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
    // 3. Keep the elements of `wo` whose e-class reaches a changed class.
    let mut v: Vec<AppliedId> = vec![];
    for c0 in wo {
        if reaches.contains(&eg.find_id(c0.id)) {
            v.push(c0.clone());
        }
    }
    v
}

pub(crate) fn merge(eg: &mut MyEGraph, max: u64, wo: &mut VecDeque<AppliedId>, us: &mut VecDeque<AppliedId>, c0: &AppliedId) -> bool {
    let w1 = wo.clone();
    for c1 in w1 {
        // one memo table per (c0, c1) pair: the e-graph is mutated inside the
        // `for mu in mgus` loop below, which would invalidate cached results
        let empty = HashMap::new();
        let mut memo: MguMemo = HashMap::new();
        //println!("merge - before compute_mgus");
        let mgus = compute_mgus(eg, c0, &c1, &empty, &mut memo, &mut 1000);
        let nb_limit = 5;
        let mut count = 0;
        for mu in mgus {
            if count >= nb_limit {
                break;
            }
            count += 1;
            //println!("there is a mu");
            let (c_new, vec_modified) = apply_unifier_class_init(eg, &mu, c0, &c1);
            eg.rebuild();
            //println!("merge - wo = {:?}", wo);
            //println!("merge - us = {:?}", us);
            update(eg, wo);
            update(eg, us);
            //println!("merge 2 - wo = {:?}", wo);
            //println!("merge 2 - us = {:?}", us);
            //wo_no_us(wo, us);
            // satisfiability of the class tested by the analyses
            if *eg.analysis_data(c_new.id) <= max {
                let subsumed = vec_modified.is_empty(); // all nodes that were added were already in the e-graph and no new equality between classes has been learned
                // porbably an error here: it does not seem to reach
                if !subsumed {
                    // every e-class in wo that is modified should be deleted from wo and added to us
                    /* for c in wo.clone() {
                        if eg.find_id(c_new.id) == eg.find_id(c.id) {
                            let reachable_parents = rec_parents(eg, &c);
                            for c_bis in &reachable_parents {
                                if wo.contains(c_bis) {
                                    delete_element(eg, wo, c_bis);
                                    if !us.contains(&c_bis) {
                                        us.push_back(c_bis.clone());
                                    }
                                }
                            }
                        }
                        delete_element(eg, us, &c); 
                        if eg.find_id(c.id) == eg.find_id(c0.id) {
                            subsumed = true;
                        }
                    }
                    if !subsumed {
                        /* if an e-class is already in us, even if modified, it should stay in us!
                        //let mut new_subsumed = false;
                        for c in us.clone() {
                            if eg.find_id(c_new.id) == eg.find_id(c.id) {
                                todo!()
                            } 
                        } */
                        if !subsumed {
                            if eg.find_id(c_new.id) == eg.find_id(c0.id) {
                                todo!()
                            }
                        }
                    } */
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
                    if !us.contains(&c_new) {
                        us.push_back(c_new);
                    }
                    if subsumed { // as of now, unreachable
                        return false;
                    }
                }
            }
        }
    }
    return true;
} */

use std::collections::{HashMap, HashSet, VecDeque};
use std::cell::Cell;
use std::{panic, println, todo};

use crate::*;
//use rustc_hash::FxBuildHasher;

// --- recursion depth guard -------------------------------------------------
//
// `compute_mgus` and `sigma_class` recurse through the e-graph. On deeply
// nested (or, despite the cycle memo, pathologically structured) classes this
// can otherwise exhaust the stack -- and a real stack overflow ABORTS the
// whole process (SIGABRT), it cannot be caught by `catch_unwind` nor confined
// to a worker thread. So we cap the recursion depth explicitly: once the cap
// is reached the recursion unwinds normally, returning "no result on this
// path", which is sound (the caller simply learns fewer equalities) and keeps
// the process alive.
//
// The cap is a thread-local so the batch runner can size it per worker
// (proportionally to the worker's stack) via `set_max_recursion_depth`.

thread_local! {
    static MAX_RECURSION_DEPTH: Cell<usize> = Cell::new(DEFAULT_MAX_RECURSION_DEPTH);
    static RECURSION_DEPTH: Cell<usize> = Cell::new(0);
}

/// Default recursion cap. Chosen to stay well within an 8 MiB stack: each
/// `compute_mgus`/`sigma_class` frame plus the e-graph calls it makes is on
/// the order of a few KiB, so a few thousand frames is a safe ceiling.
pub(crate) const DEFAULT_MAX_RECURSION_DEPTH: usize = 4_000;

/// Set the recursion-depth cap for the current thread. Callers running the
/// procedure on a large-stack worker can raise this proportionally.
pub fn set_max_recursion_depth(depth: usize) {
    MAX_RECURSION_DEPTH.with(|d| d.set(depth));
}

/// RAII guard: increments the depth on creation, decrements on drop (so the
/// count is restored on every return path, including early returns). `enter`
/// returns `None` when the cap is already reached, telling the caller to bail.
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

/// Memoization table for `compute_mgus`, keyed by the pair of e-class [`Id`]s.
///
/// * `InProgress` plays the role of the old `visited` set: the pair is
///   currently being computed further up the call stack, so we cut the loop.
/// * `Done(ra, rb, mgus)` stores the applied-ids the computation was actually
///   made for (the "representatives") together with its result. For any later
///   query `(c, d)` with `c.id == ra.id` and `d.id == rb.id`, the result is
///   recovered by matching the slots of `c` onto those of `ra` and the slots
///   of `d` onto those of `rb`, instead of recomputing.
pub(crate) enum MguMemoEntry {
    InProgress,
    Done(AppliedId, AppliedId, Unifier, Vec<Unifier>),
}
pub(crate) type MguMemo = HashMap<(Id, Id), MguMemoEntry>;

/// The renaming of external slots that turns the representative pair
/// `(ra, rb)` into the queried pair `(a, b)`.
/// Requires `ra.id == a.id` and `rb.id == b.id`. Since the slot maps of two
/// applied-ids of the same e-class share their domain (the internal slots of
/// the class), the renaming maps, for every internal slot `s`,
/// `ra.m[s] -> a.m[s]` and `rb.m[s] -> b.m[s]`.
///
/// Returns `None` when the two pairs do not have the same slot-sharing
/// pattern, i.e. when the union of the two renamings is not a well-defined
/// bijection (e.g. `a` and `b` share a slot where `ra` and `rb` don't, or
/// vice versa). In that case the result cannot be transported and must be
/// recomputed.
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

/// Apply the renaming `r` to the external slots of an applied-id.
/// Returns `None` if this would break the bijection invariant of `AppliedId`
/// (a renamed slot colliding with an untouched one); in that case the result
/// cannot be transported and must be recomputed.
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

/// Try to answer `compute_mgus(a, b, mu)` from a memo entry computed for the
/// representatives `(ra, rb)` under `mu_repr`. This is possible when the slots
/// of `a`/`b` match those of `ra`/`rb` through a renaming `r` AND `mu` is
/// exactly `mu_repr` renamed through `r`: the whole computation is equivariant
/// under slot renamings, so the results are the stored ones renamed by `r`.
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

    // Depth cap: if reached, unwind with "no unifiers on this path". Sound —
    // the caller simply learns fewer equalities — and prevents a stack
    // overflow (which would abort the whole process).
    let _depth = match DepthGuard::enter() {
        Some(g) => g,
        None => return vec![],
    };

    // Canonicalize, so that every call about the same pair of e-classes uses
    // the same key, and so that the slot maps of `a` and of the stored
    // representative are defined on the same internal slots.
    let a = eg.find_applied_id(a);
    let b = eg.find_applied_id(b);
    let key = (a.id, b.id);

    match memo.get(&key) {
        // This pair (of e-classes) is being computed further up the call
        // stack: cut the loop, like the old `visited` check did.
        Some(MguMemoEntry::InProgress) => return vec![],
        // Already computed for a pair of applied-ids of the same e-classes:
        // transport the result by renaming the slots.
        Some(MguMemoEntry::Done(ra, rb, mu_repr, results)) => {
            if let Some(l) = transport_results(ra, rb, mu_repr, results, &a, &b, mu) {
                return l;
            }
            // Either the slot patterns are incompatible or the substitution
            // context `mu` differs from the stored one: fall through and
            // recompute (the entry is overwritten below with the new context).
        }
        None => {
            // mirrors the old `visited.contains(&(b, a))` check
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


pub(crate) fn compute_mgus_extern(eg: &mut MyEGraph, a: &AppliedId, b: &AppliedId) -> Vec<Unifier> {
    // extract one term per enode for both classes
    let mut a_terms: Vec<RecExpr<SimpleLang>> = vec![];
    let mut b_terms: Vec<RecExpr<SimpleLang>> = vec![];
    let extractor: Extractor<SimpleLang, AstSizeCostNoApp> = Extractor::new(eg, AstSizeCostNoApp);
    for na in eg.enodes_applied(a) {
        match na.clone() {
            SimpleLang::App(c,d) => {
                let tc = extractor.extract(&c, eg);
                let td = extractor.extract(&d, eg);
                let out: RecExpr<SimpleLang> = RecExpr { node: SimpleLang::App(AppliedId::null(), AppliedId::null()),
                     children: [tc, td].into()
                };
                a_terms.push(out);
            },
            _ => {
                let out = RecExpr {node: na.clone(), children: vec![]};
                a_terms.push(out);
            },
        }
    }
    for nb in eg.enodes_applied(b) {
        match nb.clone() {
            SimpleLang::App(c,d) => {
                let tc = extractor.extract(&c, eg);
                let td = extractor.extract(&d, eg);
                let out: RecExpr<SimpleLang> = RecExpr { node: SimpleLang::App(AppliedId::null(), AppliedId::null()),
                     children: [tc, td].into()
                };
                b_terms.push(out);
            },
            _ => {
                let out = RecExpr {node: nb.clone(), children: vec![]};
                b_terms.push(out);
            },
        }
    }
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

/// Unifier application.
///
/// `sigma_class(c)` computes an applied-id representing the instantiation of
/// `c` under `mu`: every exposed slot of `c` that is bound by `mu` is replaced
/// by (the instantiation of) its binding, the other slots are kept as
/// variables.
///
/// Design notes, addressing the unsoundness of the previous version:
/// * The memo is keyed by the **canonicalized `AppliedId`**, never by the
///   e-class `Id` alone: within one application `mu` is fixed, so the
///   instantiation is a function of the applied-id (class + slot map), while
///   two occurrences of the same class under different slot maps instantiate
///   differently.
/// * An occurrence none of whose exposed slots is bound instantiates to
///   itself. This is decided (and returned) **per occurrence**; it is never
///   recorded for the whole class. In particular, occurrences under fresh
///   slots — which is how `enodes_applied` materializes redundant slots —
///   take this path and can never poison other occurrences.
/// * Bindings of `mu` may themselves expose bound slots ("triangular"
///   unifiers): `Var(x) -> mu(x)` recurses into `sigma_class(mu(x))`, so
///   bindings are applied to exhaustion. Cycles through the e-graph or
///   through a cyclic unifier are detected with an `in_progress` set (plus a
///   global budget as a safety net); an enode whose instantiation would
///   re-enter an occurrence already being instantiated is skipped, which is
///   sound: `merge` then simply learns fewer equalities from this `mu`.
struct ApplyCtx<'a> {
    mu: &'a Unifier,
    /// canonical applied-id -> its instantiation (both at insertion time;
    /// lookups re-canonicalize, stale keys just miss and are recomputed)
    memo: HashMap<AppliedId, AppliedId>,
    /// canonical applied-ids currently being instantiated (cycle detection)
    in_progress: HashSet<AppliedId>,
    /// classes changed by a union performed during the application
    changed: Vec<AppliedId>,
    /// safety net against pathological interactions between the recursion
    /// and the e-graph mutations it performs
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

/// Instantiate the class occurrence `c` under `ctx.mu`.
/// Returns `None` when the instantiation cannot be completed on this path
/// (cyclic dependency or exhausted budget); the caller must then skip.
fn sigma_class(eg: &mut MyEGraph, ctx: &mut ApplyCtx, c: &AppliedId) -> Option<AppliedId> {
    if ctx.budget == 0 {
        return None;
    }
    ctx.budget -= 1;

    // Depth cap (separate from the count budget above): prevents a stack
    // overflow on deep instantiation chains. Bailing here is sound: the
    // occurrence is treated as un-instantiable, so `merge` learns less.
    let _depth = DepthGuard::enter()?;

    let c = eg.find_applied_id(c);

    // Occurrence-local shortcut: nothing to substitute in this occurrence.
    // (Only returned, never recorded class-wide.)
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

    // The first enode that can be instantiated defines the image class; the
    // instantiations of the remaining enodes are unioned into it. As soon as
    // the image is known it is published in the memo, so that enodes
    // containing `c` itself as a child (ubiquitous once collapsing equations
    // like `f(X,..) = X` have been unioned into a class) resolve their
    // self-reference through the image instead of being skipped. Enodes that
    // fail (their instantiation re-enters an occurrence whose image is not
    // yet known) are retried until a pass makes no progress; whatever still
    // fails then is skipped, which is sound: we only learn fewer equalities.
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
        // No enode could be instantiated (all cyclic), or the class was
        // empty: give up on this occurrence.
        None => None,
    }
}

/// Instantiate one enode under `ctx.mu`.
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

/// Instantiate `c0` and `c1` under `mu` and union the two images.
/// Returns the (found) image of `c0` together with the list of classes
/// changed by the unions performed along the way; the list is empty iff
/// nothing new was learned (which includes the case where one of the two
/// instantiations could not be completed).
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

/// Non-recursive version of `rec_parents`: returns the elements of `wo` from
/// whose e-class some class of `changed` is reachable, following the children
/// of `App` nodes.
///
/// Instead of recursing downwards from every element of `wo`, this computes
/// once, by a breadth-first traversal of the *reversed* child graph starting
/// from `changed`, the set of all e-classes that can reach a changed class,
/// and then filters `wo` by membership. Unlike the recursive version, this
/// also terminates on cyclic e-graphs.
fn rec_parents(eg: &MyEGraph, wo: &VecDeque<AppliedId>, changed: &Vec<Id>) -> Vec<AppliedId> {
    // 1. Reversed child graph: for every e-class, the classes that contain an
    //    App node having it as a child.
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
    // 2. BFS from the changed classes along the reversed edges:
    //    `reaches` collects every e-class from which a changed class is reachable
    //    (the changed classes themselves included, as in the recursive version).
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
    // 3. Keep the elements of `wo` whose e-class reaches a changed class.
    let mut v: Vec<AppliedId> = vec![];
    for c0 in wo {
        if reaches.contains(&eg.find_id(c0.id)) {
            v.push(c0.clone());
        }
    }
    v
}


pub(crate) fn merge(eg: &mut MyEGraph, max: u64, wo: &mut VecDeque<AppliedId>, us: &mut VecDeque<AppliedId>, c0: &AppliedId) -> bool {
    let w1 = wo.clone();
    for c1 in w1 {
        // one memo table per (c0, c1) pair: the e-graph is mutated inside the
        // `for mu in mgus` loop below, which would invalidate cached results
        //let empty = HashMap::new();
        //let mut memo: MguMemo = HashMap::new();
        //let mut budget = 1000;
        let mgus = compute_mgus_extern(eg, c0, &c1); // , &empty, &mut memo, &mut budget
        //let max_unifiers = 5;
        //let mut count = 0;
        for mu in mgus {
            //if count >= max_unifiers {
            //    break;
            //}
            //count += 1;
            println!("there is a mu");
            let (c_new, vec_modified) = apply_unifier_class_init(eg, &mu, c0, &c1);
            eg.rebuild();
            println!("merge - wo = {:?}", wo);
            println!("merge - us = {:?}", us);
            update(eg, wo);
            update(eg, us);
            println!("merge 2 - wo = {:?}", wo);
            println!("merge 2 - us = {:?}", us);
            //wo_no_us(wo, us);
            // satisfiability of the class tested by the analyses
            if (*eg.analysis_data(c_new.id)).0 <= max {
                let mut subsumed = vec_modified.is_empty(); // all nodes that were added were already in the e-graph and no new equality between classes has been learned
                let mut has_break = false;
                for c in wo.clone() {
                    if test_subsumption(eg, &c, &c_new) {
                        subsumed = true;
                        has_break = true;
                        break;
                    }
                }
                if !has_break {
                    for c in us.clone() {
                        if test_subsumption(eg, &c, &c_new) {
                            subsumed = true;
                            has_break = true;
                            break;
                        }
                    }
                    if !has_break {
                        if test_subsumption(eg, &c0, &c_new) {
                            subsumed = true;
                        }
                    }
                }
                if !subsumed {
                    // every e-class in wo that is modified should be deleted from wo and added to us
                    // checks if c_new subsumes any other class
                    for c in wo.clone() {
                        if test_subsumption(eg, &c_new, &c) {
                            delete_element(eg, wo, &c_new);
                            delete_element(eg, us, &c_new);
                        }
                    }
                    for c in us.clone() {
                        if test_subsumption(eg, &c_new, &c) {
                            delete_element(eg, wo, &c_new);
                            delete_element(eg, us, &c_new);
                        }
                    }
                    if test_subsumption(eg, &c_new, c0) {
                        delete_element(eg, wo, &c_new);
                        delete_element(eg, us, &c_new);
                        subsumed = true;
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
                    if subsumed { // as of now, unreachable
                        return false;
                    }
                }
            }
        }
    }
    return true;
}