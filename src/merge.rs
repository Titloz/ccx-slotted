use std::{collections::{HashMap, HashSet, VecDeque}, hash::Hash};
use rand::prelude::*;
use crate::*;
use rustc_hash::FxBuildHasher;

pub(crate) type Unifier = HashMap<Slot, AppliedId>;

fn compute_mgus(eg: &MyEGraph, a: &AppliedId, b: &AppliedId, mu: &Unifier, visited: &HashSet<(AppliedId, AppliedId)>)
     -> (Vec<Unifier>, HashSet<(AppliedId, AppliedId)>) {

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
    let (nc0, v0) = apply_unifier_class(eg, mu, c0, &mut visited);
    let (nc1, v1) = apply_unifier_class(eg, mu, c1, &mut visited);
    let mut v = v0;
    for c in v1 {
        if !v.contains(&c) {
            v.push(c);
        }
    }
    let nc = eg.find_applied_id(&nc0);
    if eg.union(&nc0, &nc1) {
        v.push(nc.clone());
    }
    (nc, v)
}

fn apply_unifier_class_norec(eg: &mut MyEGraph, mu: &Unifier, c0: &AppliedId) -> (AppliedId, Vec<AppliedId>) {

    let mut visited: HashMap<Id, AppliedId> = HashMap::new();
    let mut in_visit: HashMap<Id, usize> = HashMap::new();
    let mut i = eg.find_id(c0.id);
    let mut app_id = c0;

    let mut nodes = eg.enodes_applied(app_id);
    let mut nb_nodes = nodes.len();
    if nb_nodes == 0 {
        visited.insert(i, c0.clone());
        return (c0.clone(), vec![]);
    }
    in_visit.insert(i, 0);
    let j = *in_visit.get(&i).unwrap(); // in that case 0
    if j < nb_nodes -1 {
        let _ = in_visit.insert(i, j+1);
    }
    let mut enode = &nodes[j];
    let new_class = c0;
    let v: Vec<AppliedId> = vec![];
    let mut call_stack : Vec<AppliedId> = vec![];
    let mut pass_first_time: bool = false;
    while call_stack.len() > 0 || !pass_first_time { // visited.get(&c0.id) == None ?
        pass_first_time = true;
        match enode {
            SimpleLang::App(c1, c2) => {
                if !call_stack.contains(&c1) {
                    call_stack.push(c1.clone());
                }
                if !call_stack.contains(&c2) {
                    call_stack.push(c2.clone());
                }
            },
            SimpleLang::Var(x) => {
                match mu.get(&x) {
                    None => {
                        continue; // todo?
                    },
                    Some(c) => {
                        if !call_stack.contains(&c) {
                            call_stack.push(c.clone());
                        }
                    },
                }
            },
            _ => {
                continue; // todo?
            },
        }
    }
   todo!()
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

pub(crate) fn merge(eg: &mut MyEGraph, max: u64, wo: &mut VecDeque<AppliedId>, us: &mut VecDeque<AppliedId>, c0: &AppliedId) -> bool {
    let w1 = wo.clone();
    for c1 in w1 {
        // quite unsure about this beginning
        //let hash_builder = rustc_hash::FxBuildHasher::from(FxBuildHasher {});
        let empty = HashMap::new();
        let visited = HashSet::new();//with_hasher(hash_builder);
        let (mgus,_) = compute_mgus(eg, c0, &c1, &empty, &visited);
        for mu in mgus {
            let (c_new, vec_modified) = apply_unifier_class_init(eg, &mu, c0, &c1);
            eg.rebuild();
            update(eg, wo);
            update(eg, us);
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
                    if subsumed {
                        return false;
                    }
                }
            }
        }
    }
    return true;
}