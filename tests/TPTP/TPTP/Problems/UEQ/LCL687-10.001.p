%------------------------------------------------------------------------------
% File     : LCL687-10.001 : TPTP v9.0.0. Released v7.3.0.
% Domain   : Puzzles
% Problem  : In S4, formula fnot provable in S5 embedding, size 1
% Version  : Especial.
% English  :

% Refs     : [CS18]  Claessen & Smallbone (2018), Efficient Encodings of Fi
%          : [Sma18] Smallbone (2018), Email to Geoff Sutcliffe
% Source   : [Sma18]
% Names    :

% Status   : Satisfiable
% Rating   : 0.43 v9.0.0, 0.22 v8.2.0, 0.00 v8.1.0, 0.25 v7.5.0, 0.00 v7.3.0
% Syntax   : Number of clauses     :   10 (  10 unt;   0 nHn;   6 RR)
%            Number of literals    :   10 (  10 equ;   1 neg)
%            Maximal clause size   :    1 (   1 avg)
%            Maximal term depth    :    4 (   1 avg)
%            Number of predicates  :    1 (   0 usr;   0 prp; 2-2 aty)
%            Number of functors    :   11 (  11 usr;   5 con; 0-4 aty)
%            Number of variables   :    9 (   1 sgn)
% SPC      : CNF_SAT_RFO_PEQ_UEQ

% Comments : Converted from LCL687+1.001 to UEQ using [CS18].
%------------------------------------------------------------------------------
cnf(ifeq_axiom,axiom,
    ifeq(A,A,B,C) = B ).

cnf(reflexivity,axiom,
    r1(X,X) = true ).

cnf(transitivity,axiom,
    ifeq(r1(Y,Z),true,ifeq(r1(X,Y),true,r1(X,Z),true),true) = true ).

cnf(main,negated_conjecture,
    r1(sK5_main_X,sK4_main_Y) = true ).

cnf(main_1,negated_conjecture,
    r1(sK5_main_X,sK2_main_Y) = true ).

cnf(main_2,negated_conjecture,
    r1(sK4_main_Y,sK3_main_X) = true ).

cnf(main_3,negated_conjecture,
    p6(sK4_main_Y) = true ).

cnf(main_4,negated_conjecture,
    p1(sK3_main_X) = true ).

cnf(main_5,negated_conjecture,
    ifeq(r1(sK2_main_Y,X),true,r1(X,sK1_main_Y(X)),true) = true ).

cnf(main_6,negated_conjecture,
    tuple(r1(sK2_main_Y,X),p6(sK1_main_Y(X))) != tuple(true,true) ).

%------------------------------------------------------------------------------
