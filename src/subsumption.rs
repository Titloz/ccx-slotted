use std::collections::HashMap;
use std::panic;
use crate::*;

/// tests if a subsumes b, as the existence of an e-graph morphism from b to a
pub(crate) fn test_subsumption(eg: &mut MyEGraph, max: u64, a: &AppliedId, b: &AppliedId) -> bool {
    println!("test_subsumption - entry");
    if a == b {
        return false; // indeed, a subsumes b in that case but you don't want to get rid of it
    }
    let analysis_a = eg.analysis_data(a.id).1.clone();
    let analysis_b = eg.analysis_data(b.id).1.clone();
    if !analysis_b.is_subset(&analysis_a) {
        return false; 
    }
    if eg.slots(a.id).is_empty() {
        let mu = HashMap::new();
        let mut visited = HashMap::new();
        return test_subsumption_withunifier_norec(eg, a, b, &mu, &mut visited);
    }
    let mus = compute_mgus_extern(eg, a, b, max);
    'outer: for mu in mus {
        for z in b.slots() {
            if let Some(_) = mu.get(&z) {
                continue 'outer;
            }
        }
        let mut new_mu = HashMap::new();
        for z in a.slots() {
            if let Some(c) = mu.get(&z) {
                new_mu.insert(z, c.clone());
            }
        }
        let mut visited = HashMap::new();
        if test_subsumption_withunifier_norec(eg, a, b, &new_mu, &mut visited) {
            println!("test_subsumption - out true");
            return true;
        }
    }
    println!("test_subsumption - out false");
    false
}

fn test_subsumption_withunifier(eg: &MyEGraph, a: &AppliedId, b: &AppliedId, mu: &Unifier, visited: &mut HashMap<(Id, Id), Option<bool>>) -> bool {
    println!("test_subsumption_withunifier - entry with a = {:?} and b = {:?}", a, b);
    let a = eg.find_applied_id(a);
    let b = eg.find_applied_id(b);
    match visited.get(&(a.id.clone(), b.id.clone())) {
        Some(opt_b) => {
            match *opt_b {
                Some(b) => return b,
                None => {
                    // is it sound?
                    visited.insert((a.id.clone(), b.id.clone()), Some(true));
                    return true;
                },
            }
        },
        None => {
            visited.insert((a.id.clone(), b.id.clone()), None);
        },
    }
    if eg.find_id(a.id) == eg.find_id(b.id) {
        visited.insert((a.id.clone(), b.id.clone()), Some(true));
        return true;
    }
    for nb in eg.enodes_applied(&b) {
        match nb.clone() {
            SimpleLang::App(cb, db) => {
                let mut match_nb = false;
                for na in eg.enodes_applied(&a) {
                    match na {
                        SimpleLang::App(ca, da) => {
                            if test_subsumption_withunifier(eg, &ca, &cb, mu, visited) && test_subsumption_withunifier(eg, &da, &db, mu, visited) {
                                match_nb = true;
                            }
                        },
                        SimpleLang::Var(y) => {
                            match mu.get(&y) {
                                None => continue,
                                Some(c) => {
                                    if test_subsumption_withunifier(eg, c, &b, mu, visited) {
                                        match_nb = true;
                                    }
                                }
                            }
                        },
                        _ => continue,
                    }
                }
                if !match_nb {
                    visited.insert((a.id.clone(), b.id.clone()), Some(false));
                    return false;
                }
            },
            SimpleLang::Number(n) => {
                let mut match_nb = false;
                for na in eg.enodes_applied(&a) {
                    match na {
                        SimpleLang::Number(m) => {
                            if n == m {
                                match_nb = true;
                            }
                        },
                        SimpleLang::Var(y) => {
                            match mu.get(&y) {
                                None => continue,
                                Some(c) => {
                                    if test_subsumption_withunifier(eg, c, &b, mu, visited) {
                                        match_nb = true;
                                    }
                                }
                            }
                        },
                        _ => continue,
                    }
                }
                if !match_nb {
                    visited.insert((a.id.clone(), b.id.clone()), Some(false));
                    return false;
                }
            },
            SimpleLang::Symbol(f) => {
                let mut match_nb = false;
                for na in eg.enodes_applied(&a) {
                    match na {
                        SimpleLang::Symbol(g) => {
                            if f == g {
                                match_nb = true;
                            }
                        },
                        SimpleLang::Var(y) => {
                            match mu.get(&y) {
                                None => continue,
                                Some(c) => {
                                    if test_subsumption_withunifier(eg, c, &b, mu, visited) {
                                        match_nb = true;
                                    }
                                }
                            }
                        },
                        _ => continue,
                    }
                    if !match_nb {
                        visited.insert((a.id.clone(), b.id.clone()), Some(false));
                        return false;
                    }
                }
            },
            SimpleLang::Var(x) => {
                let mut match_nb = false;
                for na in eg.enodes_applied(&a) {
                    match na {
                        SimpleLang::Var(y) => {
                            match mu.get(&y) {
                                None => {
                                    if x == y {
                                        match_nb = true;
                                    }
                                },
                                Some(c) => {
                                    if test_subsumption_withunifier(eg, c, &b, mu, visited) {
                                        match_nb = true;
                                    }
                                }
                            }
                        },
                        _ => continue,
                    }
                    if !match_nb {
                        visited.insert((a.id.clone(), b.id.clone()), Some(false));
                        return false;
                    }
                }
            },
        }
    }
    visited.insert((a.id.clone(), b.id.clone()), Some(true));
    true
}


fn test_subsumption_withunifier_norec(eg: &MyEGraph, a: &AppliedId, b: &AppliedId, mu: &Unifier, visited: &mut HashMap<(Id, Id), Option<bool>>) -> bool {
    println!("test_subsumption_withunifier - entry with a = {:?} and b = {:?}", a, b);
    let a = eg.find_applied_id(a);
    let b = eg.find_applied_id(b);
    let abis = a.clone();
    let bbis = b.clone();
    match visited.get(&(a.id.clone(), b.id.clone())) {
        Some(opt_b) => {
            match *opt_b {
                Some(b) => return b,
                None => {
                    // is it sound?
                    visited.insert((a.id.clone(), b.id.clone()), Some(true));
                    return true;
                },
            }
        },
        None => {
            visited.insert((a.id.clone(), b.id.clone()), None);
        },
    }
    if eg.find_id(a.id) == eg.find_id(b.id) {
        visited.insert((a.id.clone(), b.id.clone()), Some(true));
        return true;
    }
    // invariant to maintain:  the call_stack only maintains appliedids that are leaders
    let mut call_stack : Vec<(AppliedId, AppliedId)> = vec![(a.clone(), b.clone())];
    'whileloop: while !call_stack.is_empty() {
        let (a,b) = call_stack.pop().expect("");
        //let a = eg.find_applied_id(&a);
        //let b = eg.find_applied_id(&b);
        match visited.get(&(a.id.clone(), b.id.clone())) {
            Some(opt_b) => {
                match *opt_b {
                    Some(_) => continue 'whileloop,
                    None => {
                        if !call_stack.contains(&(a.clone(), b.clone())) {
                            visited.insert((a.id.clone(), b.id.clone()), Some(true));
                        }
                        continue 'whileloop;
                    },
                }
            },
            None => {
                visited.insert((a.id.clone(), b.id.clone()), None);
            },
        }
        if eg.find_id(a.id) == eg.find_id(b.id) {
            visited.insert((a.id.clone(), b.id.clone()), Some(true));
            continue 'whileloop;
        }
        let analysis_a = eg.analysis_data(a.id).1.clone();
        let analysis_b = eg.analysis_data(b.id).1.clone();
        if !analysis_b.is_subset(&analysis_a) {
            visited.insert((a.id.clone(), b.id.clone()), Some(false));
            continue 'whileloop;
        }
        call_stack.push((a.clone(), b.clone()));
        for nb in eg.enodes_applied(&b) {
            match nb.clone() {
                SimpleLang::App(cb, db) => {
                    let mut match_nb = false;
                    for na in eg.enodes_applied(&a) {
                        match na {
                            SimpleLang::App(ca, da) => {
                                let ca = eg.find_applied_id(&ca);
                                let cb = eg.find_applied_id(&cb);
                                let da = eg.find_applied_id(&da);
                                let db = eg.find_applied_id(&db);
                                if let Some(Some(cbool)) = visited.get(&(ca.id.clone(),cb.id.clone())) {
                                    if let Some(Some(dbool)) = visited.get(&(da.id.clone(), db.id.clone())) {
                                        if *cbool && *dbool {
                                            match_nb = true;
                                        }
                                    } else {
                                        call_stack.push((da, db));
                                    }
                                } else {
                                    call_stack.push((ca, cb));
                                    call_stack.push((da, db));
                                }
                            },
                            SimpleLang::Var(y) => {
                                match mu.get(&y) {
                                    None => continue,
                                    Some(c) => {
                                        //if test_subsumption_withunifier(eg, c, &b, mu, visited) {
                                        //    match_nb = true;
                                        //}
                                        let c = eg.find_applied_id(&c);
                                        if let Some(Some(cbool)) = visited.get(&(c.id.clone(), b.id.clone())) {
                                            if *cbool {
                                                match_nb = true;
                                            }
                                        } else {
                                            call_stack.push((c,b.clone()));
                                        }
                                    }
                                }
                            },
                            _ => continue,
                        }
                    }
                    if !match_nb {
                        visited.insert((a.id.clone(), b.id.clone()), Some(false));
                        continue 'whileloop;
                    }
                },
                SimpleLang::Number(n) => {
                    let mut match_nb = false;
                    for na in eg.enodes_applied(&a) {
                        match na {
                            SimpleLang::Number(m) => {
                                if n == m {
                                    match_nb = true;
                                }
                            },
                            SimpleLang::Var(y) => {
                                match mu.get(&y) {
                                    None => continue,
                                    Some(c) => {
                                        //if test_subsumption_withunifier(eg, c, &b, mu, visited) {
                                        //    match_nb = true;
                                        //}
                                        let c = eg.find_applied_id(&c);
                                        if let Some(Some(cbool)) = visited.get(&(c.id.clone(), b.id.clone())) {
                                            if *cbool {
                                                match_nb = true;
                                            }
                                        } else {
                                            call_stack.push((c, b.clone()));
                                        }
                                    }
                                }
                            },
                            _ => continue,
                        }
                    }
                    if !match_nb {
                        visited.insert((a.id.clone(), b.id.clone()), Some(false));
                        continue 'whileloop;
                    }
                },
                SimpleLang::Symbol(f) => {
                    let mut match_nb = false;
                    for na in eg.enodes_applied(&a) {
                        match na {
                            SimpleLang::Symbol(g) => {
                                if f == g {
                                    match_nb = true;
                                }
                            },
                            SimpleLang::Var(y) => {
                                match mu.get(&y) {
                                    None => continue,
                                    Some(c) => {
                                        let c = eg.find_applied_id(&c);
                                        if let Some(Some(cbool)) = visited.get(&(c.id.clone(), b.id.clone())) {
                                            if *cbool {
                                                match_nb = true;
                                            }
                                        } else {
                                            call_stack.push((c, b.clone()));
                                        }
                                    }
                                }
                            },
                            _ => continue,
                        }
                        if !match_nb {
                            visited.insert((a.id.clone(), b.id.clone()), Some(false));
                            continue 'whileloop;
                        }
                    }
                },
                SimpleLang::Var(x) => {
                    let mut match_nb = false;
                    for na in eg.enodes_applied(&a) {
                        match na {
                            SimpleLang::Var(y) => {
                                match mu.get(&y) {
                                    None => {
                                        if x == y {
                                            match_nb = true;
                                        }
                                    },
                                    Some(c) => {
                                        let c = eg.find_applied_id(&c);
                                        if let Some(Some(cbool)) = visited.get(&(c.id.clone(), b.id.clone())) {
                                            if *cbool {
                                                match_nb = true;
                                            }
                                        } else {
                                            call_stack.push((c, b.clone()));
                                        }
                                    }
                                }
                            },
                            _ => continue,
                        }
                        if !match_nb {
                            visited.insert((a.id.clone(), b.id.clone()), Some(false));
                            continue 'whileloop;
                        }
                    }
                },
            }
        }
    }
    //visited.insert((a.clone(), b.clone()), Some(true));
    //true
    // at this point the call_stack is empty
    if let Some(Some(bool)) = visited.get(&(abis.id, bbis.id)) {
        return *bool
    } else {
        panic!("something is wrong with visited in test_subsumption_withunifier_norec");
    }
}
