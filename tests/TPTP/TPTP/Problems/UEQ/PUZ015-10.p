%------------------------------------------------------------------------------
% File     : PUZ015-10 : TPTP v9.0.0. Released v7.5.0.
% Domain   : Puzzles
% Problem  : Checkerboard and Dominoes : Opposing corners removed
% Version  : Especial.
% English  :

% Refs     : [CS18]  Claessen & Smallbone (2018), Efficient Encodings of Fi
%          : [Sma18] Smallbone (2018), Email to Geoff Sutcliffe
% Source   : [Sma18]
% Names    :

% Status   : Satisfiable
% Rating   : 0.71 v9.0.0, 0.56 v8.2.0, 0.60 v8.1.0, 0.25 v7.5.0
% Syntax   : Number of clauses     :   22 (  22 unt;   0 nHn;  13 RR)
%            Number of literals    :   22 (  22 equ;   1 neg)
%            Maximal clause size   :    1 (   1 avg)
%            Maximal term depth    :    5 (   1 avg)
%            Number of predicates  :    1 (   0 usr;   0 prp; 2-2 aty)
%            Number of functors    :   19 (  19 usr;  13 con; 0-8 aty)
%            Number of variables   :   61 (   1 sgn)
% SPC      : CNF_SAT_RFO_PEQ_UEQ

% Comments : Converted from PUZ015-1 to UEQ using [CS18].
%------------------------------------------------------------------------------
cnf(ifeq_axiom,axiom,
    ifeq(A,A,B,C) = B ).

cnf(cover_columns_1_and_2,axiom,
    ifeq(achievable(row(X),squares(fnot_covered,fnot_covered,Y3,Y4,Y5,Y6,Y7,Y8)),true,achievable(row(X),squares(covered,covered,Y3,Y4,Y5,Y6,Y7,Y8)),true) = true ).

cnf(cover_columns_2_and_3,axiom,
    ifeq(achievable(row(X),squares(Y1,fnot_covered,fnot_covered,Y4,Y5,Y6,Y7,Y8)),true,achievable(row(X),squares(Y1,covered,covered,Y4,Y5,Y6,Y7,Y8)),true) = true ).

cnf(cover_columns_3_and_4,axiom,
    ifeq(achievable(row(X),squares(Y1,Y2,fnot_covered,fnot_covered,Y5,Y6,Y7,Y8)),true,achievable(row(X),squares(Y1,Y2,covered,covered,Y5,Y6,Y7,Y8)),true) = true ).

cnf(cover_columns_4_and_5,axiom,
    ifeq(achievable(row(X),squares(Y1,Y2,Y3,fnot_covered,fnot_covered,Y6,Y7,Y8)),true,achievable(row(X),squares(Y1,Y2,Y3,covered,covered,Y6,Y7,Y8)),true) = true ).

cnf(cover_columns_5_and_6,axiom,
    ifeq(achievable(row(X),squares(Y1,Y2,Y3,Y4,fnot_covered,fnot_covered,Y7,Y8)),true,achievable(row(X),squares(Y1,Y2,Y3,Y4,covered,covered,Y7,Y8)),true) = true ).

cnf(cover_columns_6_and_7,axiom,
    ifeq(achievable(row(X),squares(Y1,Y2,Y3,Y4,Y5,fnot_covered,fnot_covered,Y8)),true,achievable(row(X),squares(Y1,Y2,Y3,Y4,Y5,covered,covered,Y8)),true) = true ).

cnf(cover_columns_7_and_8,axiom,
    ifeq(achievable(row(X),squares(Y1,Y2,Y3,Y4,Y5,Y6,fnot_covered,fnot_covered)),true,achievable(row(X),squares(Y1,Y2,Y3,Y4,Y5,Y6,covered,covered)),true) = true ).

cnf(place_vertical_pieces,axiom,
    ifeq(achievable(row(X),squares(Y1,Y2,Y3,Y4,Y5,Y6,Y7,Y8)),true,achievable(row(successor(X)),squares(complement(Y1),complement(Y2),complement(Y3),complement(Y4),complement(Y5),complement(Y6),complement(Y7),complement(Y8))),true) = true ).

cnf(successor_of_1_is_2,axiom,
    successor(n1) = n2 ).

cnf(successor_of_2_is_3,axiom,
    successor(n2) = n3 ).

cnf(successor_of_3_is_4,axiom,
    successor(n3) = n4 ).

cnf(successor_of_4_is_5,axiom,
    successor(n4) = n5 ).

cnf(successor_of_5_is_6,axiom,
    successor(n5) = n6 ).

cnf(successor_of_6_is_7,axiom,
    successor(n6) = n7 ).

cnf(successor_of_7_is_8,axiom,
    successor(n7) = n8 ).

cnf(successor_of_8_is_9,axiom,
    successor(n8) = n9 ).

cnf(complement_of_covered_is_fnot_covered,axiom,
    complement(covered) = fnot_covered ).

cnf(complement_of_fnot_covered_is_covered,axiom,
    complement(fnot_covered) = covered ).

cnf(complement_of_r_is_fnot_covered,axiom,
    complement(removed) = fnot_covered ).

cnf(first_row_initially,hypothesis,
    achievable(row(n1),squares(removed,fnot_covered,fnot_covered,fnot_covered,fnot_covered,fnot_covered,fnot_covered,fnot_covered)) = true ).

cnf(try_prove_row_8_can_be_covered,negated_conjecture,
    achievable(row(n8),squares(covered,covered,covered,covered,covered,covered,covered,fnot_covered)) != true ).

%------------------------------------------------------------------------------
