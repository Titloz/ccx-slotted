use std::collections::VecDeque;

use crate::*;

pub(crate) fn update(eg: &MyEGraph, worklist: &mut VecDeque<AppliedId>) {
    let mut new_us = VecDeque::new();
    for ai in worklist.clone() {
        //let new_ai = eg.find_applied_id(&ai);
        let new_ai = eg.mk_identity_applied_id(eg.find_id(ai.id)); // ensures they are all defined on distinct variables
        if !contains_id(eg, &new_us, &new_ai) { //  //  !new_us.contains(&new_ai)
            new_us.push_back(new_ai);
        }
    }
    *worklist = new_us;
}

pub(crate) fn delete_element(eg: &MyEGraph, worklist: &mut VecDeque<AppliedId>, c0: &AppliedId) {
    let mut new_w0 = VecDeque::new();
    let find_c0 = eg.find_applied_id(c0);
    for c in worklist.clone() {
        if c != find_c0 {
            new_w0.push_back(c);
        }
    }
    *worklist = new_w0;
}

fn contains_id(eg: &MyEGraph, worklist: &VecDeque<AppliedId>, c0: &AppliedId) -> bool {
    for c in worklist.clone() {
        if eg.find_id(c.id) == eg.find_id(c0.id) {
            return true;
        }
    }
    return false;
}

pub(crate) fn wo_no_us(wo: &mut VecDeque<AppliedId>, us: &VecDeque<AppliedId>)  {
    let mut new_w0: VecDeque<AppliedId> = VecDeque::new();
    for x in wo.clone() {
        if !us.contains(&x) {
            new_w0.push_back(x.clone());
        }
    }
    *wo = new_w0;
}

pub(crate) fn get_all_nodes(eg: &MyEGraph) -> usize {
    let mut sum = 0;
    for (_, c) in eg.classes.iter().clone() {
        for _ in c.nodes.clone() {
            sum += 1;
        }
    }
    sum
}