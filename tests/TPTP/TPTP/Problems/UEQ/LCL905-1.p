%------------------------------------------------------------------------------
% File     : LCL905-1 : TPTP v9.0.0. Bugfixed v9.0.0.
% Domain   : Logical Calculi
% Problem  : Alternative Wajsberg algebra
% Version  : [Bon91] (equality) axioms.
% English  :

% Refs     : [FRT84] Font et al. (1984), Wajsberg Algebras
%          : [AB90]  Anantharaman & Bonacina (1990), An Application of the
%          : [Bon91] Bonacina (1991), Problems in Lukasiewicz Logic
% Source   : [TPTP]
% Names    :

% Status   : Satisfiable
% Rating   : 0.29 v9.0.0
% Syntax   : Number of clauses     :   14 (  14 unt;   0 nHn;   1 RR)
%            Number of literals    :   14 (  14 equ;   0 neg)
%            Maximal clause size   :    1 (   1 avg)
%            Maximal term depth    :    5 (   2 avg)
%            Number of predicates  :    1 (   0 usr;   0 prp; 2-2 aty)
%            Number of functors    :    7 (   7 usr;   2 con; 0-2 aty)
%            Number of variables   :   21 (   1 sgn)
% SPC      : CNF_SAT_RFO_PEQ_UEQ

% Comments : 
% Bugfixes : v9.0.0 - Corrected include of Alternative Wajsberg algebra defns
%------------------------------------------------------------------------------
%----Alternative Wajsberg algebra axioms
include('Axioms/LCL002-0.ax').
%----Alternative Wajsberg algebra definitions
include('Axioms/LCL002-1.ax').
%------------------------------------------------------------------------------
