use crate::*;

#[derive(Default)]
pub struct AstSizeCostNoApp;

impl CostFunction<SimpleLang> for AstSizeCostNoApp {
    type Cost = u64;
    fn cost<C>(&self, enode: &SimpleLang, costs: C) -> Self::Cost
    where
        C: Fn(Id) -> Self::Cost
    {
        let mut s: u64 = match enode {
            SimpleLang::App(_, _) => 0,
            _ => 1,
        };
        for x in enode.applied_id_occurrences(){
            s = s.saturating_add(costs(x.id));
        }
        s
    }
}