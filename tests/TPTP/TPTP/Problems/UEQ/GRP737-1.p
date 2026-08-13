%------------------------------------------------------------------------------
% File     : GRP737-1 : TPTP v9.0.0. Released v4.0.0.
% Domain   : Group Theory (Quasigroups)
% Problem  : Nonmedial left distributive left 2-symmetric quasigroup
% Version  : Especial.
% English  :

% Refs     : [Sta08] Stanovsky (2008), Email to G. Sutcliffe
% Source   : [Sta08]
% Names    :

% Status   : Satisfiable
% Rating   : 0.86 v9.0.0, 0.89 v8.2.0, 0.80 v8.1.0, 0.75 v7.5.0, 0.50 v7.1.0, 0.33 v6.4.0, 0.75 v6.3.0, 0.67 v6.2.0, 0.83 v6.1.0, 0.80 v5.5.0, 1.00 v5.2.0, 0.67 v4.0.1, 1.00 v4.0.0
% Syntax   : Number of clauses     :    5 (   5 unt;   0 nHn;   1 RR)
%            Number of literals    :    5 (   5 equ;   1 neg)
%            Maximal clause size   :    1 (   1 avg)
%            Maximal term depth    :    3 (   2 avg)
%            Number of predicates  :    1 (   0 usr;   0 prp; 2-2 aty)
%            Number of functors    :    6 (   6 usr;   4 con; 0-2 aty)
%            Number of variables   :    9 (   0 sgn)
% SPC      : CNF_SAT_RFO_PEQ_UEQ

% Comments : Size 15
%------------------------------------------------------------------------------
cnf(c01,axiom,
    mult(A,mult(B,C)) = mult(mult(A,B),mult(A,C)) ).

cnf(c02,axiom,
    rd(mult(A,B),B) = A ).

cnf(c03,axiom,
    mult(rd(A,B),B) = A ).

cnf(c04,axiom,
    mult(A,mult(A,B)) = B ).

cnf(goals,negated_conjecture,
    mult(mult(a,b),mult(c,d)) != mult(mult(a,c),mult(b,d)) ).

%------------------------------------------------------------------------------
