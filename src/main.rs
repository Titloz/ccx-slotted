use std::collections::VecDeque;
use std::println;
use std::time::Duration;

pub use slotted_egraphs::*;

mod mylanguage;
pub use mylanguage::*;

mod myanalysis;
pub use myanalysis::*;

mod cost_function;
pub use cost_function::*;

mod util;
use util::*;

mod merge;
pub(crate) use merge::*;

mod deduction;
pub(crate) use deduction::*;

mod subsumption;
pub(crate) use subsumption::*;

mod report;
pub use report::*;

mod run;
pub use run::*;

mod runner;
pub use runner::*;

mod tptp_ueq; 
pub use tptp_ueq::*;

pub type MyEGraph = EGraph<SimpleLang, SizeNoAppSymbols>;

struct Equation {
    pub l: RecExpr<SimpleLang>,
    pub r: RecExpr<SimpleLang>,
}

fn to_equation(s: String) -> Equation {
    // s must be of the form "... = ..." where ... can be parsed as a RecExpr<SimpleLang>
    let (sl, sr) = s.split_once('=').unwrap();
    let l: RecExpr<SimpleLang> = RecExpr::parse(sl.trim()).unwrap();
    let r: RecExpr<SimpleLang> = RecExpr::parse(sr.trim()).unwrap();
    Equation { l, r }
}

fn to_equations(eqs: Vec<String>) -> Vec<Equation> {
    let mut v = vec![];
    for e in eqs {
        v.push(to_equation(e));
    }
    v
}

pub fn ccx_step(eg: &mut MyEGraph, max: u64, symbol_list: &Vec<(String, u8)>, wo: &mut VecDeque<AppliedId>, us: &mut VecDeque<AppliedId>) -> bool {
    //println!("ccx_step - entry");
    let c = us.pop_front().unwrap();
    println!("ccx_step - before merge");
    if merge(eg, max, wo, us, &c) {
        println!("ccx_step - after merge and before deduct");
        if deduct(eg, symbol_list, max, wo, us, &c) {
            println!("ccx_step - after deduct");
            let cfind = eg.find_applied_id(&c);
            if !wo.contains(&cfind) {
                wo.push_back(cfind);
            }
        }
    }
    return us.is_empty()
}

fn ccx(eqs: Vec<Equation>, max: u64, symbol_list: &Vec<(String, u8)>, max_iterations: u64) -> MyEGraph {
    // initialization
    let analysis = SizeNoAppSymbols;
    let mut eg = MyEGraph::new(analysis);
    let mut wo: VecDeque<AppliedId> = VecDeque::new();
    let mut us: VecDeque<AppliedId> = VecDeque::new();

    // add every equation to the e-graph
    for e in eqs {
        let cl = eg.add_syn_expr(e.l);
        let cr = eg.add_syn_expr(e.r);
        eg.union(&cl, &cr);
        us.push_back(cl);
    }
    // add single-deduction classes
    for (f, n) in symbol_list {
        let mut str = format!("{}", f.clone());
        for i in 0..(*n) {
            str = format!("(app {} (var $var_{}))", str, i);
        }
        let re: RecExpr<SimpleLang> = RecExpr::parse(&str).unwrap();
        let cf = eg.add_syn_expr(re);
        wo.push_back(cf);
    }
    
    // rebuild
    eg.rebuild();
    update(&eg, &mut wo);
    update(&eg, &mut us);
    wo_no_us(&mut wo, &us);

    // main loop
    let mut iterations = 0;
    while !us.is_empty() && iterations < max_iterations { //&& iterations < max_iterations
        iterations += 1;
       ccx_step(&mut eg, max, symbol_list, &mut wo, &mut us);
    }
    println!("wo = {:?}", wo);
    println!("us = {:?}", us);
    return eg;
}

fn main() {
    
    let max = 10;
    let max_iterations = 50;
    let symbol_list: Vec<(String, u8)> = vec![("f".to_owned(), 1), ("g".to_owned(), 1)];
    let eqs: Vec<String> = vec!["(app f (var $x)) = (app g (var $x))".to_owned()];
    let parsed_eqs = to_equations(eqs);
    let eg = ccx(parsed_eqs, max, &symbol_list, max_iterations);
    eg.dump();
    
    /*let res = run_tptp_ueq("./tests/TPTP/TPTP/Problems/UEQ/AGT042-10.p", false);
    match res {
        Ok(pair) => {
            let (report, egraph) = pair;
            println!("{:?}", report);
            egraph.dump();
        },
        Err(x) => println!("error {x}"),
    }*/
    //let config = UeqRunConfig { max_size: 10, iter_limit: 200000, node_limit: 100_000, time_limit: Duration::from_secs(10), worker_stack_bytes: 100000000 };
    //let _ = run_ueq_folder("./tests/TPTP/TPTP/Problems/UEQ/", "./tests/TPTP/TPTP/results_nodisequality.csv", false, config);
}
