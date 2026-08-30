%--------------------------------------------------------------------------
% File     : BOO030-1 : TPTP v9.0.0. Released v2.2.0.
% Domain   : Boolean Algebra
% Problem  : Independence of a BA 2-basis by majority reduction.
% Version  : [MP96] (equality) axioms : Especial.
% English  : This shows that the self-dual 2-basis for Boolean algebra
%            (majority reduction) of problem DUAL-BA-5 is independent,
%            in particular, that half of the 2-basis is fnot a basis.

% Refs     : [McC98] McCune (1998), Email to G. Sutcliffe
%          : [MP96]  McCune & Padmanabhan (1996), Automated Deduction in Eq
% Source   : [McC98]
% Names    : DUAL-BA-6 [MP96]

% Status   : Satisfiable
% Rating   : 0.43 v9.0.0, 0.22 v8.2.0, 0.00 v8.1.0, 0.25 v7.5.0, 0.00 v6.1.0, 0.20 v6.0.0, 0.00 v5.5.0, 0.20 v5.4.0, 0.50 v5.3.0, 0.67 v5.2.0, 0.33 v3.2.0, 0.67 v3.1.0, 0.33 v2.4.0, 0.67 v2.3.0, 1.00 v2.2.1
% Syntax   : Number of clauses     :    7 (   7 unt;   0 nHn;   1 RR)
%            Number of literals    :    7 (   7 equ;   1 neg)
%            Maximal clause size   :    1 (   1 avg)
%            Maximal term depth    :    4 (   2 avg)
%            Number of predicates  :    1 (   0 usr;   0 prp; 2-2 aty)
%            Number of functors    :    4 (   4 usr;   1 con; 0-2 aty)
%            Number of variables   :   14 (   5 sgn)
% SPC      : CNF_SAT_RFO_PEQ_UEQ

% Comments : There is a 2-element model.
%--------------------------------------------------------------------------
%----Properties L1, L3, and B1 of Boolean Algebra:
cnf(l1,axiom,
    add(X,multiply(Y,multiply(X,Z))) = X ).

cnf(l3,axiom,
    add(add(multiply(X,Y),multiply(Y,Z)),Y) = Y ).

cnf(b1,axiom,
    multiply(add(X,Y),add(X,inverse(Y))) = X ).

%----Majority reduction properties:
cnf(majority1,axiom,
    multiply(add(multiply(X,Y),X),add(X,Y)) = X ).

cnf(majority2,axiom,
    multiply(add(multiply(X,X),Y),add(X,X)) = X ).

cnf(majority3,axiom,
    multiply(add(multiply(X,Y),Y),add(X,Y)) = Y ).

%----Denial of a property of Boolean Algebra.
cnf(prove_inverse_involution,negated_conjecture,
    inverse(inverse(a)) != a ).

%--------------------------------------------------------------------------
