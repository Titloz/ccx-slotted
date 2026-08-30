%------------------------------------------------------------------------------
% File     : PUZ054-10 : TPTP v9.0.0. Released v7.5.0.
% Domain   : Puzzles
% Problem  : Take black and white balls from a bag
% Version  : Especial.
% English  :

% Refs     : [CS18]  Claessen & Smallbone (2018), Efficient Encodings of Fi
%          : [Sma18] Smallbone (2018), Email to Geoff Sutcliffe
% Source   : [Sma18]
% Names    :

% Status   : Satisfiable
% Rating   : 0.00 v7.5.0
% Syntax   : Number of clauses     :    6 (   6 unt;   0 nHn;   2 RR)
%            Number of literals    :    6 (   6 equ;   1 neg)
%            Maximal clause size   :    1 (   1 avg)
%            Maximal term depth    :   12 (   3 avg)
%            Number of predicates  :    1 (   0 usr;   0 prp; 2-2 aty)
%            Number of functors    :    5 (   5 usr;   2 con; 0-4 aty)
%            Number of variables   :    9 (   1 sgn)
% SPC      : CNF_SAT_RFO_PEQ_UEQ

% Comments : Converted from PUZ054-1 to UEQ using [CS18].
%------------------------------------------------------------------------------
cnf(ifeq_axiom,axiom,
    ifeq(A,A,B,C) = B ).

cnf(initial_state,axiom,
    p(s(s(s(s(s(s(s(s(s(s(n0)))))))))),s(s(s(s(s(s(s(s(s(n0)))))))))) = true ).

cnf(two_whites_out_one_black_in,axiom,
    ifeq(p(s(s(X)),Y),true,p(X,s(Y)),true) = true ).

cnf(two_blacks_out_one_black_in,axiom,
    ifeq(p(X,s(s(Y))),true,p(X,s(Y)),true) = true ).

cnf(two_different_balls_out_one_white_in,axiom,
    ifeq(p(s(X),s(Y)),true,p(s(X),Y),true) = true ).

cnf(goal_state,negated_conjecture,
    p(s(n0),n0) != true ).

%------------------------------------------------------------------------------
