use crate::*;

define_language! {
    pub enum SimpleLang {
        App(AppliedId, AppliedId) = "app", 
        Var(Slot) = "var", 
        Symbol(Symbol),
        Number(u32),
    }
}