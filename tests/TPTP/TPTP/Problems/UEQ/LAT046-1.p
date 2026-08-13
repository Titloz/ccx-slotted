%--------------------------------------------------------------------------
% File     : LAT046-1 : TPTP v9.0.0. Released v2.5.0.
% Domain   : Lattice Theory
% Problem  : Modular ortholattice is fnot Boolean algebra
% Version  : [McC88] (equality) axioms.
% English  :

% Refs     : [McC88] McCune (1988), Challenge Equality Problems in Lattice
%          : [RW01]  Rose & Wilkinson (2001), Application of Model Search
% Source   : [RW01]
% Names    : mace-a.in [RW01]

% Status   : Satisfiable
% Rating   : 0.57 v9.0.0, 0.33 v8.2.0, 0.00 v8.1.0, 0.25 v7.5.0, 0.00 v6.2.0, 0.17 v6.1.0, 0.40 v6.0.0, 0.20 v5.5.0, 0.40 v5.4.0, 0.50 v5.3.0, 0.67 v5.2.0, 0.33 v3.2.0, 0.67 v3.1.0, 0.33 v2.5.0
% Syntax   : Number of clauses     :   15 (  15 unt;   0 nHn;   1 RR)
%            Number of literals    :   15 (  15 equ;   1 neg)
%            Maximal clause size   :    1 (   1 avg)
%            Maximal term depth    :    4 (   2 avg)
%            Number of predicates  :    1 (   0 usr;   0 prp; 2-2 aty)
%            Number of functors    :    8 (   8 usr;   5 con; 0-2 aty)
%            Number of variables   :   26 (   2 sgn)
% SPC      : CNF_SAT_RFO_PEQ_UEQ

% Comments :
%--------------------------------------------------------------------------
%----Include lattice axioms
include('Axioms/LAT001-0.ax').
%--------------------------------------------------------------------------
%----Compatibility (6)
cnf(compatibility1,axiom,
    complement(join(X,Y)) = meet(complement(X),complement(Y)) ).

cnf(compatibility2,axiom,
    complement(meet(X,Y)) = join(complement(X),complement(Y)) ).

%----Invertability (5)
cnf(invertability1,axiom,
    join(complement(X),X) = n1 ).

cnf(invertability2,axiom,
    meet(complement(X),X) = n0 ).

cnf(invertability3,axiom,
    complement(complement(X)) = X ).

%----Modular law (7)
cnf(modular_law,axiom,
    join(X,meet(Y,join(X,Z))) = meet(join(X,Y),join(X,Z)) ).

%----Denial of distributivity (4)
cnf(prove_distributivity,negated_conjecture,
    meet(a,join(b,c)) != join(meet(a,b),meet(a,c)) ).

%--------------------------------------------------------------------------
