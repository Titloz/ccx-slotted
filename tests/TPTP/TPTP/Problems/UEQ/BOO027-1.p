%--------------------------------------------------------------------------
% File     : BOO027-1 : TPTP v9.0.0. Released v2.2.0.
% Domain   : Boolean Algebra
% Problem  : Independence of self-dual 2-basis.
% Version  : [MP96] (eqiality) axioms : Especial.
% English  : Show that half of the self-dual 2-basis in DUAL-BA-3 is fnot
%            a basis for Boolean Algebra.

% Refs     : [McC98] McCune (1998), Email to G. Sutcliffe
%          : [MP96]  McCune & Padmanabhan (1996), Automated Deduction in Eq
% Source   : [McC98]
% Names    : DUAL-BA-4 [MP96]

% Status   : Satisfiable
% Rating   : 0.00 v6.1.0, 0.20 v6.0.0, 0.00 v5.5.0, 0.20 v5.4.0, 0.25 v5.3.0, 0.33 v5.2.0, 0.00 v3.2.0, 0.33 v3.1.0, 0.00 v2.2.1
% Syntax   : Number of clauses     :    6 (   6 unt;   0 nHn;   1 RR)
%            Number of literals    :    6 (   6 equ;   1 neg)
%            Maximal clause size   :    1 (   1 avg)
%            Maximal term depth    :    5 (   2 avg)
%            Number of predicates  :    1 (   0 usr;   0 prp; 2-2 aty)
%            Number of functors    :    5 (   5 usr;   2 con; 0-2 aty)
%            Number of variables   :   10 (   0 sgn)
% SPC      : CNF_SAT_RFO_PEQ_UEQ

% Comments : There is a 2-element model.
%--------------------------------------------------------------------------
%----Two properties of Boolean algebra:
cnf(multiply_add_property,axiom,
    multiply(X,add(Y,Z)) = add(multiply(Y,X),multiply(Z,X)) ).

cnf(additive_inverse,axiom,
    add(X,inverse(X)) = one ).

%----Pixley properties:
cnf(pixley1,axiom,
    add(multiply(X,inverse(X)),add(multiply(X,Y),multiply(inverse(X),Y))) = Y ).

cnf(pixley2,axiom,
    add(multiply(X,inverse(Y)),add(multiply(X,Y),multiply(inverse(Y),Y))) = X ).

cnf(pixley3,axiom,
    add(multiply(X,inverse(Y)),add(multiply(X,X),multiply(inverse(Y),X))) = X ).

%----Denial of a property of Boolean Algebra:
cnf(prove_idempotence,negated_conjecture,
    add(a,a) != a ).

%--------------------------------------------------------------------------
