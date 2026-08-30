%--------------------------------------------------------------------------
% File     : LCL409-1 : TPTP v9.0.0. Released v2.5.0.
% Domain   : Logic Calculi (Wajsberg Algebras)
% Problem  : Wajsberg algebra AND and OR definitions
% Version  : [AB90] (equality) axioms.
% English  :

% Refs     : [FRT84] Font et al. (1984), Wajsberg Algebras
%          : [AB90]  Anantharaman & Bonacina (1990), An Application of the
%          : [Bon91] Bonacina (1991), Problems in Lukasiewicz Logic
% Source   : [Bon91]
% Names    :

% Status   : Satisfiable
% Rating   : 0.43 v9.0.0, 0.11 v8.2.0, 0.00 v8.1.0, 0.25 v7.5.0, 0.00 v6.2.0, 0.17 v6.1.0, 0.40 v6.0.0, 0.20 v5.5.0, 0.40 v5.4.0, 0.50 v5.3.0, 0.33 v5.2.0, 0.00 v3.2.0, 0.33 v3.1.0, 0.00 v2.5.0
% Syntax   : Number of clauses     :   10 (  10 unt;   0 nHn;   0 RR)
%            Number of literals    :   10 (  10 equ;   0 neg)
%            Maximal clause size   :    1 (   1 avg)
%            Maximal term depth    :    4 (   2 avg)
%            Number of predicates  :    1 (   0 usr;   0 prp; 2-2 aty)
%            Number of functors    :    5 (   5 usr;   1 con; 0-2 aty)
%            Number of variables   :   22 (   0 sgn)
% SPC      : CNF_SAT_RFO_PEQ_UEQ

% Comments :
%--------------------------------------------------------------------------
%----Include Wajsberg algebra axioms
include('Axioms/LCL001-0.ax').
%----Include Wajsberg algebra AND and OR definitions
include('Axioms/LCL001-2.ax').
%--------------------------------------------------------------------------
