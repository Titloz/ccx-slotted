%--------------------------------------------------------------------------
% File     : LCL137-1 : TPTP v9.0.0. Released v1.0.0.
% Domain   : Logic Calculi (Wajsberg Algebra)
% Problem  : A lemma in Wajsberg algebras
% Version  : [TPTP] axioms.
% English  : An axiomatisation of the many valued sentential calculus
%            is {MV-1,MV-2,MV-3,MV-5} by Meredith. Wajsberg provided
%            a different axiomatisation. Show that MV-3 depends on the
%            Wajsberg system.

% Refs     : [FRT84] Font et al. (1984), Wajsberg Algebras
%          : [MW92]  McCune & Wos (1992), Experiments in Automated Deductio
% Source   : [TPTP]
% Names    :

% Status   : Satisfiable
% Rating   : 0.43 v9.0.0, 0.22 v8.2.0, 0.00 v8.1.0, 0.25 v7.5.0, 0.00 v6.2.0, 0.17 v6.1.0, 0.40 v6.0.0, 0.20 v5.4.0, 0.25 v5.3.0, 0.33 v3.2.0, 0.67 v3.1.0, 0.33 v2.4.0, 0.67 v2.2.1, 0.75 v2.2.0, 0.67 v2.1.0, 1.00 v2.0.0
% Syntax   : Number of clauses     :    5 (   5 unt;   0 nHn;   1 RR)
%            Number of literals    :    5 (   5 equ;   1 neg)
%            Maximal clause size   :    1 (   1 avg)
%            Maximal term depth    :    4 (   2 avg)
%            Number of predicates  :    1 (   0 usr;   0 prp; 2-2 aty)
%            Number of functors    :    6 (   6 usr;   4 con; 0-2 aty)
%            Number of variables   :    8 (   0 sgn)
% SPC      : CNF_SAT_RFO_PEQ_UEQ

% Comments :
%--------------------------------------------------------------------------
%----Include Wajsberg algebra axioms
include('Axioms/LCL001-0.ax').
%--------------------------------------------------------------------------
cnf(prove_wajsberg_lemma,negated_conjecture,
    implies(implies(implies(x,y),y),implies(implies(y,z),implies(x,z))) != truth ).

%--------------------------------------------------------------------------
