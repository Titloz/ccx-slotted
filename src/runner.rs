use crate::*;
use std::time::Duration;
use std::time::Instant;

pub struct Iteration<IterData> {
    /// The user provided annotation for this iteration
    pub data: IterData,
    pub num_nodes: usize,
    pub finish_time: Option<Instant>,
}
pub trait IterationData: Sized
{
    /// Given the current [`Runner`], make the
    /// data to be put in this [`Iteration`].
    fn make<CustomErrorT>(runner: &Runner<Self, CustomErrorT>) -> Self
    where
        CustomErrorT: Clone;
}

impl IterationData for ()
{
    fn make<CustomErrorT>(_: &Runner<Self, CustomErrorT>) -> Self
    where
        CustomErrorT: Clone,
    {
    }
}

pub struct RunnerLimits {
    iter_limit: usize,
    node_limit: usize,
    start_time: Option<Instant>,
    time_limit: Duration,
}
/// Type alias for the result of a [`Runner`].
pub type RunnerResult<T, CustomErrorT = String> = Result<T, CCXStopReason<CustomErrorT>>;

impl RunnerLimits {
    fn check_limits<CustomErrorT>(
        &self,
        iteration: usize,
        eg: &MyEGraph,
    ) -> RunnerResult<(), CustomErrorT>
    where
        CustomErrorT: Clone,
    {
        let elapsed = self.start_time.unwrap().elapsed();
        if iteration > self.iter_limit {
            Err(CCXStopReason::IterationLimit)
        } else if get_all_nodes(eg) > self.node_limit { // eg.total_number_of_nodes() > self.node_limit
            Err(CCXStopReason::NodeLimit)
        } else if elapsed > self.time_limit {
            Err(CCXStopReason::TimeLimit)
        } else {
            Ok(())
        }
    }
}

pub struct Runner<IterData = (), CustomErrorT = String>
where
    IterData: IterationData,
    CustomErrorT: Clone,
{
    /// The [`EGraph`] used.
    pub egraph: MyEGraph,
    /// Data accumulated over each [`Iteration`].
    pub iterations: Vec<Iteration<IterData>>,
    /// Why the `Runner` stopped. This will be `None` if it hasn't
    /// stopped yet.
    pub stop_reason: Option<CCXStopReason<CustomErrorT>>,
    // Initial expressions in the EGraph
    pub limits: RunnerLimits,
    /// hooks
    pub hooks: Vec<Box<dyn FnMut(&mut Self) -> Result<(), CustomErrorT> + 'static>>,

    /// Maximal size of terms considered
    pub max: u64,
    /// The list of symbols of the language with their arity
    pub symbol_list: Vec<(String, u8)>,
    /// The two working queues
    pub wo: VecDeque<AppliedId>,
    pub us: VecDeque<AppliedId>,//PrioQueue<AppliedId>, 
}

impl<IterData, CustomErrorT> Runner<IterData, CustomErrorT>
where
    IterData: IterationData,
    CustomErrorT: Clone,
{
    pub fn new(n: SizeNoAppSymbols) -> Self {
        Self {
            egraph: EGraph::new(n),
            iterations: vec![],
            stop_reason: None,
            limits: RunnerLimits {
                iter_limit: 30,
                node_limit: 10_000,
                time_limit: Duration::from_secs(60),
                // The start_time is initialized when the Runner is ran
                start_time: None,
            },
            hooks: vec![],
            max: 10,
            symbol_list: vec![],
            wo: VecDeque::new(),
            us: VecDeque::new(),//PrioQueue::new(cmp_pq),
        }
    }

    pub fn with_hook<F>(mut self, hook: F) -> Self
    where
        F: FnMut(&mut Self) -> Result<(), CustomErrorT> + 'static,
    {
        self.hooks.push(Box::new(hook));
        self
    }
    pub fn with_egraph(mut self, egraph: MyEGraph) -> Self {
        // You should probably not use this if you use `with_expr` as well
        self.egraph = egraph;
        self
    }
    pub fn with_node_limit(mut self, node_limit: usize) -> Self {
        self.limits.node_limit = node_limit;
        self
    }
    pub fn with_iter_limit(mut self, iter_limit: usize) -> Self {
        self.limits.iter_limit = iter_limit;
        self
    }
    pub fn with_time_limit(mut self, time_limit: Duration) -> Self {
        self.limits.time_limit = time_limit;
        self
    }

    fn check_limits(&mut self) -> RunnerResult<(), CustomErrorT> {
        self.limits
            .check_limits(self.iterations.len(), &self.egraph)
    }

    pub fn run(&mut self, initial_wo_size: usize, initial_us_size: usize) -> CCXReport<CustomErrorT> {
        println!("run - entry");
        let mut n = 0;
        loop {
            println!("run - loop {n}");
            if let Some(_) = self.stop_reason {
                break;
            }
            let iter = self.run_one(); //self.run_one(rewrites);
            self.iterations.push(iter);
            n += 1;
        }
        CCXReport {
            iterations: self.iterations.len(),
            stop_reason: self.stop_reason.clone().unwrap(),
            egraph_nodes: get_all_nodes(&self.egraph), // self.egraph.total_number_of_nodes(),
            egraph_classes: self.egraph.classes.len(),
            total_time: self
                .iterations
                .last()
                .unwrap()
                .finish_time
                .unwrap()
                .duration_since(self.limits.start_time.unwrap())
                .as_secs_f64(),
            size_wo: self.wo.len(),
            size_us: self.us.len(),
            initial_size_wo: initial_wo_size,
            initial_size_us: initial_us_size,
        }
    }

    fn run_one(&mut self) -> Iteration<IterData> {
        println!("run_one - entry");
        assert!(self.stop_reason.is_none());

        // if the runner has not started, start the timer
        self.limits.start_time.get_or_insert_with(Instant::now);
        let mut hooks = std::mem::take(&mut self.hooks);

        let mut result: Result<(), CCXStopReason<CustomErrorT>> = Ok(());
        println!("run_one - before ccx_step");
        // Do one step, then check hooks, then check limits, then check if saturated.
        let us_empty = ccx_step(&mut self.egraph, self.max, &self.symbol_list, &mut self.wo, &mut self.us, self.limits.time_limit.clone());  //apply_rewrites(&mut self.egraph, rewrites); 
        println!("run_one - after ccx_step");
        result = result
            .and_then(|_| {
                hooks
                    .iter_mut()
                    .try_for_each(|hook| hook(self).map_err(|err| CCXStopReason::Other(err)))
            })
            .and_then(|_| self.check_limits());

        if us_empty {
            result = result.and_then(|_| Err(CCXStopReason::EmptyUs));
        }

        if let Err(stop_reason) = result {
            self.stop_reason = Some(stop_reason);
        }
        self.hooks = hooks;
        println!("run_one - end");
        Iteration {
            data: IterData::make(self),
            num_nodes: self.egraph.total_number_of_nodes(),
            finish_time: Some(Instant::now()),
        }
    }
}

impl<IterData, CustomErrorT> Default for Runner<IterData, CustomErrorT>
where
    IterData: IterationData,
    CustomErrorT: Clone,
{
    fn default() -> Self {
        Runner::new(Default::default())
    }
}