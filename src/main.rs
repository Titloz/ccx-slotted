pub use slotted_egraphs::*;

mod mylanguage;
pub use mylanguage::*;

mod myanalysis;
pub use myanalysis::*;

mod util;
use util::*;

mod merge;
pub use merge::*;

mod deduction;
pub use deduction::*;

pub type MyEGraph = EGraph<SimpleLang, AstSizeAnalysis>;

fn main() {
    println!("Hello, world!");
}
