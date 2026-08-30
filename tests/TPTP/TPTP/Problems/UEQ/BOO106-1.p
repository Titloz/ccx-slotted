%--------------------------------------------------------------------------
% File     : BOO106-1 : TPTP v9.0.0. Released v2.6.0.
% Domain   : Boolean Algebra
% Problem  : Axiom C15 for Boolean algebra in the Sheffer stroke, part 2
% Version  : [EF+02] axioms.
% English  :

% Refs     : [EF+02] Ernst et al. (2002), More First-order Test Problems in
%          : [MV+02] McCune et al. (2002), Short Single Axioms for Boolean
% Source   : [TPTP]
% Names    :

% Status   : Satisfiable
% Rating   : 1.00 v6.3.0, 0.67 v6.2.0, 0.83 v6.1.0, 1.00 v2.6.0
% Syntax   : Number of clauses     :    2 (   2 unt;   0 nHn;   1 RR)
%            Number of literals    :    2 (   2 equ;   1 neg)
%            Maximal clause size   :    1 (   1 avg)
%            Maximal term depth    :    5 (   2 avg)
%            Number of predicates  :    1 (   0 usr;   0 prp; 2-2 aty)
%            Number of functors    :    4 (   4 usr;   3 con; 0-2 aty)
%            Number of variables   :    3 (   0 sgn)
% SPC      : CNF_SAT_RFO_PEQ_UEQ

% Comments : A UEQ part of BOO054-1
%--------------------------------------------------------------------------
cnf(c15,axiom,
    nand(nand(nand(nand(A,B),C),C),nand(B,nand(A,C))) = B ).

cnf(prove_meredith_2_basis_2,negated_conjecture,
    nand(a,nand(b,nand(a,c))) != nand(nand(nand(c,b),b),a) ).

%--------------------------------------------------------------------------
