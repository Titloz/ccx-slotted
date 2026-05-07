use std::collections::{HashMap, VecDeque};
use crate::*;

fn deduct_intern<L: Language>(eg: &EGraph<L,AstSizeAnalysis>, max: u64, wo: &mut VecDeque<AppliedId>, us: &mut VecDeque<AppliedId>, f: &String, i: u8, n: u8, c0: &AppliedId, used: bool, choices: &mut Vec<AppliedId>) -> bool { //, c_new: &AppliedId,
    if i!=n {
        // construct a candidate e-node
        for c in wo.clone() {
            choices.push(eg.find_applied_id(&c));
            let rec = deduct_intern(eg, max, wo, us, f, i, n, c0, used, choices);
            if !rec {
                choices.pop();
                return false;
            }
        }
    } else if used {
        // the e-node contains c0 as a child
        let mut sum_analyses = 1;
        for child in choices {
            sum_analyses += *eg.analysis_data(child.id);
        }
        if sum_analyses <= max {
            // add the new e-node
            // rebuild
        }
    }
    return true;
}


fn deduct<L: Language>(eg: &EGraph<L,AstSizeAnalysis>, symbol_list: &Vec<(String, u8)>, max: u64, wo: &mut VecDeque<AppliedId>, us: &mut VecDeque<AppliedId>, c0: &AppliedId) -> bool {
    // symbol_list is the list of symbols with their arity
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
        let res = deduct_intern(eg, max, wo, us, f, 0, *n, c0, false, &mut choices); //, c_new
        if !res {
            // wo = wo - {c0}
            let mut new_w0 = VecDeque::new();
            for c in wo.clone() {
                if eg.find_applied_id(&c) != eg.find_applied_id(c0) {
                    new_w0.push_back(eg.find_applied_id(&c));
                }
            }
            *wo = new_w0;
            return false;
        }
    }
    return true; 
}