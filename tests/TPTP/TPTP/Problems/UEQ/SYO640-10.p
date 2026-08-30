%------------------------------------------------------------------------------
% File     : SYO640-10 : TPTP v9.0.0. Released v7.3.0.
% Domain   : Puzzles
% Problem  : Itmul0
% Version  : Especial.
% English  :

% Refs     : [CS18]  Claessen & Smallbone (2018), Efficient Encodings of Fi
%          : [Sma18] Smallbone (2018), Email to Geoff Sutcliffe
% Source   : [Sma18]
% Names    :

% Status   : Satisfiable
% Rating   : 0.14 v9.0.0, 0.11 v8.2.0, 0.00 v7.3.0
% Syntax   : Number of clauses     :    6 (   6 unt;   0 nHn;   3 RR)
%            Number of literals    :    6 (   6 equ;   1 neg)
%            Maximal clause size   :    1 (   1 avg)
%            Maximal term depth    :    4 (   1 avg)
%            Number of predicates  :    1 (   0 usr;   0 prp; 2-2 aty)
%            Number of functors    :    7 (   7 usr;   5 con; 0-4 aty)
%            Number of variables   :    8 (   1 sgn)
% SPC      : CNF_SAT_RFO_PEQ_UEQ

% Comments : Converted from SYO640+1 to UEQ using [CS18].
%------------------------------------------------------------------------------
cnf(ifeq_axiom,axiom,
    ifeq(A,A,B,C) = B ).

cnf(itmul0_4,axiom,
    f(sK3_itmul0_Y1,sK1_itmul0_Y3,sK4_itmul0_Y4) != true ).

cnf(itmul0_3,axiom,
    ifeq(f(sK3_itmul0_Y1,sK1_itmul0_Y3,X1),true,f(sK3_itmul0_Y1,sK3_itmul0_Y1,X1),true) = true ).

cnf(itmul0_2,axiom,
    ifeq(f(X2,X3,X4),true,ifeq(f(X1,X2,X4),true,f(X1,X3,X4),true),true) = true ).

cnf(itmul0_1,axiom,
    f(sK2_itmul0_Y2,sK3_itmul0_Y1,sK4_itmul0_Y4) = true ).

cnf(itmul0,axiom,
    f(sK3_itmul0_Y1,sK2_itmul0_Y2,sK4_itmul0_Y4) = true ).

%------------------------------------------------------------------------------
