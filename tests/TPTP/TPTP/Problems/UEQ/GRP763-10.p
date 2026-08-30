%------------------------------------------------------------------------------
% File     : GRP763-10 : TPTP v9.0.0. Released v7.3.0.
% Domain   : Puzzles
% Problem  : Lattice ordered group
% Version  : Especial.
% English  :

% Refs     : [CS18]  Claessen & Smallbone (2018), Efficient Encodings of Fi
%          : [Sma18] Smallbone (2018), Email to Geoff Sutcliffe
% Source   : [Sma18]
% Names    :

% Status   : Satisfiable
% Rating   : 1.00 v7.3.0
% Syntax   : Number of clauses     :   14 (  14 unt;   0 nHn;   1 RR)
%            Number of literals    :   14 (  14 equ;   1 neg)
%            Maximal clause size   :    1 (   1 avg)
%            Maximal term depth    :    3 (   1 avg)
%            Number of predicates  :    1 (   0 usr;   0 prp; 2-2 aty)
%            Number of functors    :    6 (   6 usr;   2 con; 0-2 aty)
%            Number of variables   :   27 (   2 sgn)
% SPC      : CNF_SAT_RFO_PEQ_UEQ

% Comments : Converted from GRP763+1 to UEQ using [CS18].
%------------------------------------------------------------------------------
cnf(f01,axiom,
    mult(A,i(A)) = e ).

cnf(f02,axiom,
    mult(A,e) = A ).

cnf(f03,axiom,
    mult(A,mult(B,C)) = mult(mult(A,B),C) ).

cnf(f04,axiom,
    m(A,A) = A ).

cnf(f05,axiom,
    m(A,B) = m(B,A) ).

cnf(f06,axiom,
    m(A,m(B,C)) = m(m(A,B),C) ).

cnf(f07,axiom,
    j(A,A) = A ).

cnf(f08,axiom,
    j(A,B) = j(B,A) ).

cnf(f09,axiom,
    j(A,j(B,C)) = j(j(A,B),C) ).

cnf(f10,axiom,
    m(A,j(A,B)) = A ).

cnf(f11,axiom,
    j(A,m(A,B)) = A ).

cnf(f12,axiom,
    mult(A,j(B,C)) = j(mult(A,B),mult(A,C)) ).

cnf(f13,axiom,
    mult(j(B,C),A) = j(mult(B,A),mult(C,A)) ).

cnf(f14,axiom,
    a != e ).

%------------------------------------------------------------------------------
