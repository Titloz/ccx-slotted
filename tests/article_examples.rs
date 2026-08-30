fn test1() {
    let symbol_list: Vec<(String, u8)> = vec![("g".to_owned(), 1), ("h".to_owned(), 1), ("a".to_owned(), 0)];
    let eqs: Vec<String> = vec!["(app g (var $x)) = a".to_owned(), "(app h (var $y)) = a".to_owned(), "(app g (app h (var $z))) = (app h (app h (var $z)))".to_owned()];
} // OK

fn test0() {
    let symbol_list: Vec<(String, u8)> = vec![("g".to_owned(), 1), ("h".to_owned(), 1), ("a".to_owned(), 0), ("f".to_owned(), 1), ("b".to_owned(), 0)];
    let eqs: Vec<String> = vec!["(app g (var $x)) = (app h (var $x))".to_owned(), 
                                "(app h (app h (var $y))) = (app f (app h (var $y)))".to_owned()];
} // OK

fn test2() {
    let symbol_list: Vec<(String, u8)> = vec![("f".to_owned(), 1), ("g".to_owned(), 1)];
    let eqs: Vec<String> = vec!["(app f (var $x)) = (app g (var $x))".to_owned()];
} // OK

fn test3() {
    let symbol_list: Vec<(String, u8)> = vec![("f".to_owned(), 2), ("g".to_owned(), 2)];
    let eqs: Vec<String> = vec!["(app (app f (var $x)) (var $y)) = (app (app g (var $x)) (var $y))".to_owned(),
                                "(app (app f (var $x)) (var $y)) = (app (app g (var $y)) (var $x))".to_owned()];
} // OK