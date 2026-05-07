pub use slotted_egraphs_derive::define_language;
pub use symbol_table::GlobalSymbol as Symbol;

mod mylanguage;
pub use mylanguage::*;

mod myanalysis;
pub use myanalysis::*;

mod merge;
pub use merge::*;

mod main;
pub use main::*;