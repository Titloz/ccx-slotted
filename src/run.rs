use crate::*;
use std::time::Instant;

pub fn run_ccx<F>(
    egraph: &mut MyEGraph,
    us: &mut VecDeque<AppliedId>,
    wo: &mut VecDeque<AppliedId>,
    symbol_list: &Vec<(String, u8)>,
    max_size: u64,
    iter_limit: usize,
    time_limit: usize,
    mut hook: F,
) -> CCXReport
where
    F: FnMut(&mut MyEGraph) -> Result<(), String> + 'static,
{
    let start_time = Instant::now();
    let mut iterations = 0;
    let stop_reason: CCXStopReason;

    loop {
        // core function
        let us_empty: bool = ccx_step(egraph, max_size, symbol_list, wo, us);

        match hook(egraph) {
            Ok(_) => (),
            Err(msg) => {
                stop_reason = CCXStopReason::Other(msg.to_string());
                break;
            }
        }

        if us_empty {
            stop_reason = CCXStopReason::EmptyUs;
            break;
        }

        if iterations >= iter_limit {
            stop_reason = CCXStopReason::IterationLimit;
            break;
        }

        if start_time.elapsed().as_secs() >= time_limit.try_into().unwrap() {
            stop_reason = CCXStopReason::TimeLimit;
            break;
        }

        iterations += 1;
    }

    CCXReport {
        iterations,
        stop_reason,
        egraph_nodes: egraph.total_number_of_nodes(),
        egraph_classes: egraph.ids().len(),
        total_time: start_time.elapsed().as_secs_f64(),
    }
}