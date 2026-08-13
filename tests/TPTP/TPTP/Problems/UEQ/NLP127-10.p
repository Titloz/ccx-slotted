%------------------------------------------------------------------------------
% File     : NLP127-10 : TPTP v9.0.0. Released v7.5.0.
% Domain   : Puzzles
% Problem  : An old dirty white Chevy, problem 14
% Version  : Especial.
% English  :

% Refs     : [CS18]  Claessen & Smallbone (2018), Efficient Encodings of Fi
%          : [Sma18] Smallbone (2018), Email to Geoff Sutcliffe
% Source   : [Sma18]
% Names    :

% Status   : Satisfiable
% Rating   : 0.14 v9.0.0, 0.11 v8.2.0, 0.00 v7.5.0
% Syntax   : Number of clauses     :   56 (  56 unt;   0 nHn;  18 RR)
%            Number of literals    :   56 (  56 equ;   1 neg)
%            Maximal clause size   :    1 (   1 avg)
%            Maximal term depth    :    7 (   1 avg)
%            Number of predicates  :    1 (   0 usr;   0 prp; 2-2 aty)
%            Number of functors    :   53 (  53 usr;   9 con; 0-4 aty)
%            Number of variables   :   81 (   3 sgn)
% SPC      : CNF_SAT_RFO_PEQ_UEQ

% Comments : Converted from NLP127-1 to UEQ using [CS18].
%------------------------------------------------------------------------------
cnf(ifeq_axiom,axiom,
    ifeq3(A,A,B,C) = B ).

cnf(ifeq_axiom_001,axiom,
    ifeq2(A,A,B,C) = B ).

cnf(ifeq_axiom_002,axiom,
    ifeq(A,A,B,C) = B ).

cnf(clause1,axiom,
    ifeq2(barrel(U,V),true,event(U,V),true) = true ).

cnf(clause2,axiom,
    ifeq2(event(U,V),true,eventuality(U,V),true) = true ).

cnf(clause3,axiom,
    ifeq2(eventuality(U,V),true,thing(U,V),true) = true ).

cnf(clause4,axiom,
    ifeq2(thing(U,V),true,singleton(U,V),true) = true ).

cnf(clause5,axiom,
    ifeq2(eventuality(U,V),true,specific(U,V),true) = true ).

cnf(clause6,axiom,
    ifeq2(eventuality(U,V),true,nonexistent(U,V),true) = true ).

cnf(clause7,axiom,
    ifeq2(eventuality(U,V),true,unisex(U,V),true) = true ).

cnf(clause8,axiom,
    ifeq2(street(U,V),true,way(U,V),true) = true ).

cnf(clause9,axiom,
    ifeq2(way(U,V),true,artifact(U,V),true) = true ).

cnf(clause10,axiom,
    ifeq2(artifact(U,V),true,object(U,V),true) = true ).

cnf(clause11,axiom,
    ifeq2(object(U,V),true,entity(U,V),true) = true ).

cnf(clause12,axiom,
    ifeq2(entity(U,V),true,thing(U,V),true) = true ).

cnf(clause13,axiom,
    ifeq2(entity(U,V),true,specific(U,V),true) = true ).

cnf(clause14,axiom,
    ifeq2(entity(U,V),true,existent(U,V),true) = true ).

cnf(clause15,axiom,
    ifeq2(object(U,V),true,nonliving(U,V),true) = true ).

cnf(clause16,axiom,
    ifeq2(object(U,V),true,impartial(U,V),true) = true ).

cnf(clause17,axiom,
    ifeq2(object(U,V),true,unisex(U,V),true) = true ).

cnf(clause18,axiom,
    ifeq2(placename(U,V),true,relname(U,V),true) = true ).

cnf(clause19,axiom,
    ifeq2(relname(U,V),true,relation(U,V),true) = true ).

cnf(clause20,axiom,
    ifeq2(relation(U,V),true,abstraction(U,V),true) = true ).

cnf(clause21,axiom,
    ifeq2(abstraction(U,V),true,thing(U,V),true) = true ).

cnf(clause22,axiom,
    ifeq2(abstraction(U,V),true,nonhuman(U,V),true) = true ).

cnf(clause23,axiom,
    ifeq2(abstraction(U,V),true,general(U,V),true) = true ).

cnf(clause24,axiom,
    ifeq2(abstraction(U,V),true,unisex(U,V),true) = true ).

cnf(clause25,axiom,
    ifeq2(hollywood_placename(U,V),true,placename(U,V),true) = true ).

cnf(clause26,axiom,
    ifeq2(city(U,V),true,location(U,V),true) = true ).

cnf(clause27,axiom,
    ifeq2(location(U,V),true,object(U,V),true) = true ).

cnf(clause28,axiom,
    ifeq2(chevy(U,V),true,car(U,V),true) = true ).

cnf(clause29,axiom,
    ifeq2(car(U,V),true,vehicle(U,V),true) = true ).

cnf(clause30,axiom,
    ifeq2(vehicle(U,V),true,transport(U,V),true) = true ).

cnf(clause31,axiom,
    ifeq2(transport(U,V),true,instrumentality(U,V),true) = true ).

cnf(clause32,axiom,
    ifeq2(instrumentality(U,V),true,artifact(U,V),true) = true ).

cnf(clause35,axiom,
    ifeq3(of(U,W,X),true,ifeq3(of(U,V,X),true,ifeq3(placename(U,W),true,ifeq3(placename(U,V),true,ifeq3(entity(U,X),true,W,V),V),V),V),V) = V ).

cnf(clause36,negated_conjecture,
    actual_world(skc6) = true ).

cnf(clause37,negated_conjecture,
    chevy(skc6,skc11) = true ).

cnf(clause38,negated_conjecture,
    city(skc6,skc10) = true ).

cnf(clause39,negated_conjecture,
    lonely(skc6,skc8) = true ).

cnf(clause40,negated_conjecture,
    street(skc6,skc8) = true ).

cnf(clause41,negated_conjecture,
    placename(skc6,skc9) = true ).

cnf(clause42,negated_conjecture,
    hollywood_placename(skc6,skc9) = true ).

cnf(clause43,negated_conjecture,
    event(skc6,skc7) = true ).

cnf(clause44,negated_conjecture,
    present(skc6,skc7) = true ).

cnf(clause45,negated_conjecture,
    barrel(skc6,skc7) = true ).

cnf(clause46,negated_conjecture,
    white(skc6,skc11) = true ).

cnf(clause47,negated_conjecture,
    dirty(skc6,skc11) = true ).

cnf(clause48,negated_conjecture,
    old(skc6,skc11) = true ).

cnf(clause49,negated_conjecture,
    of(skc6,skc9,skc10) = true ).

cnf(clause50,negated_conjecture,
    in(skc6,skc7,skc10) = true ).

cnf(clause51,negated_conjecture,
    down(skc6,skc7,skc8) = true ).

cnf(clause52,negated_conjecture,
    agent(skc6,skc7,skc11) = true ).

cnf(clause33,axiom,
    ifeq(tuple(specific(U,V),general(U,V)),tuple(true,true),a,b) = b ).

cnf(clause34,axiom,
    ifeq(tuple(nonexistent(U,V),existent(U,V)),tuple(true,true),a,b) = b ).

cnf(goal,negated_conjecture,
    a != b ).

%------------------------------------------------------------------------------
