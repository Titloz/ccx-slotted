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