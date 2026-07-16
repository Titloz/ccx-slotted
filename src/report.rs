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

impl<T: Clone + std::fmt::Display> std::fmt::Display for CCXStopReason<T> {
    /// A single, CSV-safe token (no `;`, no newline) for each stop reason.
    fn fmt(&self, f: &mut std::fmt::Formatter<'_>) -> std::fmt::Result {
        match self {
            CCXStopReason::EmptyUs => write!(f, "EmptyUs"),
            CCXStopReason::IterationLimit => write!(f, "IterationLimit"),
            CCXStopReason::TimeLimit => write!(f, "TimeLimit"),
            CCXStopReason::NodeLimit => write!(f, "NodeLimit"),
            CCXStopReason::Other(msg) => {
                // keep it on one field: strip separators/newlines
                let cleaned: String = msg
                    .to_string()
                    .chars()
                    .map(|c| if c == ';' || c == '\n' || c == '\r' { ' ' } else { c })
                    .collect();
                write!(f, "Other({})", cleaned.trim())
            }
        }
    }
}
