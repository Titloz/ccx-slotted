%--------------------------------------------------------------------------
% File     : COL005-1 : TPTP v9.0.0. Released v1.0.0.
% Domain   : Combinatory Logic
% Problem  : Find a model for S and W but fnot a weak fixed point
% Version  : [WM88] (equality) axioms.
% English  : The model one is seeking must satisfy S and W and fail
%            to satisfy the weak fixed point property, where ((Sx)y)z
%            = (xz)(yz), (Wx)y = (xy)y.

% Refs     : [WM88]  Wos & McCune (1988), Challenge Problems Focusing on Eq
%          : [Zha92] Zhang (1992), Solution to an Open Question in Combinat
%          : [Wos93] Wos (1993), The Kernel Strategy and Its Use for the St
%          : [Pel98] Peltier (1998), A New Method for Automated Finite Mode
% Source   : [WM88]
% Names    : Problem 5 [WM88]
%          : Question 15 [Wos93]
%          : 4.2.5 (CL3) [Pel98]

% Status   : Satisfiable
% Rating   : 0.43 v9.0.0, 0.22 v8.2.0, 0.00 v8.1.0, 0.25 v7.5.0, 0.00 v6.1.0, 0.20 v6.0.0, 0.00 v5.4.0, 0.25 v5.3.0, 0.33 v3.2.0, 0.67 v3.1.0, 0.33 v2.7.0, 0.00 v2.6.0, 0.33 v2.4.0, 0.67 v2.2.1, 0.75 v2.2.0, 0.67 v2.1.0, 1.00 v2.0.0
% Syntax   : Number of clauses     :    3 (   3 unt;   0 nHn;   1 RR)
%            Number of literals    :    3 (   3 equ;   1 neg)
%            Maximal clause size   :    1 (   1 avg)
%            Maximal term depth    :    4 (   2 avg)
%            Number of predicates  :    1 (   0 usr;   0 prp; 2-2 aty)
%            Number of functors    :    4 (   4 usr;   3 con; 0-2 aty)
%            Number of variables   :    6 (   0 sgn)
% SPC      : CNF_SAT_RFO_PEQ_UEQ

% Comments :
%--------------------------------------------------------------------------
cnf(s_definition,axiom,
    apply(apply(apply(s,X),Y),Z) = apply(apply(X,Z),apply(Y,Z)) ).

cnf(w_definition,axiom,
    apply(apply(w,X),Y) = apply(apply(X,Y),Y) ).

cnf(prove_model,negated_conjecture,
    Y != apply(combinator,Y) ).

%--------------------------------------------------------------------------
