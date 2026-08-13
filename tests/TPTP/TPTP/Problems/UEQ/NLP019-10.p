%------------------------------------------------------------------------------
% File     : NLP019-10 : TPTP v9.0.0. Released v7.3.0.
% Domain   : Puzzles
% Problem  : "The old dirty white Chevy" problem 19
% Version  : Especial.
% English  :

% Refs     : [CS18]  Claessen & Smallbone (2018), Efficient Encodings of Fi
%          : [Sma18] Smallbone (2018), Email to Geoff Sutcliffe
% Source   : [Sma18]
% Names    :

% Status   : Satisfiable
% Rating   : 0.14 v9.0.0, 0.11 v8.2.0, 0.20 v8.1.0, 0.00 v7.5.0, 0.25 v7.3.0
% Syntax   : Number of clauses     :   78 (  78 unt;   0 nHn;  27 RR)
%            Number of literals    :   78 (  78 equ;   1 neg)
%            Maximal clause size   :    1 (   1 avg)
%            Maximal term depth    :    5 (   2 avg)
%            Number of predicates  :    1 (   0 usr;   0 prp; 2-2 aty)
%            Number of functors    :   58 (  58 usr;  10 con; 0-4 aty)
%            Number of variables   :   74 (  12 sgn)
% SPC      : CNF_SAT_RFO_PEQ_UEQ

% Comments : Converted from NLP019-1 to UEQ using [CS18].
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
    event(skf1(U,V)) = true ).

cnf(clause2,axiom,
    ifeq2(nonhuman(U),true,entity(U),true) = true ).

cnf(clause3,axiom,
    ifeq2(drs(U),true,proposition(U),true) = true ).

cnf(clause4,axiom,
    ifeq2(proposition(U),true,drs(U),true) = true ).

cnf(clause5,axiom,
    ifeq2(woman(U),true,female(U),true) = true ).

cnf(clause6,axiom,
    ifeq2(female(U),true,human(U),true) = true ).

cnf(clause7,axiom,
    ifeq2(male(U),true,human(U),true) = true ).

cnf(clause8,axiom,
    ifeq2(man(U),true,male(U),true) = true ).

cnf(clause9,axiom,
    ifeq2(object(U),true,entity(U),true) = true ).

cnf(clause10,axiom,
    ifeq2(location(U),true,object(U),true) = true ).

cnf(clause11,axiom,
    ifeq2(city(U),true,location(U),true) = true ).

cnf(clause12,axiom,
    ifeq2(hollywood(U),true,city(U),true) = true ).

cnf(clause13,axiom,
    ifeq2(event(U),true,eventuality(U),true) = true ).

cnf(clause14,axiom,
    ifeq2(artifact(U),true,object(U),true) = true ).

cnf(clause15,axiom,
    ifeq2(instrumentality(U),true,artifact(U),true) = true ).

cnf(clause16,axiom,
    ifeq2(transport(U),true,instrumentality(U),true) = true ).

cnf(clause17,axiom,
    ifeq2(vehicle(U),true,transport(U),true) = true ).

cnf(clause18,axiom,
    ifeq2(car(U),true,vehicle(U),true) = true ).

cnf(clause19,axiom,
    ifeq2(chevy(U),true,car(U),true) = true ).

cnf(clause20,axiom,
    ifeq2(way(U),true,artifact(U),true) = true ).

cnf(clause21,axiom,
    ifeq2(street(U),true,way(U),true) = true ).

cnf(clause22,axiom,
    ifeq2(furniture(U),true,instrumentality(U),true) = true ).

cnf(clause23,axiom,
    ifeq2(seat(U),true,furniture(U),true) = true ).

cnf(clause24,axiom,
    ifeq2(front(U),true,nonhuman(U),true) = true ).

cnf(clause25,axiom,
    ifeq2(organism(U),true,entity(U),true) = true ).

cnf(clause26,axiom,
    ifeq2(human(U),true,organism(U),true) = true ).

cnf(clause27,axiom,
    ifeq2(man(U),true,human(U),true) = true ).

cnf(clause28,axiom,
    ifeq2(fellow(U),true,man(U),true) = true ).

cnf(clause40,axiom,
    ifeq2(of(U,V),true,ifeq2(owner(U),true,human(U),true),true) = true ).

cnf(clause41,axiom,
    ifeq2(of(U,V),true,have(skf1(U,V),V,U),true) = true ).

cnf(clause42,axiom,
    ifeq2(have(V,U,W),true,ifeq2(human(U),true,owner(U),true),true) = true ).

cnf(clause43,axiom,
    ifeq3(partof(U,W),true,ifeq3(partof(U,V),true,W,V),V) = V ).

cnf(clause44,axiom,
    ifeq2(have(U,V,W),true,ifeq2(event(U),true,of(V,W),true),true) = true ).

cnf(clause45,axiom,
    ifeq2(have(V,U,W),true,ifeq2(human(U),true,of(U,W),true),true) = true ).

cnf(clause46,axiom,
    ifeq2(of(U,V),true,ifeq2(owner(U),true,have(W,U,V),true),true) = true ).

cnf(clause47,axiom,
    ifeq2(have(W,V,U),true,ifeq2(nonhuman(V),true,ifeq2(nonhuman(U),true,partof(U,V),true),true),true) = true ).

cnf(clause48,negated_conjecture,
    hollywood(skc13) = true ).

cnf(clause49,negated_conjecture,
    city(skc13) = true ).

cnf(clause50,negated_conjecture,
    event(skc12) = true ).

cnf(clause51,negated_conjecture,
    chevy(skc11) = true ).

cnf(clause52,negated_conjecture,
    car(skc11) = true ).

cnf(clause53,negated_conjecture,
    white(skc11) = true ).

cnf(clause54,negated_conjecture,
    dirty(skc11) = true ).

cnf(clause55,negated_conjecture,
    old(skc11) = true ).

cnf(clause56,negated_conjecture,
    seat(skc9) = true ).

cnf(clause57,negated_conjecture,
    furniture(skc9) = true ).

cnf(clause58,negated_conjecture,
    front(skc9) = true ).

cnf(clause59,negated_conjecture,
    young(skc8) = true ).

cnf(clause60,negated_conjecture,
    man(skc8) = true ).

cnf(clause61,negated_conjecture,
    fellow(skc8) = true ).

cnf(clause62,negated_conjecture,
    fellow(skc7) = true ).

cnf(clause63,negated_conjecture,
    man(skc7) = true ).

cnf(clause64,negated_conjecture,
    young(skc7) = true ).

cnf(clause65,negated_conjecture,
    lonely(skc10) = true ).

cnf(clause66,negated_conjecture,
    way(skc10) = true ).

cnf(clause67,negated_conjecture,
    street(skc10) = true ).

cnf(clause68,negated_conjecture,
    in(skc12,skc13) = true ).

cnf(clause69,negated_conjecture,
    down(skc12,skc10) = true ).

cnf(clause70,negated_conjecture,
    barrel(skc12,skc11) = true ).

cnf(clause71,negated_conjecture,
    in(skc8,skc9) = true ).

cnf(clause72,negated_conjecture,
    in(skc7,skc9) = true ).

cnf(clause29,axiom,
    ifeq(tuple(nonhuman(U),human(U)),tuple(true,true),a,b) = b ).

cnf(clause30,axiom,
    ifeq(tuple(woman(U),man(U)),tuple(true,true),a,b) = b ).

cnf(clause31,axiom,
    ifeq(tuple(female(U),male(U)),tuple(true,true),a,b) = b ).

cnf(clause32,axiom,
    ifeq(tuple(eventuality(U),abstraction(U)),tuple(true,true),a,b) = b ).

cnf(clause33,axiom,
    ifeq(tuple(entity(U),abstraction(U)),tuple(true,true),a,b) = b ).

cnf(clause34,axiom,
    ifeq(tuple(entity(U),eventuality(U)),tuple(true,true),a,b) = b ).

cnf(clause35,axiom,
    ifeq(tuple(old(U),new(U)),tuple(true,true),a,b) = b ).

cnf(clause36,axiom,
    ifeq(tuple(location(U),artifact(U)),tuple(true,true),a,b) = b ).

cnf(clause37,axiom,
    ifeq(tuple(instrumentality(U),way(U)),tuple(true,true),a,b) = b ).

cnf(clause38,axiom,
    ifeq(tuple(transport(U),furniture(U)),tuple(true,true),a,b) = b ).

cnf(clause39,axiom,
    ifeq(tuple(object(U),organism(U)),tuple(true,true),a,b) = b ).

cnf(clause73,negated_conjecture,
    ifeq4(skc8,skc7,a,b) = b ).

cnf(goal,negated_conjecture,
    a != b ).

%------------------------------------------------------------------------------
