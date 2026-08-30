%------------------------------------------------------------------------------
% File     : LCL645-10.001 : TPTP v9.0.0. Released v7.3.0.
% Domain   : Puzzles
% Problem  : In K, L+ is fnot provable with instances of L, size 1
% Version  : Especial.
% English  :

% Refs     : [CS18]  Claessen & Smallbone (2018), Efficient Encodings of Fi
%          : [Sma18] Smallbone (2018), Email to Geoff Sutcliffe
% Source   : [Sma18]
% Names    :

% Status   : Satisfiable
% Rating   : 0.00 v7.3.0
% Syntax   : Number of clauses     :    9 (   9 unt;   0 nHn;   5 RR)
%            Number of literals    :    9 (   9 equ;   1 neg)
%            Maximal clause size   :    1 (   1 avg)
%            Maximal term depth    :    3 (   1 avg)
%            Number of predicates  :    1 (   0 usr;   0 prp; 2-2 aty)
%            Number of functors    :   10 (  10 usr;   6 con; 0-4 aty)
%            Number of variables   :    8 (   2 sgn)
% SPC      : CNF_SAT_RFO_PEQ_UEQ

% Comments : Converted from LCL645+1.001 to UEQ using [CS18].
%------------------------------------------------------------------------------
cnf(ifeq_axiom,axiom,
    ifeq2(A,A,B,C) = B ).

cnf(ifeq_axiom_001,axiom,
    ifeq(A,A,B,C) = B ).

cnf(main,negated_conjecture,
    r1(sK3_main_X,sK2_main_Y) = true ).

cnf(main_1,negated_conjecture,
    r1(sK3_main_X,sK1_main_Y) = true ).

cnf(main_2,negated_conjecture,
    ifeq2(r1(sK2_main_Y,X),true,p1(X),true) = true ).

cnf(main_3,negated_conjecture,
    ifeq2(r1(sK1_main_Y,X),true,p1(X),true) = true ).

cnf(main_4,negated_conjecture,
    ifeq(p1(sK2_main_Y),true,a,b) = b ).

cnf(main_5,negated_conjecture,
    ifeq(p1(sK1_main_Y),true,a,b) = b ).

cnf(goal,negated_conjecture,
    a != b ).

%------------------------------------------------------------------------------
