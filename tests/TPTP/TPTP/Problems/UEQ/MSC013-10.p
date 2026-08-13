%------------------------------------------------------------------------------
% File     : MSC013-10 : TPTP v9.0.0. Released v7.3.0.
% Domain   : Puzzles
% Problem  : Single-valued relation between 5-tuple and domain element
% Version  : Especial.
% English  :

% Refs     : [CS18]  Claessen & Smallbone (2018), Efficient Encodings of Fi
%          : [Sma18] Smallbone (2018), Email to Geoff Sutcliffe
% Source   : [Sma18]
% Names    :

% Status   : Satisfiable
% Rating   : 0.43 v9.0.0, 0.44 v8.2.0, 0.80 v8.1.0, 0.50 v7.5.0, 0.75 v7.3.0
% Syntax   : Number of clauses     :   12 (  12 unt;   0 nHn;   5 RR)
%            Number of literals    :   12 (  12 equ;   1 neg)
%            Maximal clause size   :    1 (   1 avg)
%            Maximal term depth    :    8 (   1 avg)
%            Number of predicates  :    1 (   0 usr;   0 prp; 2-2 aty)
%            Number of functors    :    8 (   8 usr;   4 con; 0-6 aty)
%            Number of variables   :   63 (  41 sgn)
% SPC      : CNF_SAT_RFO_PEQ_UEQ

% Comments : Converted from MSC013+1 to UEQ using [CS18].
%------------------------------------------------------------------------------
cnf(ifeq_axiom,axiom,
    ifeq(A,A,B,C) = B ).

cnf(n0_and_n1_reflexive_1,axiom,
    equalish(n0,n0) = true ).

cnf(n0_and_n1_reflexive,axiom,
    equalish(n1,n1) = true ).

cnf(n0_equal_n1,axiom,
    ifeq(equalish(n0,n1),true,goal,true) = true ).

cnf(n1_equal_n0,axiom,
    ifeq(equalish(n1,n0),true,goal,true) = true ).

cnf(relation_exists,axiom,
    ifeq(equalish(E,E),true,ifeq(equalish(D,D),true,ifeq(equalish(C,C),true,ifeq(equalish(B,B),true,ifeq(equalish(A,A),true,f(A,B,C,D,E,sK1_relation_exists_F(A,B,C,D,E)),true),true),true),true),true) = true ).

cnf(relation_injective_4,axiom,
    ifeq(f(F,G,H,I,J,K),true,ifeq(f(A,B,C,D,E,K),true,equalish(E,J),true),true) = true ).

cnf(relation_injective_3,axiom,
    ifeq(f(F,G,H,I,J,K),true,ifeq(f(A,B,C,D,E,K),true,equalish(D,I),true),true) = true ).

cnf(relation_injective_2,axiom,
    ifeq(f(F,G,H,I,J,K),true,ifeq(f(A,B,C,D,E,K),true,equalish(C,H),true),true) = true ).

cnf(relation_injective_1,axiom,
    ifeq(f(F,G,H,I,J,K),true,ifeq(f(A,B,C,D,E,K),true,equalish(B,G),true),true) = true ).

cnf(relation_injective,axiom,
    ifeq(f(F,G,H,I,J,K),true,ifeq(f(A,B,C,D,E,K),true,equalish(A,F),true),true) = true ).

cnf(goal_to_be_proved,negated_conjecture,
    goal != true ).

%------------------------------------------------------------------------------
