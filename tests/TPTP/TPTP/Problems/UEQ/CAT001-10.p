%------------------------------------------------------------------------------
% File     : CAT001-10 : TPTP v9.0.0. Released v7.5.0.
% Domain   : Puzzles
% Problem  : XY monomorphism => Y monomorphism
% Version  : Especial.
% English  :

% Refs     : [CS18]  Claessen & Smallbone (2018), Efficient Encodings of Fi
%          : [Sma18] Smallbone (2018), Email to Geoff Sutcliffe
% Source   : [Sma18]
% Names    :

% Status   : Satisfiable
% Rating   : 0.14 v9.0.0, 0.11 v8.2.0, 0.00 v7.5.0
% Syntax   : Number of clauses     :   14 (  14 unt;   0 nHn;   5 RR)
%            Number of literals    :   14 (  14 equ;   1 neg)
%            Maximal clause size   :    1 (   1 avg)
%            Maximal term depth    :    7 (   2 avg)
%            Number of predicates  :    1 (   0 usr;   0 prp; 2-2 aty)
%            Number of functors    :    8 (   8 usr;   4 con; 0-4 aty)
%            Number of variables   :   17 (   1 sgn)
% SPC      : CNF_SAT_RFO_PEQ_UEQ

% Comments : Converted from CAT001-2 to UEQ using [CS18].
%------------------------------------------------------------------------------
cnf(ifeq_axiom,axiom,
    ifeq(A,A,B,C) = B ).

cnf(codomain_of_domain_is_domain,axiom,
    codomain(domain(X)) = domain(X) ).

cnf(domain_of_codomain_is_codomain,axiom,
    domain(codomain(X)) = codomain(X) ).

cnf(domain_composition,axiom,
    compose(domain(X),X) = X ).

cnf(codomain_composition,axiom,
    compose(X,codomain(X)) = X ).

cnf(codomain_domain1,axiom,
    ifeq(codomain(X),domain(Y),domain(compose(X,Y)),domain(X)) = domain(X) ).

cnf(codomain_domain2,axiom,
    ifeq(codomain(X),domain(Y),codomain(compose(X,Y)),codomain(Y)) = codomain(Y) ).

cnf(star_property,axiom,
    ifeq(codomain(Y),domain(Z),ifeq(codomain(X),domain(Y),compose(X,compose(Y,Z)),compose(compose(X,Y),Z)),compose(compose(X,Y),Z)) = compose(compose(X,Y),Z) ).

cnf(c1,hypothesis,
    ifeq(codomain(Z),domain(compose(a,b)),ifeq(codomain(X),domain(compose(a,b)),ifeq(compose(Z,compose(a,b)),Y,ifeq(compose(X,compose(a,b)),Y,X,Z),Z),Z),Z) = Z ).

cnf(codomain_of_a_equals_domain_of_b,hypothesis,
    codomain(a) = domain(b) ).

cnf(codomain_of_a_equals_domain_of_h,hypothesis,
    codomain(a) = domain(h) ).

cnf(codomain_of_a_equals_domain_of_g,hypothesis,
    codomain(a) = domain(g) ).

cnf(ah_equals_ag,hypothesis,
    compose(a,h) = compose(a,g) ).

cnf(prove_h_equals_g,negated_conjecture,
    h != g ).

%------------------------------------------------------------------------------
