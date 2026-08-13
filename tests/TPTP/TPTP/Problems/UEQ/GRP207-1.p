%--------------------------------------------------------------------------
% File     : GRP207-1 : TPTP v9.0.0. Released v2.4.0.
% Domain   : Group Theory
% Problem  : Single non-axiom for group theory, in product & inverse
% Version  : [McC93] (equality) axioms.
% English  : This is a single axiom for group theory, in terms of product
%            and inverse.

% Refs     : [Pel98] Peltier (1998), A New Method for Automated Finite Mode
%          : [McC93] McCune (1993), Single Axioms for Groups and Abelian Gr
% Source   : [Pel98]
% Names    : 4.2.2 [Pel98]

% Status   : Satisfiable
% Rating   : 0.43 v9.0.0, 0.22 v8.2.0, 0.00 v8.1.0, 0.25 v7.5.0, 0.00 v6.1.0, 0.20 v6.0.0, 0.00 v5.5.0, 0.20 v5.4.0, 0.50 v5.3.0, 0.67 v5.2.0, 0.33 v3.2.0, 0.67 v3.1.0, 0.33 v2.4.0
% Syntax   : Number of clauses     :    2 (   2 unt;   0 nHn;   1 RR)
%            Number of literals    :    2 (   2 equ;   1 neg)
%            Maximal clause size   :    1 (   1 avg)
%            Maximal term depth    :    8 (   3 avg)
%            Number of predicates  :    1 (   0 usr;   0 prp; 2-2 aty)
%            Number of functors    :    6 (   6 usr;   4 con; 0-2 aty)
%            Number of variables   :    3 (   0 sgn)
% SPC      : CNF_SAT_RFO_PEQ_UEQ

% Comments :
%--------------------------------------------------------------------------
cnf(single_non_axiom,axiom,
    multiply(U,inverse(multiply(Y,multiply(multiply(multiply(Z,inverse(Z)),inverse(multiply(U,Y))),U)))) = U ).

cnf(try_prove_this_axiom,negated_conjecture,
    multiply(x,inverse(multiply(y,multiply(multiply(multiply(z,inverse(z)),inverse(multiply(u,y))),x)))) != u ).

%--------------------------------------------------------------------------
