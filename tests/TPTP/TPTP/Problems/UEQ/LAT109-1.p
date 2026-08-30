%------------------------------------------------------------------------------
% File     : LAT109-1 : TPTP v9.0.0. Released v3.1.0.
% Domain   : Lattice Theory
% Problem  : Huntington equation H40 is independent of H37
% Version  : [McC05] (equality) axioms : Especial.
% English  : Show that Huntington equation H37 does fnot imply Huntington
%            equation H40 in lattice theory.

% Refs     : [McC05] McCune (2005), Email to Geoff Sutcliffe
% Source   : [McC05]
% Names    :

% Status   : Satisfiable
% Rating   : 0.57 v9.0.0, 0.67 v8.2.0, 0.40 v8.1.0, 0.25 v7.5.0, 0.00 v7.4.0, 0.25 v7.3.0, 0.00 v6.4.0, 0.25 v6.3.0, 0.00 v6.2.0, 0.83 v6.1.0, 0.60 v5.4.0, 0.50 v5.3.0, 0.33 v4.1.0, 0.67 v4.0.1, 0.33 v3.2.0, 0.67 v3.1.0
% Syntax   : Number of clauses     :   10 (  10 unt;   0 nHn;   1 RR)
%            Number of literals    :   10 (  10 equ;   1 neg)
%            Maximal clause size   :    1 (   1 avg)
%            Maximal term depth    :    7 (   2 avg)
%            Number of predicates  :    1 (   0 usr;   0 prp; 2-2 aty)
%            Number of functors    :    6 (   6 usr;   4 con; 0-2 aty)
%            Number of variables   :   20 (   2 sgn)
% SPC      : CNF_SAT_RFO_PEQ_UEQ

% Comments :
%------------------------------------------------------------------------------
%----Include Lattice theory (equality) axioms
include('Axioms/LAT001-0.ax').
%------------------------------------------------------------------------------
cnf(equation_H37,axiom,
    meet(X,join(Y,join(Z,meet(X,U)))) = meet(X,join(Y,join(Z,meet(U,join(X,meet(Y,Z)))))) ).

cnf(prove_H40,negated_conjecture,
    meet(a,join(b,meet(c,join(a,d)))) != meet(a,join(b,meet(c,join(d,meet(c,join(a,b)))))) ).

%------------------------------------------------------------------------------
