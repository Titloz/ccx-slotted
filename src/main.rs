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

pub fn ccx_step(eg: &mut MyEGraph, max: u64, symbol_list: &Vec<(String, u8)>, wo: &mut VecDeque<AppliedId>, us: &mut VecDeque<AppliedId>, time_limit: Duration) -> bool {
    //println!("ccx_step - entry");
    let c = us.pop_front().unwrap();
    println!("ccx_step - before merge");
    if merge(eg, max, &time_limit, wo, us, &c) {
        println!("ccx_step - after merge and before deduct");
        if deduct(eg, symbol_list, max, &time_limit, wo, us, &c) {
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
       ccx_step(&mut eg, max, symbol_list, &mut wo, &mut us, Duration::from_secs(10)); // dummy hardcoded value here
    }
    println!("wo = {:?}", wo);
    println!("us = {:?}", us);
    return eg;
}

fn main() {
    /* 
    let max = 10;
    let max_iterations = 10000;
    let symbol_list: Vec<(String, u8)> = vec![("f".to_owned(), 2), ("g".to_owned(), 2)];
    let eqs: Vec<String> = vec!["(app (app f (var $x)) (var $y)) = (app (app g (var $x)) (var $y))".to_owned(),
                                "(app (app f (var $x)) (var $y)) = (app (app g (var $y)) (var $x))".to_owned()];
    let parsed_eqs = to_equations(eqs);
    let mut equations : Vec<(String, String)> = vec![];
    for eq in parsed_eqs {
        equations.push((eq.l.to_string(), eq.r.to_string()));
    }
    let problem: UeqProblem = UeqProblem{equations: equations.clone(), symbol_list, num_disequalities: 0};
    let result = run_ueq_problem(&problem, max, max_iterations, 100000, Duration::from_secs(500));
    match result {
        Ok(pair) => {
            let (report, egraph) = pair;
            println!("{:?}", report);
            egraph.dump();
        },
        Err(x) => println!("error {x}"),
    }
    */
    //let eg = ccx(parsed_eqs, max, &symbol_list, max_iterations);
    //eg.dump();
    
    /*let res = run_tptp_ueq("./tests/TPTP/TPTP/Problems/UEQ/AGT042-10.p", false);
    match res {
        Ok(pair) => {
            let (report, egraph) = pair;
            println!("{:?}", report);
            egraph.dump();
        },
        Err(x) => println!("error {x}"),
    }*/
    let config = UeqRunConfigDepth { max_depth: 6, iter_limit: 200000, node_limit: 100_000, time_limit: Duration::from_secs(1800), worker_stack_bytes: 100000000 };
    let _ = run_ueq_folder_depth("./tests/TPTP/TPTP/Problems/UEQ/", "./tests/TPTP/TPTP/results_nodisequality_30min_depth6.csv", false, config);
}
