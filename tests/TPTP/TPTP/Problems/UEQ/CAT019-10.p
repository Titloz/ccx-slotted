%------------------------------------------------------------------------------
% File     : CAT019-10 : TPTP v9.0.0. Released v7.3.0.
% Domain   : Puzzles
% Problem  : Axiom of Indiscernibles
% Version  : Especial.
% English  :

% Refs     : [CS18]  Claessen & Smallbone (2018), Efficient Encodings of Fi
%          : [Sma18] Smallbone (2018), Email to Geoff Sutcliffe
% Source   : [Sma18]
% Names    :

% Status   : Satisfiable
% Rating   : 0.57 v9.0.0, 0.33 v8.2.0, 0.00 v8.1.0, 0.25 v7.5.0, 0.00 v7.3.0
% Syntax   : Number of clauses     :   18 (  18 unt;   0 nHn;   1 RR)
%            Number of literals    :   18 (  18 equ;   1 neg)
%            Maximal clause size   :    1 (   1 avg)
%            Maximal term depth    :    5 (   2 avg)
%            Number of predicates  :    1 (   0 usr;   0 prp; 2-2 aty)
%            Number of functors    :   12 (  12 usr;   3 con; 0-4 aty)
%            Number of variables   :   32 (   6 sgn)
% SPC      : CNF_SAT_RFO_PEQ_UEQ

% Comments : Converted from CAT019-4 to UEQ using [CS18].
%------------------------------------------------------------------------------
cnf(ifeq_axiom,axiom,
    ifeq4(A,A,B,C) = B ).

cnf(ifeq_axiom_001,axiom,
    ifeq3(A,A,B,C) = B ).

cnf(ifeq_axiom_002,axiom,
    ifeq2(A,A,B,C) = B ).

cnf(ifeq_axiom_003,axiom,
    ifeq(A,A,B,C) = B ).

cnf(equivalence_implies_existence1,axiom,
    ifeq(equivalent(X,Y),true,there_exists(X),true) = true ).

cnf(equivalence_implies_existence2,axiom,
    ifeq2(equivalent(X,Y),true,X,Y) = Y ).

cnf(existence_and_equality_implies_equivalence1,axiom,
    ifeq(there_exists(Y),true,equivalent(Y,Y),true) = true ).

cnf(domain_has_elements,axiom,
    ifeq(there_exists(domain(X)),true,there_exists(X),true) = true ).

cnf(codomain_has_elements,axiom,
    ifeq(there_exists(codomain(X)),true,there_exists(X),true) = true ).

cnf(composition_implies_domain,axiom,
    ifeq(there_exists(compose(X,Y)),true,there_exists(domain(X)),true) = true ).

cnf(domain_codomain_composition1,axiom,
    ifeq2(there_exists(compose(X,Y)),true,domain(X),codomain(Y)) = codomain(Y) ).

cnf(domain_codomain_composition2,axiom,
    ifeq(there_exists(domain(X)),true,ifeq3(domain(X),codomain(Y),there_exists(compose(X,Y)),true),true) = true ).

cnf(associativity_of_compose,axiom,
    compose(X,compose(Y,Z)) = compose(compose(X,Y),Z) ).

cnf(compose_domain,axiom,
    compose(X,domain(X)) = X ).

cnf(compose_codomain,axiom,
    compose(codomain(X),X) = X ).

cnf(equality_of_a_and_b1,hypothesis,
    ifeq2(there_exists(Z),true,ifeq4(a,Z,b,Z),Z) = Z ).

cnf(equality_of_a_and_b2,hypothesis,
    ifeq2(there_exists(Z),true,ifeq4(b,Z,a,Z),Z) = Z ).

cnf(prove_a_equals_b,negated_conjecture,
    a != b ).

%------------------------------------------------------------------------------
