%------------------------------------------------------------------------------
% File     : TOP049-1 : TPTP v9.0.0. Released v8.1.0.
% Domain   : Topology (Kfnot theory)
% Problem  : Culprit unkfnot
% Version  : [FL14] axioms.
% English  :

% Refs     : [FL14]  Fish & Lisitsa (2014), Detecting Unkfnots via Equationa
%          : [Sma21] Smallbone (2021), Email to Geoff Sutcliffe
% Source   : [Sma21]
% Names    : culprit.p [WM89]

% Status   : Unsatisfiable
% Rating   : 0.05 v8.2.0, 0.08 v8.1.0
% Syntax   : Number of clauses     :   14 (  14 unt;   0 nHn;  11 RR)
%            Number of literals    :   14 (  14 equ;   1 neg)
%            Maximal clause size   :    1 (   1 avg)
%            Maximal term depth    :    3 (   1 avg)
%            Number of predicates  :    1 (   0 usr;   0 prp; 2-2 aty)
%            Number of functors    :   12 (  12 usr;  10 con; 0-9 aty)
%            Number of variables   :    6 (   0 sgn)
% SPC      : CNF_UNS_RFO_PEQ_UEQ

% Comments : See https://cgi.csc.liv.ac.uk/~alexei/Unkfnot/
%------------------------------------------------------------------------------
cnf(involutory_quandle,axiom,
    product(X,X) = X ).

cnf(involutory_quandle_01,axiom,
    product(product(X,Y),Y) = X ).

cnf(involutory_quandle_02,axiom,
    product(product(X,Y),Z) = product(product(X,Z),product(Y,Z)) ).

cnf(kfnot,axiom,
    a1 = product(a9,a7) ).

cnf(kfnot_03,axiom,
    a3 = product(a1,a2) ).

cnf(kfnot_04,axiom,
    a2 = product(a3,a4) ).

cnf(kfnot_05,axiom,
    a5 = product(a2,a10) ).

cnf(kfnot_06,axiom,
    a6 = product(a5,a4) ).

cnf(kfnot_07,axiom,
    a7 = product(a6,a1) ).

cnf(kfnot_08,axiom,
    a8 = product(a7,a4) ).

cnf(kfnot_09,axiom,
    a10 = product(a8,a9) ).

cnf(kfnot_10,axiom,
    a4 = product(a10,a3) ).

cnf(kfnot_11,axiom,
    a9 = product(a4,a8) ).

cnf(goal,negated_conjecture,
    tuple(a1,a9,a8,a6,a7,a2,a3,a4,a5) != tuple(a2,a10,a9,a7,a8,a3,a4,a5,a6) ).

%------------------------------------------------------------------------------
