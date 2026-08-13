%------------------------------------------------------------------------------
% File     : GRP112-10 : TPTP v9.0.0. Released v7.3.0.
% Domain   : Puzzles
% Problem  : Single axiom for group theory, in product & inverse
% Version  : Especial.
% English  :

% Refs     : [CS18]  Claessen & Smallbone (2018), Efficient Encodings of Fi
%          : [Sma18] Smallbone (2018), Email to Geoff Sutcliffe
% Source   : [Sma18]
% Names    :

% Status   : Satisfiable
% Rating   : 0.43 v9.0.0, 0.11 v8.2.0, 0.00 v8.1.0, 0.25 v7.5.0, 0.00 v7.3.0
% Syntax   : Number of clauses     :    2 (   2 unt;   0 nHn;   1 RR)
%            Number of literals    :    2 (   2 equ;   1 neg)
%            Maximal clause size   :    1 (   1 avg)
%            Maximal term depth    :    5 (   2 avg)
%            Number of predicates  :    1 (   0 usr;   0 prp; 2-2 aty)
%            Number of functors    :   12 (  12 usr;   9 con; 0-4 aty)
%            Number of variables   :    3 (   0 sgn)
% SPC      : CNF_SAT_RFO_PEQ_UEQ

% Comments : Converted from GRP112-1 to UEQ using [CS18].
%------------------------------------------------------------------------------
cnf(single_axiom,axiom,
    multiply(multiply(multiply(X,Y),Z),multiply(X,Z)) = Y ).

cnf(prove_these_axioms,negated_conjecture,
    tuple(multiply(multiply(inverse(b2),b2),a2),multiply(multiply(a3,b3),c3),multiply(inverse(a1),a1),multiply(a4,a4)) != tuple(a2,multiply(a3,multiply(b3,c3)),multiply(inverse(b1),b1),multiply(b4,b4)) ).

%------------------------------------------------------------------------------
