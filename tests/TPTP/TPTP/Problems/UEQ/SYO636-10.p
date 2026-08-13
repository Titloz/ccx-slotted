%------------------------------------------------------------------------------
% File     : SYO636-10 : TPTP v9.0.0. Released v7.5.0.
% Domain   : Puzzles
% Problem  : Quine
% Version  : Especial.
% English  :

% Refs     : [CS18]  Claessen & Smallbone (2018), Efficient Encodings of Fi
%          : [Sma18] Smallbone (2018), Email to Geoff Sutcliffe
% Source   : [Sma18]
% Names    :

% Status   : Satisfiable
% Rating   : 1.00 v7.5.0
% Syntax   : Number of clauses     :    4 (   4 unt;   0 nHn;   1 RR)
%            Number of literals    :    4 (   4 equ;   1 neg)
%            Maximal clause size   :    1 (   1 avg)
%            Maximal term depth    :    4 (   1 avg)
%            Number of predicates  :    1 (   0 usr;   0 prp; 2-2 aty)
%            Number of functors    :    4 (   4 usr;   1 con; 0-4 aty)
%            Number of variables   :    7 (   1 sgn)
% SPC      : CNF_SAT_RFO_PEQ_UEQ

% Comments : Converted from SYO636+1 to UEQ using [CS18].
%------------------------------------------------------------------------------
cnf(ifeq_axiom,axiom,
    ifeq(A,A,B,C) = B ).

cnf(quine_2,axiom,
    ifeq(f(sK1_quine_Y(X),Z),true,f(X,Z),true) = true ).

cnf(quine_1,axiom,
    f(X,X) != true ).

cnf(quine,axiom,
    f(X,sK1_quine_Y(X)) = true ).

%------------------------------------------------------------------------------
