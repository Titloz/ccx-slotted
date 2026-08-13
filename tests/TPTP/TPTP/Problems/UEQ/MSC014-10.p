%------------------------------------------------------------------------------
% File     : MSC014-10 : TPTP v9.0.0. Released v7.5.0.
% Domain   : Puzzles
% Problem  : Find a model with a functional relation which is injective, n=4
% Version  : Especial.
% English  :

% Refs     : [CS18]  Claessen & Smallbone (2018), Efficient Encodings of Fi
%          : [Sma18] Smallbone (2018), Email to Geoff Sutcliffe
% Source   : [Sma18]
% Names    :

% Status   : Satisfiable
% Rating   : 0.29 v9.0.0, 0.33 v8.2.0, 0.40 v8.1.0, 0.25 v7.5.0
% Syntax   : Number of clauses     :   12 (  12 unt;   0 nHn;   5 RR)
%            Number of literals    :   12 (  12 equ;   1 neg)
%            Maximal clause size   :    1 (   1 avg)
%            Maximal term depth    :    7 (   1 avg)
%            Number of predicates  :    1 (   0 usr;   0 prp; 2-2 aty)
%            Number of functors    :   10 (  10 usr;   5 con; 0-5 aty)
%            Number of variables   :   46 (  26 sgn)
% SPC      : CNF_SAT_RFO_PEQ_UEQ

% Comments : Converted from MSC014+1 to UEQ using [CS18].
%------------------------------------------------------------------------------
cnf(ifeq_axiom,axiom,
    ifeq2(A,A,B,C) = B ).

cnf(ifeq_axiom_001,axiom,
    ifeq(A,A,B,C) = B ).

cnf(n0_and_n1_reflexive_1,axiom,
    equalish(n0,n0) = true ).

cnf(n0_and_n1_reflexive,axiom,
    equalish(n1,n1) = true ).

cnf(exists_f,axiom,
    ifeq2(equalish(X4,X4),true,ifeq2(equalish(X3,X3),true,ifeq2(equalish(X2,X2),true,ifeq2(equalish(X1,X1),true,f(X1,X2,X3,X4,sK1_exists_f_Z(X1,X2,X3,X4)),true),true),true),true) = true ).

cnf(inject_f_3,axiom,
    ifeq2(f(Y1,Y2,Y3,Y4,Z),true,ifeq2(f(X1,X2,X3,X4,Z),true,equalish(X4,Y4),true),true) = true ).

cnf(inject_f_2,axiom,
    ifeq2(f(Y1,Y2,Y3,Y4,Z),true,ifeq2(f(X1,X2,X3,X4,Z),true,equalish(X3,Y3),true),true) = true ).

cnf(inject_f_1,axiom,
    ifeq2(f(Y1,Y2,Y3,Y4,Z),true,ifeq2(f(X1,X2,X3,X4,Z),true,equalish(X2,Y2),true),true) = true ).

cnf(inject_f,axiom,
    ifeq2(f(Y1,Y2,Y3,Y4,Z),true,ifeq2(f(X1,X2,X3,X4,Z),true,equalish(X1,Y1),true),true) = true ).

cnf(n0_fnot_n1_1,axiom,
    ifeq(equalish(n0,n1),true,a,b) = b ).

cnf(n0_fnot_n1,axiom,
    ifeq(equalish(n1,n0),true,a,b) = b ).

cnf(goal,negated_conjecture,
    a != b ).

%------------------------------------------------------------------------------
