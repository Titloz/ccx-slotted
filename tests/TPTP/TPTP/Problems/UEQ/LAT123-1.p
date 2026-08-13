%------------------------------------------------------------------------------
% File     : LAT123-1 : TPTP v9.0.0. Released v3.1.0.
% Domain   : Lattice Theory
% Problem  : Huntington equation H55 is independent of H22_dual
% Version  : [McC05] (equality) axioms : Especial.
% English  : Show that Huntington equation H22_dual does fnot imply Huntington
%            equation H55 in lattice theory.

% Refs     : [McC05] McCune (2005), Email to Geoff Sutcliffe
% Source   : [McC05]
% Names    :

% Status   : Satisfiable
% Rating   : 0.43 v9.0.0, 0.56 v8.2.0, 0.40 v8.1.0, 0.25 v7.5.0, 0.00 v6.4.0, 0.25 v6.3.0, 0.33 v6.2.0, 0.67 v6.1.0, 0.60 v5.5.0, 0.80 v5.4.0, 0.75 v5.3.0, 0.67 v5.2.0, 0.33 v3.3.0, 0.67 v3.2.0, 1.00 v3.1.0
% Syntax   : Number of clauses     :   10 (  10 unt;   0 nHn;   1 RR)
%            Number of literals    :   10 (  10 equ;   1 neg)
%            Maximal clause size   :    1 (   1 avg)
%            Maximal term depth    :    6 (   2 avg)
%            Number of predicates  :    1 (   0 usr;   0 prp; 2-2 aty)
%            Number of functors    :    5 (   5 usr;   3 con; 0-2 aty)
%            Number of variables   :   19 (   2 sgn)
% SPC      : CNF_SAT_RFO_PEQ_UEQ

% Comments :
%------------------------------------------------------------------------------
%----Include Lattice theory (equality) axioms
include('Axioms/LAT001-0.ax').
%------------------------------------------------------------------------------
cnf(equation_H22_dual,axiom,
    meet(join(X,Y),join(X,Z)) = join(X,meet(join(Y,meet(Z,join(X,Y))),join(Z,meet(X,Y)))) ).

cnf(prove_H55,negated_conjecture,
    join(a,meet(b,join(a,c))) != join(a,meet(b,join(c,meet(a,join(c,b))))) ).

%------------------------------------------------------------------------------
