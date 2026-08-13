%------------------------------------------------------------------------------
% File     : MGT038-10 : TPTP v9.0.0. Released v7.5.0.
% Domain   : Puzzles
% Problem  : FMs become extinct in stable environments
% Version  : Especial.
% English  :

% Refs     : [CS18]  Claessen & Smallbone (2018), Efficient Encodings of Fi
%          : [Sma18] Smallbone (2018), Email to Geoff Sutcliffe
% Source   : [Sma18]
% Names    :

% Status   : Satisfiable
% Rating   : 0.00 v7.5.0
% Syntax   : Number of clauses     :   14 (  14 unt;   0 nHn;   4 RR)
%            Number of literals    :   14 (  14 equ;   1 neg)
%            Maximal clause size   :    1 (   1 avg)
%            Maximal term depth    :    6 (   2 avg)
%            Number of predicates  :    1 (   0 usr;   0 prp; 2-2 aty)
%            Number of functors    :   22 (  22 usr;   9 con; 0-4 aty)
%            Number of variables   :   21 (   3 sgn)
% SPC      : CNF_SAT_RFO_PEQ_UEQ

% Comments : Converted from MGT038-1 to UEQ using [CS18].
%------------------------------------------------------------------------------
cnf(ifeq_axiom,axiom,
    ifeq2(A,A,B,C) = B ).

cnf(ifeq_axiom_001,axiom,
    ifeq(A,A,B,C) = B ).

cnf(mp7_first_movers_exist_17,axiom,
    finite_set(first_movers) = true ).

cnf(mp_stable_first_movers_18,axiom,
    ifeq(environment(A),true,ifeq(stable(A),true,in_environment(A,appear(first_movers,A)),true),true) = true ).

cnf(mp_contracting_time_19,axiom,
    ifeq(finite_set(A),true,ifeq(contracts_from(B,A),true,greater(sk1(B,A),B),true),true) = true ).

cnf(mp_contracting_time_20,axiom,
    ifeq2(finite_set(A),true,ifeq2(contracts_from(B,A),true,cardinality_at_time(s,t2),zero),zero) = zero ).

cnf(mp_long_stable_environments_21,axiom,
    ifeq(greater(C,B),true,ifeq(in_environment(A,B),true,ifeq(environment(A),true,ifeq(stable(A),true,in_environment(A,C),true),true),true),true) = true ).

cnf(mp_greater_transitivity_22,axiom,
    ifeq(greater(B,C),true,ifeq(greater(A,B),true,greater(A,C),true),true) = true ).

cnf(l9_23,hypothesis,
    ifeq(environment(A),true,ifeq(stable(A),true,greater(sk2(A),appear(efficient_producers,A)),true),true) = true ).

cnf(l9_24,hypothesis,
    ifeq(environment(A),true,ifeq(stable(A),true,contracts_from(sk2(A),first_movers),true),true) = true ).

cnf(a13_25,hypothesis,
    ifeq(environment(A),true,greater(appear(efficient_producers,e),appear(first_movers,A)),true) = true ).

cnf(prove_t7_26,negated_conjecture,
    environment(sk3) = true ).

cnf(prove_t7_27,negated_conjecture,
    stable(sk3) = true ).

cnf(prove_t7_28,negated_conjecture,
    tuple(cardinality_at_time(first_movers,to),in_environment(sk3,A),greater(A,appear(first_movers,sk3))) != tuple(zero,true,true) ).

%------------------------------------------------------------------------------
