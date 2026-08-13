%--------------------------------------------------------------------------
% File     : LAT063-1 : TPTP v9.0.0. Released v2.5.0.
% Domain   : Lattice Theory
% Problem  : E62 does fnot necessarily hold in ortholattices
% Version  : [EF+02] axioms.
% English  :

% Refs     : [EF+02] Ernst et al. (2002), More First-order Test Problems in
% Source   : [EF+02]
% Names    : ol-e62 [EF+02]

% Status   : Satisfiable
% Rating   : 0.43 v9.0.0, 0.56 v8.2.0, 0.40 v8.1.0, 0.25 v7.5.0, 0.00 v6.2.0, 0.67 v6.1.0, 0.60 v6.0.0, 0.40 v5.5.0, 0.60 v5.4.0, 0.75 v5.3.0, 0.67 v5.2.0, 0.33 v3.2.0, 0.67 v3.1.0, 0.33 v2.6.0, 0.67 v2.5.0
% Syntax   : Number of clauses     :   12 (  12 unt;   0 nHn;   1 RR)
%            Number of literals    :   12 (  12 equ;   1 neg)
%            Maximal clause size   :    1 (   1 avg)
%            Maximal term depth    :    6 (   2 avg)
%            Number of predicates  :    1 (   0 usr;   0 prp; 2-2 aty)
%            Number of functors    :    7 (   7 usr;   4 con; 0-2 aty)
%            Number of variables   :   20 (   2 sgn)
% SPC      : CNF_SAT_RFO_PEQ_UEQ

% Comments :
%--------------------------------------------------------------------------
%----Include lattice axioms
include('Axioms/LAT001-0.ax').
%--------------------------------------------------------------------------
%----Ortholattice axioms
cnf(top,axiom,
    join(complement(A),A) = n1 ).

cnf(bottom,axiom,
    meet(complement(A),A) = n0 ).

cnf(compatibility,axiom,
    meet(A,B) = complement(join(complement(A),complement(B))) ).

%----Denial of E62
cnf(prove_e62,negated_conjecture,
    meet(a,join(b,meet(a,join(complement(a),meet(a,b))))) != meet(a,join(complement(a),meet(a,b))) ).

%--------------------------------------------------------------------------
