use std::{cmp::min, collections::HashSet};
use crate::*;

#[derive(Default)]
pub struct AstSizeAnalysis;

impl<L:Language> Analysis<L> for AstSizeAnalysis {
    type Data = u64;
    fn make(eg: &EGraph<L, Self>, enode: &L) -> Self::Data {
        let mut s: u64 = 1;
        for x in enode.applied_id_occurrences(){
            s = s.saturating_add(*eg.analysis_data(x.id));
        }
        s
    }
    fn merge(l: Self::Data, r: Self::Data) -> Self::Data {
        min(l, r)
    }
}

// maybe make an analysis for my language which does not count app nodes?

#[derive(Default)]
pub struct SizeAnalysisNoApp;

impl Analysis<SimpleLang> for SizeAnalysisNoApp {
    type Data = u64;
    fn make(eg: &EGraph<SimpleLang, Self>, enode: &SimpleLang) -> Self::Data {
        let mut s: u64 = match enode {
            SimpleLang::App(_, _) => 0,
            _ => 1,
        };
        for x in enode.applied_id_occurrences(){
            s = s.saturating_add(*eg.analysis_data(x.id));
        }
        s
    }
    fn merge(l: Self::Data, r: Self::Data) -> Self::Data {
        min(l,r)
    }
}

/// An analysis that takes the size (without App nodes) and the symbols represented in a class 
#[derive(Default)]
pub struct SizeNoAppSymbols;

impl Analysis<SimpleLang> for SizeNoAppSymbols {
    type Data = (u64,HashSet<Symbol>);

    fn make(eg: &EGraph<SimpleLang, Self>, enode: &SimpleLang) -> Self::Data {
        let mut s: u64 = match enode {
            SimpleLang::App(_, _) => 0,
            _ => 1,
        };
        for x in enode.applied_id_occurrences(){
            s = s.saturating_add((*eg.analysis_data(x.id)).0);
        }
        let f = match enode {
            SimpleLang::Symbol(g) => {
                let mut set = HashSet::new();
                set.insert(*g);
                set
            },
            SimpleLang::App(child,_) => {
                let b = (*eg.analysis_data(child.id)).1.clone();
                b
            },
            _ => {
                let set = HashSet::new();
                set
            },
        };
        (s,f)
    }

    fn merge(l: Self::Data, r: Self::Data) -> Self::Data {
        let mut set = HashSet::new();
        for el in l.1.union(&r.1) {
            set.insert(*el);
        }
        (min(l.0, r.0), set)
    }
}