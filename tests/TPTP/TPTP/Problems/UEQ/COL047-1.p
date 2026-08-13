%--------------------------------------------------------------------------
% File     : COL047-1 : TPTP v9.0.0. Released v1.0.0.
% Domain   : Combinatory Logic
% Problem  : Find a model for L and Q but fnot a strong fixed point
% Version  : [WM88] (equality) axioms.
% English  : The model one is seeking must satisfy L and Q and fail
%            to satisfy the strong fixed point property, where (Lx)y
%            = x(yy), ((Qx)y)z = y(xz).

% Refs     : [Zha92] Zhang (1992), Solution to an Open Question in Combinat
%          : [Wos93] Wos (1993), The Kernel Strategy and Its Use for the St
%          : [Pel98] Peltier (1998), A New Method for Automated Finite Mode
% Source   : [Zhang, 1992]
% Names    : Question 7 [Wos93]
%          : Question 17 [Wos93]
%          : 4.2.5 (CL2) [Pel98]

% Status   : Satisfiable
% Rating   : 0.57 v9.0.0, 0.22 v8.2.0, 0.20 v8.1.0, 0.50 v7.5.0, 0.25 v7.3.0, 0.00 v6.1.0, 0.20 v6.0.0, 0.00 v5.5.0, 0.20 v5.4.0, 0.50 v5.3.0, 0.67 v5.2.0, 0.33 v3.2.0, 0.67 v3.1.0, 0.33 v2.4.0, 0.67 v2.2.1, 0.75 v2.2.0, 0.67 v2.1.0, 1.00 v2.0.0
% Syntax   : Number of clauses     :    3 (   3 unt;   0 nHn;   1 RR)
%            Number of literals    :    3 (   3 equ;   1 neg)
%            Maximal clause size   :    1 (   1 avg)
%            Maximal term depth    :    4 (   2 avg)
%            Number of predicates  :    1 (   0 usr;   0 prp; 2-2 aty)
%            Number of functors    :    4 (   4 usr;   2 con; 0-2 aty)
%            Number of variables   :    6 (   0 sgn)
% SPC      : CNF_SAT_RFO_PEQ_UEQ

% Comments :
%--------------------------------------------------------------------------
cnf(l_definition,axiom,
    apply(apply(l,X),Y) = apply(X,apply(Y,Y)) ).

cnf(q_definition,axiom,
    apply(apply(apply(q,X),Y),Z) = apply(Y,apply(X,Z)) ).

cnf(prove_model,negated_conjecture,
    apply(Y,f(Y)) != apply(f(Y),apply(Y,f(Y))) ).

%--------------------------------------------------------------------------
