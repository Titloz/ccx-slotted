%------------------------------------------------------------------------------
% File     : SWV021-10 : TPTP v9.0.0. Released v7.5.0.
% Domain   : Puzzles
% Problem  : Show that the add function is commutative.
% Version  : Especial.
% English  :

% Refs     : [CS18]  Claessen & Smallbone (2018), Efficient Encodings of Fi
%          : [Sma18] Smallbone (2018), Email to Geoff Sutcliffe
% Source   : [Sma18]
% Names    :

% Status   : Satisfiable
% Rating   : 0.57 v9.0.0, 0.67 v8.2.0, 0.80 v8.1.0, 0.75 v7.5.0
% Syntax   : Number of clauses     :    6 (   6 unt;   0 nHn;   1 RR)
%            Number of literals    :    6 (   6 equ;   1 neg)
%            Maximal clause size   :    1 (   1 avg)
%            Maximal term depth    :    3 (   1 avg)
%            Number of predicates  :    1 (   0 usr;   0 prp; 2-2 aty)
%            Number of functors    :    4 (   4 usr;   1 con; 0-4 aty)
%            Number of variables   :   11 (   2 sgn)
% SPC      : CNF_SAT_RFO_PEQ_UEQ

% Comments : Converted from SWV021-1 to UEQ using [CS18].
%------------------------------------------------------------------------------
cnf(ifeq_axiom,axiom,
    ifeq(A,A,B,C) = B ).

cnf(zero_is_fnot_s,axiom,
    n0 != s(X) ).

cnf(successor_is_injective,axiom,
    ifeq(s(X),s(Y),X,Y) = Y ).

cnf(definition_add_0,axiom,
    add(n0,Y) = Y ).

cnf(definition_add_s,axiom,
    add(s(X),Y) = s(add(X,Y)) ).

cnf(consistency_of_add_commutative,negated_conjecture,
    add(X,Y) = add(Y,X) ).

%------------------------------------------------------------------------------
