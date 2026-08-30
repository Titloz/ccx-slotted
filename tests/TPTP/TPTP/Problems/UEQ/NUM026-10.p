%------------------------------------------------------------------------------
% File     : NUM026-10 : TPTP v9.0.0. Released v7.3.0.
% Domain   : Puzzles
% Problem  : Less preserved over multiplication by a number
% Version  : Especial.
% English  :

% Refs     : [CS18]  Claessen & Smallbone (2018), Efficient Encodings of Fi
%          : [Sma18] Smallbone (2018), Email to Geoff Sutcliffe
% Source   : [Sma18]
% Names    :

% Status   : Unknown
% Rating   : 1.00 v7.3.0
% Syntax   : Number of clauses     :   20 (  20 unt;   0 nHn;   4 RR)
%            Number of literals    :   20 (  20 equ;   1 neg)
%            Maximal clause size   :    1 (   1 avg)
%            Maximal term depth    :    6 (   2 avg)
%            Number of predicates  :    1 (   0 usr;   0 prp; 2-2 aty)
%            Number of functors    :   15 (  15 usr;   7 con; 0-4 aty)
%            Number of variables   :   32 (   5 sgn)
% SPC      : CNF_UNK_RFO_PEQ_UEQ

% Comments : Converted from NUM026-1 to UEQ using [CS18].
%------------------------------------------------------------------------------
cnf(ifeq_axiom,axiom,
    ifeq2(A,A,B,C) = B ).

cnf(ifeq_axiom_001,axiom,
    ifeq(A,A,B,C) = B ).

cnf(adding_zero,axiom,
    equalish(add(A,n0),A) = true ).

cnf(addition,axiom,
    equalish(add(A,successor(B)),successor(add(A,B))) = true ).

cnf(times_zero,axiom,
    equalish(multiply(A,n0),n0) = true ).

cnf(times,axiom,
    equalish(multiply(A,successor(B)),add(multiply(A,B),A)) = true ).

cnf(successor_equality1,axiom,
    ifeq2(equalish(successor(A),successor(B)),true,equalish(A,B),true) = true ).

cnf(successor_substitution,axiom,
    ifeq2(equalish(A,B),true,equalish(successor(A),successor(B)),true) = true ).

cnf(transitivity_of_less,axiom,
    ifeq2(less(C,A),true,ifeq2(less(A,B),true,less(C,B),true),true) = true ).

cnf(smaller_number,axiom,
    ifeq2(equalish(add(successor(A),B),C),true,less(B,C),true) = true ).

cnf(less_lemma,axiom,
    ifeq2(less(A,B),true,equalish(add(successor(predecessor_of_1st_minus_2nd(B,A)),A),B),true) = true ).

cnf(reflexivity,axiom,
    equalish(X,X) = true ).

cnf(symmetry,axiom,
    ifeq2(equalish(X,Y),true,equalish(Y,X),true) = true ).

cnf(transitivity,axiom,
    ifeq2(equalish(Y,Z),true,ifeq2(equalish(X,Y),true,equalish(X,Z),true),true) = true ).

cnf(a_less_than_b,hypothesis,
    less(a,b) = true ).

cnf(zero_is_the_first_number,axiom,
    ifeq(equalish(successor(A),n0),true,a2,b2) = b2 ).

cnf(no_number_less_than_itself,axiom,
    ifeq(less(A,A),true,a2,b2) = b2 ).

cnf(c_fnot_0,hypothesis,
    ifeq(equalish(c,n0),true,a2,b2) = b2 ).

cnf(prove_a_times_c_less_b_times_c,negated_conjecture,
    ifeq(less(multiply(a,c),multiply(b,c)),true,a2,b2) = b2 ).

cnf(goal,negated_conjecture,
    a2 != b2 ).

%------------------------------------------------------------------------------
