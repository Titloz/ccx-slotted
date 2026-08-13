%------------------------------------------------------------------------------
% File     : SYO641-10 : TPTP v9.0.0. Released v7.5.0.
% Domain   : Puzzles
% Problem  : Notref3
% Version  : Especial.
% English  :

% Refs     : [CS18]  Claessen & Smallbone (2018), Efficient Encodings of Fi
%          : [Sma18] Smallbone (2018), Email to Geoff Sutcliffe
% Source   : [Sma18]
% Names    :

% Status   : Satisfiable
% Rating   : 0.00 v7.5.0
% Syntax   : Number of clauses     :    4 (   4 unt;   0 nHn;   1 RR)
%            Number of literals    :    4 (   4 equ;   1 neg)
%            Maximal clause size   :    1 (   1 avg)
%            Maximal term depth    :    4 (   1 avg)
%            Number of predicates  :    1 (   0 usr;   0 prp; 2-2 aty)
%            Number of functors    :    7 (   7 usr;   3 con; 0-4 aty)
%            Number of variables   :   13 (   7 sgn)
% SPC      : CNF_SAT_RFO_PEQ_UEQ

% Comments : Converted from SYO641+1 to UEQ using [CS18].
%------------------------------------------------------------------------------
cnf(ifeq_axiom,axiom,
    ifeq(A,A,B,C) = B ).

cnf(fnotref3_2,axiom,
    tuple(f(X2,X5,X10),f(X4,X2,X8),f(X5,X6,X9)) != tuple(true,true,true) ).

cnf(fnotref3_1,axiom,
    ifeq(f(X1,X3,sK1_fnotref3_Y1(X1)),true,f(X3,sK1_fnotref3_Y1(X1),sK1_fnotref3_Y1(X1)),true) = true ).

cnf(fnotref3,axiom,
    f(sK3_fnotref3_Y2,sK2_fnotref3_Y3,X7) = true ).

%------------------------------------------------------------------------------
