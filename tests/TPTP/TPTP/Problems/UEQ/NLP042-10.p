%------------------------------------------------------------------------------
% File     : NLP042-10 : TPTP v9.0.0. Released v7.3.0.
% Domain   : Puzzles
% Problem  : Mia ordered a shake, problem 1
% Version  : Especial.
% English  :

% Refs     : [CS18]  Claessen & Smallbone (2018), Efficient Encodings of Fi
%          : [Sma18] Smallbone (2018), Email to Geoff Sutcliffe
% Source   : [Sma18]
% Names    :

% Status   : Satisfiable
% Rating   : 0.14 v9.0.0, 0.11 v8.2.0, 0.20 v8.1.0, 0.00 v7.5.0, 0.25 v7.3.0
% Syntax   : Number of clauses     :   61 (  61 unt;   0 nHn;  13 RR)
%            Number of literals    :   61 (  61 equ;   1 neg)
%            Maximal clause size   :    1 (   1 avg)
%            Maximal term depth    :    7 (   1 avg)
%            Number of predicates  :    1 (   0 usr;   0 prp; 2-2 aty)
%            Number of functors    :   52 (  52 usr;   8 con; 0-4 aty)
%            Number of variables   :  103 (   4 sgn)
% SPC      : CNF_SAT_RFO_PEQ_UEQ

% Comments : Converted from NLP042-1 to UEQ using [CS18].
%------------------------------------------------------------------------------
cnf(ifeq_axiom,axiom,
    ifeq4(A,A,B,C) = B ).

cnf(ifeq_axiom_001,axiom,
    ifeq3(A,A,B,C) = B ).

cnf(ifeq_axiom_002,axiom,
    ifeq2(A,A,B,C) = B ).

cnf(ifeq_axiom_003,axiom,
    ifeq(A,A,B,C) = B ).

cnf(clause1,axiom,
    ifeq3(order(U,V),true,act(U,V),true) = true ).

cnf(clause2,axiom,
    ifeq3(act(U,V),true,event(U,V),true) = true ).

cnf(clause3,axiom,
    ifeq3(event(U,V),true,eventuality(U,V),true) = true ).

cnf(clause4,axiom,
    ifeq3(eventuality(U,V),true,thing(U,V),true) = true ).

cnf(clause5,axiom,
    ifeq3(thing(U,V),true,singleton(U,V),true) = true ).

cnf(clause6,axiom,
    ifeq3(eventuality(U,V),true,specific(U,V),true) = true ).

cnf(clause7,axiom,
    ifeq3(eventuality(U,V),true,nonexistent(U,V),true) = true ).

cnf(clause8,axiom,
    ifeq3(eventuality(U,V),true,unisex(U,V),true) = true ).

cnf(clause9,axiom,
    ifeq3(order(U,V),true,event(U,V),true) = true ).

cnf(clause10,axiom,
    ifeq3(shake_beverage(U,V),true,beverage(U,V),true) = true ).

cnf(clause11,axiom,
    ifeq3(beverage(U,V),true,food(U,V),true) = true ).

cnf(clause12,axiom,
    ifeq3(food(U,V),true,substance_matter(U,V),true) = true ).

cnf(clause13,axiom,
    ifeq3(substance_matter(U,V),true,object(U,V),true) = true ).

cnf(clause14,axiom,
    ifeq3(object(U,V),true,entity(U,V),true) = true ).

cnf(clause15,axiom,
    ifeq3(entity(U,V),true,thing(U,V),true) = true ).

cnf(clause16,axiom,
    ifeq3(entity(U,V),true,specific(U,V),true) = true ).

cnf(clause17,axiom,
    ifeq3(entity(U,V),true,existent(U,V),true) = true ).

cnf(clause18,axiom,
    ifeq3(object(U,V),true,nonliving(U,V),true) = true ).

cnf(clause19,axiom,
    ifeq3(object(U,V),true,impartial(U,V),true) = true ).

cnf(clause20,axiom,
    ifeq3(object(U,V),true,unisex(U,V),true) = true ).

cnf(clause21,axiom,
    ifeq3(forename(U,V),true,relname(U,V),true) = true ).

cnf(clause22,axiom,
    ifeq3(relname(U,V),true,relation(U,V),true) = true ).

cnf(clause23,axiom,
    ifeq3(relation(U,V),true,abstraction(U,V),true) = true ).

cnf(clause24,axiom,
    ifeq3(abstraction(U,V),true,thing(U,V),true) = true ).

cnf(clause25,axiom,
    ifeq3(abstraction(U,V),true,nonhuman(U,V),true) = true ).

cnf(clause26,axiom,
    ifeq3(abstraction(U,V),true,general(U,V),true) = true ).

cnf(clause27,axiom,
    ifeq3(abstraction(U,V),true,unisex(U,V),true) = true ).

cnf(clause28,axiom,
    ifeq3(mia_forename(U,V),true,forename(U,V),true) = true ).

cnf(clause29,axiom,
    ifeq3(woman(U,V),true,human_person(U,V),true) = true ).

cnf(clause30,axiom,
    ifeq3(human_person(U,V),true,organism(U,V),true) = true ).

cnf(clause31,axiom,
    ifeq3(organism(U,V),true,entity(U,V),true) = true ).

cnf(clause32,axiom,
    ifeq3(organism(U,V),true,impartial(U,V),true) = true ).

cnf(clause33,axiom,
    ifeq3(organism(U,V),true,living(U,V),true) = true ).

cnf(clause34,axiom,
    ifeq3(human_person(U,V),true,human(U,V),true) = true ).

cnf(clause35,axiom,
    ifeq3(human_person(U,V),true,animate(U,V),true) = true ).

cnf(clause36,axiom,
    ifeq3(woman(U,V),true,female(U,V),true) = true ).

cnf(clause44,axiom,
    ifeq4(of(U,W,X),true,ifeq4(of(U,V,X),true,ifeq4(forename(U,W),true,ifeq4(forename(U,V),true,ifeq4(entity(U,X),true,W,V),V),V),V),V) = V ).

cnf(clause45,negated_conjecture,
    actual_world(skc5) = true ).

cnf(clause46,negated_conjecture,
    woman(skc5,skc9) = true ).

cnf(clause47,negated_conjecture,
    shake_beverage(skc5,skc7) = true ).

cnf(clause48,negated_conjecture,
    order(skc5,skc6) = true ).

cnf(clause49,negated_conjecture,
    nonreflexive(skc5,skc6) = true ).

cnf(clause50,negated_conjecture,
    past(skc5,skc6) = true ).

cnf(clause51,negated_conjecture,
    event(skc5,skc6) = true ).

cnf(clause52,negated_conjecture,
    forename(skc5,skc8) = true ).

cnf(clause53,negated_conjecture,
    mia_forename(skc5,skc8) = true ).

cnf(clause54,negated_conjecture,
    of(skc5,skc8,skc9) = true ).

cnf(clause55,negated_conjecture,
    agent(skc5,skc6,skc9) = true ).

cnf(clause56,negated_conjecture,
    patient(skc5,skc6,skc7) = true ).

cnf(clause37,axiom,
    ifeq2(tuple2(unisex(U,V),female(U,V)),tuple2(true,true),a,b) = b ).

cnf(clause38,axiom,
    ifeq2(tuple2(specific(U,V),general(U,V)),tuple2(true,true),a,b) = b ).

cnf(clause39,axiom,
    ifeq2(tuple2(nonliving(U,V),living(U,V)),tuple2(true,true),a,b) = b ).

cnf(clause40,axiom,
    ifeq2(tuple2(nonhuman(U,V),human(U,V)),tuple2(true,true),a,b) = b ).

cnf(clause41,axiom,
    ifeq2(tuple2(nonexistent(U,V),existent(U,V)),tuple2(true,true),a,b) = b ).

cnf(clause42,axiom,
    ifeq2(tuple2(nonliving(U,V),animate(U,V)),tuple2(true,true),a,b) = b ).

cnf(clause43,axiom,
    ifeq(tuple(patient(U,V,W),nonreflexive(U,V),agent(U,V,W)),tuple(true,true,true),a,b) = b ).

cnf(goal,negated_conjecture,
    a != b ).

%------------------------------------------------------------------------------
