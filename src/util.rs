use std::collections::VecDeque;

use crate::*;

pub(crate) fn update(eg: &MyEGraph, worklist: &mut VecDeque<AppliedId>) {
    let mut new_us = VecDeque::new();
    for ai in worklist.clone() {
        let new_ai = eg.find_applied_id(&ai);
        if !new_us.contains(&new_ai) {
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