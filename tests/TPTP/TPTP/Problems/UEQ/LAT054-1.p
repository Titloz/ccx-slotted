%--------------------------------------------------------------------------
% File     : LAT054-1 : TPTP v9.0.0. Released v2.5.0.
% Domain   : Lattice Theory
% Problem  : Countermodel for Megill equation for ortholattices
% Version  : [McC88] (equality) axioms.
% English  :

% Refs     : [McC88] McCune (1988), Challenge Equality Problems in Lattice
%          : [Meg00] Megill & Pavicic (2000), Equations and State and Latti
%          : [RW01]  Rose & Wilkinson (2001), Application of Model Search
%          : [EF+02] Ernst et al. (2002), More First-order Test Problems in
% Source   : [RW01]
% Names    : sem-rw-2.in [RW01]
%          : ol-rw2 [EF+02]

% Status   : Satisfiable
% Rating   : 0.71 v9.0.0, 0.78 v8.2.0, 0.60 v8.1.0, 0.50 v7.5.0, 0.25 v7.4.0, 0.50 v7.3.0, 0.25 v7.1.0, 0.33 v7.0.0, 0.00 v6.4.0, 0.50 v6.3.0, 0.33 v6.2.0, 0.67 v6.1.0, 0.80 v5.5.0, 1.00 v5.2.0, 0.67 v5.0.0, 0.33 v3.2.0, 0.67 v3.1.0, 0.33 v2.6.0, 0.67 v2.5.0
% Syntax   : Number of clauses     :   14 (  14 unt;   0 nHn;   1 RR)
%            Number of literals    :   14 (  14 equ;   1 neg)
%            Maximal clause size   :    1 (   1 avg)
%            Maximal term depth    :   10 (   2 avg)
%            Number of predicates  :    1 (   0 usr;   0 prp; 2-2 aty)
%            Number of functors    :    7 (   7 usr;   4 con; 0-2 aty)
%            Number of variables   :   23 (   2 sgn)
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

%----Denial of equation in question
cnf(prove_this,negated_conjecture,
    join(a,meet(complement(b),join(complement(a),meet(complement(b),join(a,meet(complement(b),complement(a))))))) != join(a,meet(complement(b),join(complement(a),meet(complement(b),join(a,meet(complement(b),join(complement(a),meet(complement(b),a)))))))) ).

%--------------------------------------------------------------------------
