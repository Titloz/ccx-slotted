%------------------------------------------------------------------------------
% File     : GRP760-10 : TPTP v9.0.0. Released v7.5.0.
% Domain   : Puzzles
% Problem  : A group that must be infinite
% Version  : Especial.
% English  :

% Refs     : [CS18]  Claessen & Smallbone (2018), Efficient Encodings of Fi
%          : [Sma18] Smallbone (2018), Email to Geoff Sutcliffe
% Source   : [Sma18]
% Names    :

% Status   : Satisfiable
% Rating   : 1.00 v7.5.0
% Syntax   : Number of clauses     :    6 (   6 unt;   0 nHn;   2 RR)
%            Number of literals    :    6 (   6 equ;   1 neg)
%            Maximal clause size   :    1 (   1 avg)
%            Maximal term depth    :    3 (   1 avg)
%            Number of predicates  :    1 (   0 usr;   0 prp; 2-2 aty)
%            Number of functors    :    5 (   5 usr;   2 con; 0-2 aty)
%            Number of variables   :    6 (   0 sgn)
% SPC      : CNF_SAT_RFO_PEQ_UEQ

% Comments : Converted from GRP760+1 to UEQ using [CS18].
%------------------------------------------------------------------------------
cnf(f01,axiom,
    mult(A,i(A)) = e ).

cnf(f02,axiom,
    mult(A,e) = A ).

cnf(f03,axiom,
    mult(A,mult(B,C)) = mult(mult(A,B),C) ).

cnf(f04_1,axiom,
    a != e ).

cnf(f04,axiom,
    mult(a,a) = e ).

cnf(f05,axiom,
    mult(sK1_f05_B(A),sK1_f05_B(A)) = A ).

%------------------------------------------------------------------------------
