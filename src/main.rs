use std::collections::VecDeque;

pub use slotted_egraphs::*;

mod mylanguage;
pub use mylanguage::*;

mod myanalysis;
pub use myanalysis::*;

mod util;
use util::*;

mod merge;
pub(crate) use merge::*;

mod deduction;
pub(crate) use deduction::*;

pub type MyEGraph = EGraph<SimpleLang, AstSizeAnalysis>;

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

fn ccx(eqs: Vec<Equation>, max: u64, symbol_list: &Vec<(String, u8)>) -> MyEGraph {
    // initialization
    let analysis = AstSizeAnalysis;
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
        let mut str = format!("?{}", f.clone());
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

    // main loop
    while !us.is_empty() {
        let c = us.pop_front().unwrap();
        if merge(&mut eg, max, &mut wo, &mut us, &c) && deduct(&mut eg, symbol_list, max, &mut wo, &mut us, &c) {
            if deduct(&mut eg, symbol_list, max, &mut wo, &mut us, &c) {
                let cfind = eg.find_applied_id(&c);
                if !wo.contains(&cfind) {
                    wo.push_back(cfind);
                }
            }
        }
    }
    
    return eg;
}

fn main() {
    let max = 6;
    let symbol_list: Vec<(String, u8)> = vec![("g".to_owned(), 1), ("h".to_owned(), 1), ("a".to_owned(), 0)];
    let eqs: Vec<String> = vec!["(app ?g $x) = ?a".to_owned(), "(app ?h $y) = a".to_owned(), "(app ?g (app ?h $z)) = (app ?h (app ?h $z))".to_owned()];
    let parsed_eqs = to_equations(eqs);

    let eg = ccx(parsed_eqs, max, &symbol_list);
    eg.dump();
}
