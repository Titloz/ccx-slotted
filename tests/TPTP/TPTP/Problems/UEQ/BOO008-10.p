%------------------------------------------------------------------------------
% File     : BOO008-10 : TPTP v9.0.0. Released v7.5.0.
% Domain   : Puzzles
% Problem  : Sum is associative ( (X + Y) + Z = X + (Y + Z) )
% Version  : Especial.
% English  :

% Refs     : [CS18]  Claessen & Smallbone (2018), Efficient Encodings of Fi
%          : [Sma18] Smallbone (2018), Email to Geoff Sutcliffe
% Source   : [Sma18]
% Names    :

% Status   : Satisfiable
% Rating   : 0.43 v9.0.0, 0.22 v8.2.0, 0.00 v8.1.0, 0.25 v7.5.0
% Syntax   : Number of clauses     :   22 (  22 unt;   0 nHn;   5 RR)
%            Number of literals    :   22 (  22 equ;   1 neg)
%            Maximal clause size   :    1 (   1 avg)
%            Maximal term depth    :    6 (   1 avg)
%            Number of predicates  :    1 (   0 usr;   0 prp; 2-2 aty)
%            Number of functors    :   16 (  16 usr;  10 con; 0-4 aty)
%            Number of variables   :   49 (   1 sgn)
% SPC      : CNF_SAT_RFO_PEQ_UEQ

% Comments : Converted from BOO008-3 to UEQ using [CS18].
%------------------------------------------------------------------------------
cnf(ifeq_axiom,axiom,
    ifeq(A,A,B,C) = B ).

cnf(closure_of_addition,axiom,
    sum(X,Y,add(X,Y)) = true ).

cnf(closure_of_multiplication,axiom,
    product(X,Y,multiply(X,Y)) = true ).

cnf(commutativity_of_addition,axiom,
    ifeq(sum(X,Y,Z),true,sum(Y,X,Z),true) = true ).

cnf(commutativity_of_multiplication,axiom,
    ifeq(product(X,Y,Z),true,product(Y,X,Z),true) = true ).

cnf(additive_identity1,axiom,
    sum(additive_identity,X,X) = true ).

cnf(additive_identity2,axiom,
    sum(X,additive_identity,X) = true ).

cnf(multiplicative_identity1,axiom,
    sum(multiplicative_identity,X,X) = true ).

cnf(multiplicative_identity2,axiom,
    sum(X,multiplicative_identity,X) = true ).

cnf(distributivity1,axiom,
    ifeq(product(X,V3,V4),true,ifeq(product(X,Z,V2),true,ifeq(product(X,Y,V1),true,ifeq(sum(Y,Z,V3),true,sum(V1,V2,V4),true),true),true),true) = true ).

cnf(distributivity2,axiom,
    ifeq(product(X,Z,V2),true,ifeq(product(X,Y,V1),true,ifeq(sum(V1,V2,V4),true,ifeq(sum(Y,Z,V3),true,product(X,V3,V4),true),true),true),true) = true ).

cnf(distributivity5,axiom,
    ifeq(product(Y,Z,V3),true,ifeq(sum(X,V3,V4),true,ifeq(sum(X,Z,V2),true,ifeq(sum(X,Y,V1),true,product(V1,V2,V4),true),true),true),true) = true ).

cnf(distributivity6,axiom,
    ifeq(product(V1,V2,V4),true,ifeq(product(Y,Z,V3),true,ifeq(sum(X,Z,V2),true,ifeq(sum(X,Y,V1),true,sum(X,V3,V4),true),true),true),true) = true ).

cnf(additive_inverse1,axiom,
    sum(inverse(X),X,multiplicative_identity) = true ).

cnf(additive_inverse2,axiom,
    sum(X,inverse(X),multiplicative_identity) = true ).

cnf(multiplicative_inverse1,axiom,
    product(inverse(X),X,additive_identity) = true ).

cnf(multiplicative_inverse2,axiom,
    product(X,inverse(X),additive_identity) = true ).

cnf(y_plus_z,hypothesis,
    sum(y,z,y_plus_z) = true ).

cnf(x_plus__y_plus_z,hypothesis,
    sum(x,y_plus_z,x__plus_y_plus_z) = true ).

cnf(x_plus_y,hypothesis,
    sum(x,y,x_plus_y) = true ).

cnf(x_plus_y__plus_z,hypothesis,
    sum(x_plus_y,z,x_plus_y__plus_z) = true ).

cnf(prove_equality,negated_conjecture,
    x__plus_y_plus_z != x_plus_y__plus_z ).

%------------------------------------------------------------------------------
