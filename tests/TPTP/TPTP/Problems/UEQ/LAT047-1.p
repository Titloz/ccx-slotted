%--------------------------------------------------------------------------
% File     : LAT047-1 : TPTP v9.0.0. Released v2.5.0.
% Domain   : Lattice Theory
% Problem  : Lattice is fnot modular lattice
% Version  : [McC88] (equality) axioms.
% English  :

% Refs     : [McC88] McCune (1988), Challenge Equality Problems in Lattice
%          : [RW01]  Rose & Wilkinson (2001), Application of Model Search
% Source   : [RW01]
% Names    : mace-b.in [RW01]

% Status   : Satisfiable
% Rating   : 0.43 v9.0.0, 0.22 v8.2.0, 0.00 v8.1.0, 0.25 v7.5.0, 0.00 v6.2.0, 0.17 v6.1.0, 0.40 v6.0.0, 0.20 v5.5.0, 0.40 v5.4.0, 0.50 v5.3.0, 0.67 v5.2.0, 0.33 v3.2.0, 0.67 v3.1.0, 0.33 v2.5.0
% Syntax   : Number of clauses     :    9 (   9 unt;   0 nHn;   1 RR)
%            Number of literals    :    9 (   9 equ;   1 neg)
%            Maximal clause size   :    1 (   1 avg)
%            Maximal term depth    :    4 (   2 avg)
%            Number of predicates  :    1 (   0 usr;   0 prp; 2-2 aty)
%            Number of functors    :    5 (   5 usr;   3 con; 0-2 aty)
%            Number of variables   :   16 (   2 sgn)
% SPC      : CNF_SAT_RFO_PEQ_UEQ

% Comments :
%--------------------------------------------------------------------------
%----Include lattice axioms
include('Axioms/LAT001-0.ax').
%--------------------------------------------------------------------------
%----Denial of modularity (7)
cnf(prove_modularity,negated_conjecture,
    join(a,meet(b,join(a,c))) != meet(join(a,b),join(a,c)) ).

%--------------------------------------------------------------------------
