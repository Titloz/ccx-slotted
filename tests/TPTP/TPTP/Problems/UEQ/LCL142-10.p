%------------------------------------------------------------------------------
% File     : LCL142-10 : TPTP v9.0.0. Released v7.3.0.
% Domain   : Puzzles
% Problem  : A theorem in the lattice structure of Wajsberg algebras
% Version  : Especial.
% English  :

% Refs     : [CS18]  Claessen & Smallbone (2018), Efficient Encodings of Fi
%          : [Sma18] Smallbone (2018), Email to Geoff Sutcliffe
% Source   : [Sma18]
% Names    :

% Status   : Satisfiable
% Rating   : 0.43 v9.0.0, 0.22 v8.2.0, 0.00 v8.1.0, 0.25 v7.5.0, 0.00 v7.3.0
% Syntax   : Number of clauses     :   12 (  12 unt;   0 nHn;   2 RR)
%            Number of literals    :   12 (  12 equ;   1 neg)
%            Maximal clause size   :    1 (   1 avg)
%            Maximal term depth    :    4 (   2 avg)
%            Number of predicates  :    1 (   0 usr;   0 prp; 2-2 aty)
%            Number of functors    :   12 (  12 usr;   5 con; 0-4 aty)
%            Number of variables   :   22 (   2 sgn)
% SPC      : CNF_SAT_RFO_PEQ_UEQ

% Comments : Converted from LCL142-1 to UEQ using [CS18].
%------------------------------------------------------------------------------
cnf(ifeq_axiom,axiom,
    ifeq2(A,A,B,C) = B ).

cnf(ifeq_axiom_001,axiom,
    ifeq(A,A,B,C) = B ).

cnf(wajsberg_1,axiom,
    implies(truth,X) = X ).

cnf(wajsberg_2,axiom,
    implies(implies(X,Y),implies(implies(Y,Z),implies(X,Z))) = truth ).

cnf(wajsberg_3,axiom,
    implies(implies(X,Y),Y) = implies(implies(Y,X),X) ).

cnf(wajsberg_4,axiom,
    implies(implies(fnot(X),fnot(Y)),implies(Y,X)) = truth ).

cnf(big_V_definition,axiom,
    big_V(X,Y) = implies(implies(X,Y),Y) ).

cnf(big_hat_definition,axiom,
    big_hat(X,Y) = fnot(big_V(fnot(X),fnot(Y))) ).

cnf(partial_order_definition1,axiom,
    ifeq(ordered(X,Y),true,implies(X,Y),truth) = truth ).

cnf(partial_order_definition2,axiom,
    ifeq2(implies(X,Y),truth,ordered(X,Y),true) = true ).

cnf(antecedent,negated_conjecture,
    ordered(x,y) = true ).

cnf(prove_wajsberg_theorem,negated_conjecture,
    ordered(implies(x,z),implies(y,z)) != true ).

%------------------------------------------------------------------------------
