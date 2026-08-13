use std::collections::VecDeque;
use crate::*;

fn deduct_intern(eg: &mut MyEGraph, max: u64, wo: &mut VecDeque<AppliedId>, us: &mut VecDeque<AppliedId>, f: &String, i: u8, n: u8, c0: &AppliedId, used: bool, choices: &mut Vec<AppliedId>) -> bool { //, budget: &mut usize
    //println!("entry deduct_intern with {f} and {:?}", c0.id);
    // wo must verify for all id i, eg.find_id(i)=i
    // *if *budget <= 0 {
    //    return true;
    //}
    //*budget -= 1;
    if i!=n {
        // construct a candidate e-node
        for c in wo.clone() {
            choices.push(c.clone()); //eg.find_applied_id(&c)
            println!("choices = [");
            for child in choices.clone() {
                print!("{:?}, ", child.id);
            }
            println!("]");
            if !deduct_intern(eg, max, wo, us, f, i+1, n, c0, used || (c == *c0), choices){ //, budget
                choices.pop();
                return false;
            } else {
                choices.pop();
            }
        }
    } else if used {
        // the e-node contains c0 as a child
        let mut sum_analyses = 1;
        //let mut rev_children = vec![];
        //println!("choices = [");
        for child in choices.clone() {
            //print!("{:?}, ", child.id);
            sum_analyses += (*eg.analysis_data(child.id)).0;
            //rev_children.push(child);
        }
        //println!("]");
        if sum_analyses <= max { // satisfiability test

            // add the new e-node app(app(...app(f,c1)...,cn-1),cn)
            // rebuild
            // is there a variable problem here?
            let (mut class_f, mut b) = eg.add_changes(SimpleLang::Symbol(f.into()));
            let mut has_changed = b;
            for child in choices {
                (class_f, b) = eg.add_changes(SimpleLang::App(class_f, child.clone()));
                has_changed = has_changed || b;
            }
            //println!("classf before rebuild = {:?}", class_f.id);
            eg.rebuild();
            update(eg, us);
            update(eg, wo);
            let new_ai = eg.find_applied_id(&class_f);
            //println!("classf = {:?}", new_ai.id);

            // subsumption tests
            /* for efficiency reasons, we get rid of them
            for c in wo.clone() {
                if test_subsumption(eg, &c, &new_ai) {
                    return true;
                }
            }
            for c in us.clone() {
                if test_subsumption(eg, &c, &new_ai) {
                    return true;
                }
            }
            let mut subsumed = false;
            for c in wo.clone() {
                if test_subsumption(eg, &new_ai, &c) {
                    delete_element(eg, wo, &c);
                    delete_element(eg, us, &c);
                    if c == eg.find_applied_id(&c0) {
                        subsumed = true;
                    }
                }
            }
            if !us.contains(&new_ai) {
                us.push_back(new_ai);
            }
            wo_no_us(wo, us);
            if subsumed {
                return false;
            }
            */

            if !us.contains(&new_ai) && eg.find_id(new_ai.id) != eg.find_id(c0.id) {
               us.push_back(new_ai);
            }
            wo_no_us(wo, us);
            println!("{:?}", wo);
            println!("{:?}", us);
            return !has_changed;
            /*if !has_changed {
                return true; //test
            } else {
                return false;
            }*/
        } 
    }
    return true;
}


pub(crate) fn deduct(eg: &mut MyEGraph, symbol_list: &Vec<(String, u8)>, max: u64, wo: &mut VecDeque<AppliedId>, us: &mut VecDeque<AppliedId>, c0: &AppliedId) -> bool {
    //println!("c0 is {:?}", c0.id);
    // symbol_list is the list of symbols with their arity
    // wo must verify for all id i, eg.find_id(i)=i
    let analysis = eg.analysis_data(c0.id).clone();
    if analysis.0 >= max {
        return true;
    }
    let rep = eg.find_applied_id(c0);
    if !wo.contains(&rep) {
        wo.push_back(rep);
    }
    let mut choices;
    for (f, n) in symbol_list {
        if *n > 0 {
            //let mut max_calls = 10000;
            choices = Vec::new();
            if !deduct_intern(eg, max, wo, us, f, 0, *n, c0, false, &mut choices) { //, &mut max_calls
                //println!("out deduct_intern");
                delete_element(eg, wo, c0);
                if !us.contains(c0) {
                    us.push_back(c0.clone());
                }
                return false;
            }
        }
    }
    return true; 
}