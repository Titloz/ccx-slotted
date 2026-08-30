%------------------------------------------------------------------------------
% File     : NLP108-10 : TPTP v9.0.0. Released v7.5.0.
% Domain   : Puzzles
% Problem  : Every customer in a restaurant, problem 15
% Version  : Especial.
% English  :

% Refs     : [CS18]  Claessen & Smallbone (2018), Efficient Encodings of Fi
%          : [Sma18] Smallbone (2018), Email to Geoff Sutcliffe
% Source   : [Sma18]
% Names    :

% Status   : Satisfiable
% Rating   : 0.00 v7.5.0
% Syntax   : Number of clauses     :   54 (  54 unt;   0 nHn;  11 RR)
%            Number of literals    :   54 (  54 equ;   1 neg)
%            Maximal clause size   :    1 (   1 avg)
%            Maximal term depth    :    5 (   1 avg)
%            Number of predicates  :    1 (   0 usr;   0 prp; 2-2 aty)
%            Number of functors    :   47 (  47 usr;   8 con; 0-4 aty)
%            Number of variables   :   91 (   9 sgn)
% SPC      : CNF_SAT_RFO_PEQ_UEQ

% Comments : Converted from NLP108-1 to UEQ using [CS18].
%------------------------------------------------------------------------------
cnf(ifeq_axiom,axiom,
    ifeq3(A,A,B,C) = B ).

cnf(ifeq_axiom_001,axiom,
    ifeq2(A,A,B,C) = B ).

cnf(ifeq_axiom_002,axiom,
    ifeq(A,A,B,C) = B ).

cnf(clause1,axiom,
    ifeq3(see(U,V),true,event(U,V),true) = true ).

cnf(clause2,axiom,
    ifeq3(event(U,V),true,eventuality(U,V),true) = true ).

cnf(clause3,axiom,
    ifeq3(eventuality(U,V),true,thing(U,V),true) = true ).

cnf(clause4,axiom,
    ifeq3(thing(U,V),true,singleton(U,V),true) = true ).

cnf(clause5,axiom,
    ifeq3(eventuality(U,V),true,specific(U,V),true) = true ).

cnf(clause6,axiom,
    ifeq3(eventuality(U,V),true,nonexistent(U,V),true) = true ).

cnf(clause7,axiom,
    ifeq3(eventuality(U,V),true,unisex(U,V),true) = true ).

cnf(clause8,axiom,
    ifeq3(drink(U,V),true,event(U,V),true) = true ).

cnf(clause9,axiom,
    ifeq3(coffee(U,V),true,beverage(U,V),true) = true ).

cnf(clause10,axiom,
    ifeq3(beverage(U,V),true,food(U,V),true) = true ).

cnf(clause11,axiom,
    ifeq3(food(U,V),true,substance_matter(U,V),true) = true ).

cnf(clause12,axiom,
    ifeq3(substance_matter(U,V),true,object(U,V),true) = true ).

cnf(clause13,axiom,
    ifeq3(object(U,V),true,entity(U,V),true) = true ).

cnf(clause14,axiom,
    ifeq3(entity(U,V),true,thing(U,V),true) = true ).

cnf(clause15,axiom,
    ifeq3(entity(U,V),true,specific(U,V),true) = true ).

cnf(clause16,axiom,
    ifeq3(entity(U,V),true,existent(U,V),true) = true ).

cnf(clause17,axiom,
    ifeq3(object(U,V),true,nonliving(U,V),true) = true ).

cnf(clause18,axiom,
    ifeq3(object(U,V),true,impartial(U,V),true) = true ).

cnf(clause19,axiom,
    ifeq3(object(U,V),true,unisex(U,V),true) = true ).

cnf(clause20,axiom,
    ifeq3(human_person(U,V),true,organism(U,V),true) = true ).

cnf(clause21,axiom,
    ifeq3(organism(U,V),true,entity(U,V),true) = true ).

cnf(clause22,axiom,
    ifeq3(organism(U,V),true,impartial(U,V),true) = true ).

cnf(clause23,axiom,
    ifeq3(organism(U,V),true,living(U,V),true) = true ).

cnf(clause24,axiom,
    ifeq3(human_person(U,V),true,human(U,V),true) = true ).

cnf(clause25,axiom,
    ifeq3(human_person(U,V),true,animate(U,V),true) = true ).

cnf(clause26,axiom,
    ifeq3(customer(U,V),true,human_person(U,V),true) = true ).

cnf(clause27,axiom,
    ifeq3(restaurant(U,V),true,building(U,V),true) = true ).

cnf(clause28,axiom,
    ifeq3(building(U,V),true,artifact(U,V),true) = true ).

cnf(clause29,axiom,
    ifeq3(artifact(U,V),true,object(U,V),true) = true ).

cnf(clause34,axiom,
    ifeq3(agent(U,V,X),true,ifeq3(patient(U,V,W),true,ifeq3(drink(U,V),true,beverage(U,W),true),true),true) = true ).

cnf(clause35,negated_conjecture,
    actual_world(skc5) = true ).

cnf(clause36,negated_conjecture,
    coffee(skc5,skc10) = true ).

cnf(clause37,negated_conjecture,
    restaurant(skc5,skc8) = true ).

cnf(clause38,negated_conjecture,
    human_person(skc5,skc7) = true ).

cnf(clause39,negated_conjecture,
    drink(skc5,skc6) = true ).

cnf(clause40,negated_conjecture,
    nonreflexive(skc5,skc6) = true ).

cnf(clause41,negated_conjecture,
    past(skc5,skc6) = true ).

cnf(clause42,negated_conjecture,
    event(skc5,skc6) = true ).

cnf(clause43,negated_conjecture,
    agent(skc5,skc6,skc7) = true ).

cnf(clause44,negated_conjecture,
    patient(skc5,skc6,skc10) = true ).

cnf(clause45,negated_conjecture,
    ifeq3(in(skc5,U,skc8),true,ifeq3(customer(skc5,U),true,see(skc5,skf1(V)),true),true) = true ).

cnf(clause46,negated_conjecture,
    ifeq3(in(skc5,U,skc8),true,ifeq3(customer(skc5,U),true,nonreflexive(skc5,skf1(V)),true),true) = true ).

cnf(clause47,negated_conjecture,
    ifeq3(in(skc5,U,skc8),true,ifeq3(customer(skc5,U),true,past(skc5,skf1(V)),true),true) = true ).

cnf(clause48,negated_conjecture,
    ifeq3(in(skc5,U,skc8),true,ifeq3(customer(skc5,U),true,event(skc5,skf1(V)),true),true) = true ).

cnf(clause49,negated_conjecture,
    ifeq3(in(skc5,U,skc8),true,ifeq3(customer(skc5,U),true,patient(skc5,skf1(V),skc7),true),true) = true ).

cnf(clause50,negated_conjecture,
    ifeq3(in(skc5,U,skc8),true,ifeq3(customer(skc5,U),true,agent(skc5,skf1(U),U),true),true) = true ).

cnf(clause30,axiom,
    ifeq2(tuple2(nonliving(U,V),living(U,V)),tuple2(true,true),a,b) = b ).

cnf(clause31,axiom,
    ifeq2(tuple2(nonexistent(U,V),existent(U,V)),tuple2(true,true),a,b) = b ).

cnf(clause32,axiom,
    ifeq2(tuple2(nonliving(U,V),animate(U,V)),tuple2(true,true),a,b) = b ).

cnf(clause33,axiom,
    ifeq(tuple(patient(U,V,W),nonreflexive(U,V),agent(U,V,W)),tuple(true,true,true),a,b) = b ).

cnf(goal,negated_conjecture,
    a != b ).

%------------------------------------------------------------------------------
