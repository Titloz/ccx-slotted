%--------------------------------------------------------------------------
% File     : LCL165-1 : TPTP v9.0.0. Released v1.0.0.
% Domain   : Logic Calculi (Wajsberg Algebra)
% Problem  : A theorem in Wajsberg algebras
% Version  : [Bon91] (equality) axioms.
% English  :

% Refs     : [FRT84] Font et al. (1984), Wajsberg Algebras
%          : [AB90]  Anantharaman & Bonacina (1990), An Application of the
%          : [Bon91] Bonacina (1991), Problems in Lukasiewicz Logic
% Source   : [Bon91]
% Names    : Third problem [Bon91]

% Status   : Satisfiable
% Rating   : 0.57 v9.0.0, 0.33 v8.2.0, 0.20 v8.1.0, 0.50 v7.5.0, 0.25 v7.1.0, 0.33 v7.0.0, 0.00 v6.4.0, 0.25 v6.3.0, 0.00 v6.2.0, 0.33 v6.1.0, 0.60 v6.0.0, 0.40 v5.5.0, 0.60 v5.4.0, 0.75 v5.3.0, 0.67 v5.2.0, 0.33 v3.2.0, 0.67 v3.1.0, 0.33 v2.5.0, 0.67 v2.4.0, 1.00 v2.0.0
% Syntax   : Number of clauses     :   11 (  11 unt;   0 nHn;   1 RR)
%            Number of literals    :   11 (  11 equ;   1 neg)
%            Maximal clause size   :    1 (   1 avg)
%            Maximal term depth    :    5 (   2 avg)
%            Number of predicates  :    1 (   0 usr;   0 prp; 2-2 aty)
%            Number of functors    :    6 (   6 usr;   2 con; 0-2 aty)
%            Number of variables   :   22 (   0 sgn)
% SPC      : CNF_SAT_RFO_PEQ_UEQ

% Comments :
%--------------------------------------------------------------------------
%----Include Wajsberg algebra axioms
include('Axioms/LCL001-0.ax').
%----Include Wajsberg algebra and and or definitions
include('Axioms/LCL001-2.ax').
%--------------------------------------------------------------------------
cnf(prove_wajsberg_theorem,negated_conjecture,
    fnot(or(and(x,or(x,x)),and(x,x))) != and(fnot(x),or(or(fnot(x),fnot(x)),and(fnot(x),fnot(x)))) ).

%--------------------------------------------------------------------------
