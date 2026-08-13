%------------------------------------------------------------------------------
% File     : GRP735-1 : TPTP v9.0.0. Released v4.0.0.
% Domain   : Group Theory (Quasigroups)
% Problem  : Nonmedial left distributive quasigroup
% Version  : Especial.
% English  :

% Refs     : [Sta08] Stanovsky (2008), Email to G. Sutcliffe
% Source   : [Sta08]
% Names    :

% Status   : Satisfiable
% Rating   : 1.00 v7.5.0, 0.75 v7.1.0, 0.67 v6.4.0, 0.75 v6.3.0, 0.67 v6.2.0, 0.83 v6.1.0, 1.00 v4.0.0
% Syntax   : Number of clauses     :    6 (   6 unt;   0 nHn;   1 RR)
%            Number of literals    :    6 (   6 equ;   1 neg)
%            Maximal clause size   :    1 (   1 avg)
%            Maximal term depth    :    3 (   2 avg)
%            Number of predicates  :    1 (   0 usr;   0 prp; 2-2 aty)
%            Number of functors    :    7 (   7 usr;   4 con; 0-2 aty)
%            Number of variables   :   11 (   0 sgn)
% SPC      : CNF_SAT_RFO_PEQ_UEQ

% Comments : Size 15
%------------------------------------------------------------------------------
cnf(c01,axiom,
    mult(A,mult(B,C)) = mult(mult(A,B),mult(A,C)) ).

cnf(c02,axiom,
    mult(A,ld(A,B)) = B ).

cnf(c03,axiom,
    ld(A,mult(A,B)) = B ).

cnf(c04,axiom,
    rd(mult(A,B),B) = A ).

cnf(c05,axiom,
    mult(rd(A,B),B) = A ).

cnf(goals,negated_conjecture,
    mult(mult(a,b),mult(c,d)) != mult(mult(a,c),mult(b,d)) ).

%------------------------------------------------------------------------------
