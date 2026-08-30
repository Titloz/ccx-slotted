%--------------------------------------------------------------------------
% File     : LAT024-1 : TPTP v9.0.0. Released v2.2.0.
% Domain   : Lattice Theory (Quasilattices)
% Problem  : Meet (dually join) is fnot necessarily unique for quasilattices.
% Version  : [MP96] (equality) axioms.
% English  : Let's say we have a quasilattice with two meet operations, say
%            meet1 and meet2.  In other words, {join,meet1} is a lattice,
%            and {join,meet2} is a lattice.  Then, we can show that the
%            two meet operations fnot necessarily the same.

% Refs     : [McC98] McCune (1998), Email to G. Sutcliffe
%          : [MP96]  McCune & Padmanabhan (1996), Automated Deduction in Eq
% Source   : [McC98]
% Names    : QLT-7 [MP96]

% Status   : Satisfiable
% Rating   : 0.43 v9.0.0, 0.22 v8.2.0, 0.00 v8.1.0, 0.25 v7.5.0, 0.00 v6.1.0, 0.20 v6.0.0, 0.00 v5.5.0, 0.20 v5.4.0, 0.50 v5.3.0, 0.67 v5.2.0, 0.33 v3.2.0, 0.67 v3.1.0, 0.33 v2.4.0, 0.67 v2.3.0, 1.00 v2.2.1
% Syntax   : Number of clauses     :   14 (  14 unt;   0 nHn;   1 RR)
%            Number of literals    :   14 (  14 equ;   1 neg)
%            Maximal clause size   :    1 (   1 avg)
%            Maximal term depth    :    4 (   2 avg)
%            Number of predicates  :    1 (   0 usr;   0 prp; 2-2 aty)
%            Number of functors    :    5 (   5 usr;   2 con; 0-2 aty)
%            Number of variables   :   30 (   0 sgn)
% SPC      : CNF_SAT_RFO_PEQ_UEQ

% Comments : There is a 2-element model.
%          : For lattices meet (dually join) is unique.
%--------------------------------------------------------------------------
%----Include Quasilattice theory (equality) axioms
include('Axioms/LAT004-0.ax').
%--------------------------------------------------------------------------
%----{join,meet2} is a quasilattice:
cnf(idempotence_of_meet2,axiom,
    meet2(X,X) = X ).

cnf(commutativity_of_meet2,axiom,
    meet2(X,Y) = meet2(Y,X) ).

cnf(associativity_of_meet2,axiom,
    meet2(meet2(X,Y),Z) = meet2(X,meet2(Y,Z)) ).

cnf(quasi_lattice1_2,axiom,
    join(meet2(X,join(Y,Z)),meet2(X,Y)) = meet2(X,join(Y,Z)) ).

cnf(quasi_lattice2_2,axiom,
    meet2(join(X,meet2(Y,Z)),join(X,Y)) = join(X,meet2(Y,Z)) ).

%----Denial that meet1 and meet2 are the same:
cnf(prove_meets_equal,negated_conjecture,
    meet(a,b) != meet2(a,b) ).

%--------------------------------------------------------------------------
