%--------------------------------------------------------------------------
% File     : BOO019-1 : TPTP v9.0.0. Released v1.2.0.
% Domain   : Boolean Algebra (Ternary)
% Problem  : Prove the independance of Ternary Boolean algebra axiom
% Version  : Especial.
% English  :

% Refs     : [Win82] Winker (1982), Generation and Verification of Finite M
%          : [BCP94] Bourely et al. (1994), A Method for Building Models Au
%          : [Pel98] Peltier (1998), A New Method for Automated Finite Mode
% Source   : [BCP94]
% Names    : A1 [Win82]
%          : Example 4 [BCP94]
%          : 4.2.1 [Pel98]

% Status   : Satisfiable
% Rating   : 0.43 v9.0.0, 0.22 v8.2.0, 0.00 v8.1.0, 0.25 v7.5.0, 0.00 v6.2.0, 0.17 v6.1.0, 0.40 v6.0.0, 0.20 v5.5.0, 0.40 v5.4.0, 0.50 v5.3.0, 0.67 v5.2.0, 0.33 v3.2.0, 0.67 v3.1.0, 0.33 v2.4.0, 0.67 v2.2.1, 0.75 v2.2.0, 0.67 v2.1.0, 1.00 v2.0.0
% Syntax   : Number of clauses     :    5 (   5 unt;   0 nHn;   1 RR)
%            Number of literals    :    5 (   5 equ;   1 neg)
%            Maximal clause size   :    1 (   1 avg)
%            Maximal term depth    :    3 (   1 avg)
%            Number of predicates  :    1 (   0 usr;   0 prp; 2-2 aty)
%            Number of functors    :    4 (   4 usr;   2 con; 0-3 aty)
%            Number of variables   :   11 (   1 sgn)
% SPC      : CNF_SAT_RFO_PEQ_UEQ

% Comments : Thought to be satisfiable.
%--------------------------------------------------------------------------
cnf(associativity,axiom,
    multiply(multiply(V,W,X),Y,multiply(V,W,Z)) = multiply(V,W,multiply(X,Y,Z)) ).

cnf(ternary_multiply_2,axiom,
    multiply(X,X,Y) = X ).

cnf(left_inverse,axiom,
    multiply(inverse(Y),Y,X) = X ).

cnf(right_inverse,axiom,
    multiply(X,Y,inverse(Y)) = X ).

cnf(prove_ternary_multiply_1_independant,negated_conjecture,
    multiply(y,x,x) != x ).

%--------------------------------------------------------------------------
