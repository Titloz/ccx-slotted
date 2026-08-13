%--------------------------------------------------------------------------
% File     : COL073-1 : TPTP v9.0.0. Released v1.2.0.
% Domain   : Combinatory Logic
% Problem  : Strong fixed point for B and N1
% Version  : [WM88] (equality) axioms.
% English  : The strong fixed point property holds for the set
%            P consisting of the combinators B and N1, where N1xyz = xyyz,
%            ((Bx)y)z = x(yz).

% Refs     : [WM88]  Wos & McCune (1988), Challenge Problems Focusing on Eq
%          : [Wos93] Wos (1993), The Kernel Strategy and Its Use for the St
%          : [Zha94] Zhang (1994), Solution to Afnother Open Question in Com
%          : [Pel98] Peltier (1998), A New Method for Automated Finite Mode
% Source   : [Wos93]
% Names    : Question 18 [Wos93]
%          : 4.2.5 (CL1) [Pel98]

% Status   : Satisfiable
% Rating   : 0.71 v9.0.0, 0.33 v8.2.0, 0.20 v8.1.0, 0.50 v7.5.0, 0.25 v7.3.0, 0.00 v6.2.0, 0.33 v6.1.0, 0.40 v6.0.0, 0.20 v5.4.0, 0.25 v5.3.0, 0.33 v4.1.0, 0.67 v4.0.1, 0.33 v3.2.0, 0.67 v3.1.0, 0.33 v2.4.0, 0.67 v2.3.0, 1.00 v2.0.0
% Syntax   : Number of clauses     :    3 (   3 unt;   0 nHn;   1 RR)
%            Number of literals    :    3 (   3 equ;   1 neg)
%            Maximal clause size   :    1 (   1 avg)
%            Maximal term depth    :    4 (   2 avg)
%            Number of predicates  :    1 (   0 usr;   0 prp; 2-2 aty)
%            Number of functors    :    4 (   4 usr;   2 con; 0-2 aty)
%            Number of variables   :    7 (   0 sgn)
% SPC      : CNF_SAT_RFO_PEQ_UEQ

% Comments :
%--------------------------------------------------------------------------
cnf(n1_definition,axiom,
    apply(apply(apply(n1,X),Y),Z) = apply(apply(apply(X,Y),Y),Z) ).

cnf(b_definition,axiom,
    apply(apply(apply(b,X),Y),Z) = apply(X,apply(Y,Z)) ).

cnf(prove_strong_fixed_point,negated_conjecture,
    apply(Y,f(Y)) != apply(f(Y),apply(Y,f(Y))) ).

%--------------------------------------------------------------------------
