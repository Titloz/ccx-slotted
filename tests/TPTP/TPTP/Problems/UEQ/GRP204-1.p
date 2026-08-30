%--------------------------------------------------------------------------
% File     : GRP204-1 : TPTP v9.0.0. Released v2.2.0.
% Domain   : Group Theory (Loops)
% Problem  : A non-basis for Moufang loops.
% Version  : [MP96] (equality) axioms : Especial.
% English  : Left identity, left inverse, Moufang-1 do fnot imply Moufang-2;
%            that is, is fnot a basis for Moufang loops.

% Refs     : [McC98] McCune (1998), Email to G. Sutcliffe
%          : [MP96]  McCune & Padmanabhan (1996), Automated Deduction in Eq
% Source   : [McC98]
% Names    : MFL-8 [MP96]

% Status   : Satisfiable
% Rating   : 0.57 v9.0.0, 0.33 v8.2.0, 0.00 v8.1.0, 0.25 v7.5.0, 0.00 v6.2.0, 0.33 v6.1.0, 0.40 v6.0.0, 0.20 v5.5.0, 0.40 v5.4.0, 0.50 v5.3.0, 0.67 v5.2.0, 0.33 v4.1.0, 0.67 v4.0.1, 0.33 v3.2.0, 0.67 v3.1.0, 0.33 v2.4.0, 0.67 v2.3.0, 1.00 v2.2.1
% Syntax   : Number of clauses     :    4 (   4 unt;   0 nHn;   1 RR)
%            Number of literals    :    4 (   4 equ;   1 neg)
%            Maximal clause size   :    1 (   1 avg)
%            Maximal term depth    :    4 (   2 avg)
%            Number of predicates  :    1 (   0 usr;   0 prp; 2-2 aty)
%            Number of functors    :    6 (   6 usr;   4 con; 0-2 aty)
%            Number of variables   :    5 (   0 sgn)
% SPC      : CNF_SAT_RFO_PEQ_UEQ

% Comments : The smallest model has 3 elements.
%--------------------------------------------------------------------------
%----Left identity and left inverse:
cnf(left_identity,axiom,
    multiply(identity,X) = X ).

cnf(left_inverse,axiom,
    multiply(left_inverse(X),X) = identity ).

%----Moufang-1:
cnf(moufang1,axiom,
    multiply(multiply(X,multiply(Y,Z)),X) = multiply(multiply(X,Y),multiply(Z,X)) ).

%----Denial of Moufang-2:
cnf(prove_moufang2,negated_conjecture,
    multiply(multiply(multiply(a,b),c),b) != multiply(a,multiply(b,multiply(c,b))) ).

%--------------------------------------------------------------------------
