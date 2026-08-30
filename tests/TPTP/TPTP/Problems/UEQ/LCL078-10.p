%------------------------------------------------------------------------------
% File     : LCL078-10 : TPTP v9.0.0. Released v7.5.0.
% Domain   : Puzzles
% Problem  : CN-40 depends on CN-18 CN-35 CN-46
% Version  : Especial.
% English  :

% Refs     : [CS18]  Claessen & Smallbone (2018), Efficient Encodings of Fi
%          : [Sma18] Smallbone (2018), Email to Geoff Sutcliffe
% Source   : [Sma18]
% Names    :

% Status   : Satisfiable
% Rating   : 0.43 v9.0.0, 0.22 v8.2.0, 0.00 v8.1.0, 0.25 v7.5.0
% Syntax   : Number of clauses     :    6 (   6 unt;   0 nHn;   1 RR)
%            Number of literals    :    6 (   6 equ;   1 neg)
%            Maximal clause size   :    1 (   1 avg)
%            Maximal term depth    :    5 (   2 avg)
%            Number of predicates  :    1 (   0 usr;   0 prp; 2-2 aty)
%            Number of functors    :    6 (   6 usr;   2 con; 0-4 aty)
%            Number of variables   :   12 (   2 sgn)
% SPC      : CNF_SAT_RFO_PEQ_UEQ

% Comments : Converted from LCL078-1 to UEQ using [CS18].
%------------------------------------------------------------------------------
cnf(ifeq_axiom,axiom,
    ifeq(A,A,B,C) = B ).

cnf(condensed_detachment,axiom,
    ifeq(is_a_theorem(implies(X,Y)),true,ifeq(is_a_theorem(X),true,is_a_theorem(Y),true),true) = true ).

cnf(cn_18,axiom,
    is_a_theorem(implies(X,implies(Y,X))) = true ).

cnf(cn_35,axiom,
    is_a_theorem(implies(implies(X,implies(Y,Z)),implies(implies(X,Y),implies(X,Z)))) = true ).

cnf(cn_46,axiom,
    is_a_theorem(implies(implies(Y,X),implies(fnot(X),fnot(Y)))) = true ).

cnf(prove_cn_40,negated_conjecture,
    is_a_theorem(implies(a,fnot(fnot(a)))) != true ).

%------------------------------------------------------------------------------
