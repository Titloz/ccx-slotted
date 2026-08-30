%--------------------------------------------------------------------------
% File     : LAT025-1 : TPTP v9.0.0. Released v2.2.0.
% Domain   : Lattice Theory (Ternary Near Lattices)
% Problem  : Non-uniqueness of meet (dually join) in TNL
% Version  : [MP96] (equality) axioms.
% English  : Let's say we have a ternary near-lattice (TNL) with two meet
%            operations, say meet1 and meet2.  In other words, {join,meet1}
%            and {join,meet2} are TNLs.  Are the two meets necessarily
%            the same?  No, they aren't.  Here is a counterexample.

% Refs     : [McC98] McCune (1998), Email to G. Sutcliffe
%          : [MP96]  McCune & Padmanabhan (1996), Automated Deduction in Eq
% Source   : [McC98]
% Names    : TNL-2 [MP96]

% Status   : Satisfiable
% Rating   : 0.43 v9.0.0, 0.22 v8.2.0, 0.00 v8.1.0, 0.25 v7.5.0, 0.00 v6.1.0, 0.20 v6.0.0, 0.00 v5.5.0, 0.20 v5.4.0, 0.50 v5.3.0, 0.67 v5.2.0, 0.33 v3.2.0, 0.67 v3.1.0, 0.33 v2.4.0, 0.67 v2.3.0, 1.00 v2.2.1
% Syntax   : Number of clauses     :   15 (  15 unt;   0 nHn;   1 RR)
%            Number of literals    :   15 (  15 equ;   1 neg)
%            Maximal clause size   :    1 (   1 avg)
%            Maximal term depth    :    4 (   2 avg)
%            Number of predicates  :    1 (   0 usr;   0 prp; 2-2 aty)
%            Number of functors    :    5 (   5 usr;   2 con; 0-2 aty)
%            Number of variables   :   29 (  12 sgn)
% SPC      : CNF_SAT_RFO_PEQ_UEQ

% Comments : The smallest model has 5 elements.
%--------------------------------------------------------------------------
%----{join,meet} is a TNL:
cnf(idempotence_of_meet,axiom,
    meet(X,X) = X ).

cnf(idempotence_of_join,axiom,
    join(X,X) = X ).

cnf(absorption1,axiom,
    meet(X,join(X,Y)) = X ).

cnf(absorption2,axiom,
    join(X,meet(X,Y)) = X ).

cnf(commutativity_of_meet,axiom,
    meet(X,Y) = meet(Y,X) ).

cnf(commutativity_of_join,axiom,
    join(X,Y) = join(Y,X) ).

cnf(tnl_1,axiom,
    join(X,meet(Y,meet(X,Z))) = X ).

cnf(tnl_2,axiom,
    meet(X,join(Y,join(X,Z))) = X ).

%----{join,meet2} is a TNL:
cnf(idempotence_of_meet2,axiom,
    meet2(X,X) = X ).

cnf(absorption1_2,axiom,
    meet2(X,join(X,Y)) = X ).

cnf(absorption2_2,axiom,
    join(X,meet2(X,Y)) = X ).

cnf(commutativity_of_meet2,axiom,
    meet2(X,Y) = meet2(Y,X) ).

cnf(tnl_1_2,axiom,
    join(X,meet2(Y,meet2(X,Z))) = X ).

cnf(tnl_2_2,axiom,
    meet2(X,join(Y,join(X,Z))) = X ).

%----Denial of meet=meet2.
cnf(prove_meets_equal,negated_conjecture,
    meet(a,b) != meet2(a,b) ).

%--------------------------------------------------------------------------
