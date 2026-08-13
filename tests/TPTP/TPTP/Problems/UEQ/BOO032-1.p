%--------------------------------------------------------------------------
% File     : BOO032-1 : TPTP v9.0.0. Released v2.2.0.
% Domain   : Boolean Algebra
% Problem  : Independence of a system of Boolean algebra
% Version  : [MP96] (equality) axioms : Especial.
% English  : This is part of a proof that a self-dual 3-basis for Boolean
%            algebra is independent.

% Refs     : [McC98] McCune (1998), Email to G. Sutcliffe
%          : [MP96]  McCune & Padmanabhan (1996), Automated Deduction in Eq
% Source   : [McC98]
% Names    : DUAL-BA-9 [MP96]

% Status   : Satisfiable
% Rating   : 0.43 v9.0.0, 0.22 v8.2.0, 0.00 v8.1.0, 0.25 v7.5.0, 0.00 v6.2.0, 0.17 v6.1.0, 0.40 v6.0.0, 0.20 v5.5.0, 0.40 v5.4.0, 0.50 v5.3.0, 0.67 v5.2.0, 0.33 v3.2.0, 0.67 v3.1.0, 0.33 v2.5.0, 0.67 v2.4.0, 0.67 v2.3.0, 1.00 v2.2.1
% Syntax   : Number of clauses     :   13 (  13 unt;   0 nHn;   1 RR)
%            Number of literals    :   13 (  13 equ;   1 neg)
%            Maximal clause size   :    1 (   1 avg)
%            Maximal term depth    :    4 (   2 avg)
%            Number of predicates  :    1 (   0 usr;   0 prp; 2-2 aty)
%            Number of functors    :    4 (   4 usr;   1 con; 0-2 aty)
%            Number of variables   :   28 (  10 sgn)
% SPC      : CNF_SAT_RFO_PEQ_UEQ

% Comments : The smallest model has 5 elements.
%--------------------------------------------------------------------------
%----3 properties of Boolean algebra and the corresponding duals.
cnf(l1,axiom,
    add(X,multiply(Y,multiply(X,Z))) = X ).

cnf(l3,axiom,
    add(add(multiply(X,Y),multiply(Y,Z)),Y) = Y ).

cnf(property3,axiom,
    multiply(add(X,inverse(X)),Y) = Y ).

cnf(l2,axiom,
    multiply(X,add(Y,add(X,Z))) = X ).

cnf(l4,axiom,
    multiply(multiply(add(X,Y),add(Y,Z)),Y) = Y ).

cnf(property3_dual,axiom,
    add(multiply(X,inverse(X)),Y) = Y ).

%----Majority polynomials:
cnf(majority1,axiom,
    add(multiply(add(X,Y),X),multiply(X,Y)) = X ).

cnf(majority2,axiom,
    add(multiply(add(X,X),Y),multiply(X,X)) = X ).

cnf(majority3,axiom,
    add(multiply(add(X,Y),Y),multiply(X,Y)) = Y ).

%----Duals of majority polynomials:
cnf(majority1_dual,axiom,
    multiply(add(multiply(X,Y),X),add(X,Y)) = X ).

cnf(majority2_dual,axiom,
    multiply(add(multiply(X,X),Y),add(X,X)) = X ).

cnf(majority3_dual,axiom,
    multiply(add(multiply(X,Y),Y),add(X,Y)) = Y ).

%----A propery of Boolean Algebra fails to hold.
cnf(prove_inverse_involution,negated_conjecture,
    inverse(inverse(a)) != a ).

%--------------------------------------------------------------------------
