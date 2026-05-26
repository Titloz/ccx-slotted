use std::collections::VecDeque;
use crate::*;

fn deduct_intern(eg: &mut MyEGraph, max: u64, wo: &mut VecDeque<AppliedId>, us: &mut VecDeque<AppliedId>, f: &String, i: u8, n: u8, c0: &AppliedId, used: bool, choices: &mut Vec<AppliedId>) -> bool { 
    //println!("entry deduct_intern");
    // wo must verify for all id i, eg.find_id(i)=i
    if i!=n {
        // construct a candidate e-node
        for c in wo.clone() {
            choices.push(c); //eg.find_applied_id(&c)
            if !deduct_intern(eg, max, wo, us, f, i+1, n, c0, used, choices){
                choices.pop();
                return false;
            }
        }
    } else if used {
        // the e-node contains c0 as a child
        let mut sum_analyses = 1;
        let mut rev_children = vec![];
        for child in choices.clone() {
            sum_analyses += *eg.analysis_data(child.id);
            rev_children.push(child);
        }
        if sum_analyses <= max {
            // add the new e-node app(app(...app(f,c1)...,cn-1),cn)
            // rebuild
            // is there a variable problem here?
            let mut class_f = eg.add(SimpleLang::Symbol(f.into()));
            for child in choices {
                class_f = eg.add(SimpleLang::App(class_f, child.clone()));
            }
            eg.rebuild();
            update(eg, us);
            update(eg, wo);
            let new_ai = eg.find_applied_id(&class_f);
            if !us.contains(&new_ai) {
                us.push_back(new_ai);
            }
        }
    }
    return true;
}


pub(crate) fn deduct(eg: &mut MyEGraph, symbol_list: &Vec<(String, u8)>, max: u64, wo: &mut VecDeque<AppliedId>, us: &mut VecDeque<AppliedId>, c0: &AppliedId) -> bool {
    // symbol_list is the list of symbols with their arity
    // wo must verify for all id i, eg.find_id(i)=i
    let analysis = *eg.analysis_data(c0.id);
    if analysis >= max {
        return true;
    }
    let rep = eg.find_applied_id(c0);
    if !wo.contains(&rep) {
        wo.push_back(rep);
    }
    for (f, n) in symbol_list {
        let mut choices = Vec::new();
        if !deduct_intern(eg, max, wo, us, f, 0, *n, c0, false, &mut choices) {
            println!("out deduct_intern");
            delete_element(eg, wo, c0);
            return false;
        }
    }
    return true; 
}