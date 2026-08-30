%------------------------------------------------------------------------------
% File     : BOO056-10 : TPTP v9.0.0. Released v7.3.0.
% Domain   : Puzzles
% Problem  : Single non-axiom M5A for Boolean algebra in the Sheffer stroke
% Version  : Especial.
% English  :

% Refs     : [CS18]  Claessen & Smallbone (2018), Efficient Encodings of Fi
%          : [Sma18] Smallbone (2018), Email to Geoff Sutcliffe
% Source   : [Sma18]
% Names    :

% Status   : Satisfiable
% Rating   : 0.71 v9.0.0, 0.56 v8.2.0, 0.40 v8.1.0, 0.50 v7.3.0
% Syntax   : Number of clauses     :    2 (   2 unt;   0 nHn;   1 RR)
%            Number of literals    :    2 (   2 equ;   1 neg)
%            Maximal clause size   :    1 (   1 avg)
%            Maximal term depth    :    5 (   2 avg)
%            Number of predicates  :    1 (   0 usr;   0 prp; 2-2 aty)
%            Number of functors    :    5 (   5 usr;   3 con; 0-2 aty)
%            Number of variables   :    3 (   0 sgn)
% SPC      : CNF_SAT_RFO_PEQ_UEQ

% Comments : Converted from BOO056-1 to UEQ using [CS18].
%------------------------------------------------------------------------------
cnf(m5A,axiom,
    nand(nand(A,nand(nand(B,C),A)),nand(B,nand(C,A))) = B ).

cnf(prove_meredith_2_basis,negated_conjecture,
    tuple(nand(a,nand(b,nand(a,c))),nand(nand(a,a),nand(b,a))) != tuple(nand(nand(nand(c,b),b),a),a) ).

%------------------------------------------------------------------------------
