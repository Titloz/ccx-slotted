#[derive(Debug, Clone)]
pub enum CCXStopReason<T = String>
where
    T: Clone,
{
    EmptyUs,
    IterationLimit,
    TimeLimit,
    NodeLimit,
    Other(T),
}

#[derive(Debug, Clone)]
pub struct CCXReport<T = String>
where
    T: Clone,
{
    pub iterations: usize,
    pub stop_reason: CCXStopReason<T>,
    pub egraph_nodes: usize,
    pub egraph_classes: usize,
    pub total_time: f64,
}