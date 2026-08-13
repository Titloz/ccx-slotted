%------------------------------------------------------------------------------
% File     : NLP224-10 : TPTP v9.0.0. Released v7.5.0.
% Domain   : Puzzles
% Problem  : Vincent believes that every man smokes, problem 5
% Version  : Especial.
% English  :

% Refs     : [CS18]  Claessen & Smallbone (2018), Efficient Encodings of Fi
%          : [Sma18] Smallbone (2018), Email to Geoff Sutcliffe
% Source   : [Sma18]
% Names    :

% Status   : Satisfiable
% Rating   : 0.43 v9.0.0, 0.22 v8.2.0, 0.20 v8.1.0, 0.25 v7.5.0
% Syntax   : Number of clauses     :   98 (  98 unt;   0 nHn;  20 RR)
%            Number of literals    :   98 (  98 equ;   1 neg)
%            Maximal clause size   :    1 (   1 avg)
%            Maximal term depth    :   10 (   1 avg)
%            Number of predicates  :    1 (   0 usr;   0 prp; 2-2 aty)
%            Number of functors    :   53 (  53 usr;  12 con; 0-4 aty)
%            Number of variables   :  205 (  11 sgn)
% SPC      : CNF_SAT_RFO_PEQ_UEQ

% Comments : Converted from NLP224-1 to UEQ using [CS18].
%------------------------------------------------------------------------------
cnf(ifeq_axiom,axiom,
    ifeq3(A,A,B,C) = B ).

cnf(ifeq_axiom_001,axiom,
    ifeq2(A,A,B,C) = B ).

cnf(ifeq_axiom_002,axiom,
    ifeq(A,A,B,C) = B ).

cnf(clause1,axiom,
    ifeq2(state(U,V),true,eventuality(U,V),true) = true ).

cnf(clause2,axiom,
    ifeq2(eventuality(U,V),true,thing(U,V),true) = true ).

cnf(clause3,axiom,
    ifeq2(thing(U,V),true,singleton(U,V),true) = true ).

cnf(clause4,axiom,
    ifeq2(eventuality(U,V),true,specific(U,V),true) = true ).

cnf(clause5,axiom,
    ifeq2(eventuality(U,V),true,nonexistent(U,V),true) = true ).

cnf(clause6,axiom,
    ifeq2(eventuality(U,V),true,unisex(U,V),true) = true ).

cnf(clause7,axiom,
    ifeq2(state(U,V),true,event(U,V),true) = true ).

cnf(clause8,axiom,
    ifeq2(event(U,V),true,eventuality(U,V),true) = true ).

cnf(clause9,axiom,
    ifeq2(man(U,V),true,human_person(U,V),true) = true ).

cnf(clause10,axiom,
    ifeq2(human_person(U,V),true,organism(U,V),true) = true ).

cnf(clause11,axiom,
    ifeq2(organism(U,V),true,entity(U,V),true) = true ).

cnf(clause12,axiom,
    ifeq2(entity(U,V),true,thing(U,V),true) = true ).

cnf(clause13,axiom,
    ifeq2(entity(U,V),true,specific(U,V),true) = true ).

cnf(clause14,axiom,
    ifeq2(entity(U,V),true,existent(U,V),true) = true ).

cnf(clause15,axiom,
    ifeq2(organism(U,V),true,impartial(U,V),true) = true ).

cnf(clause16,axiom,
    ifeq2(organism(U,V),true,living(U,V),true) = true ).

cnf(clause17,axiom,
    ifeq2(human_person(U,V),true,human(U,V),true) = true ).

cnf(clause18,axiom,
    ifeq2(human_person(U,V),true,animate(U,V),true) = true ).

cnf(clause19,axiom,
    ifeq2(man(U,V),true,male(U,V),true) = true ).

cnf(clause20,axiom,
    ifeq2(forename(U,V),true,relname(U,V),true) = true ).

cnf(clause21,axiom,
    ifeq2(relname(U,V),true,relation(U,V),true) = true ).

cnf(clause22,axiom,
    ifeq2(relation(U,V),true,abstraction(U,V),true) = true ).

cnf(clause23,axiom,
    ifeq2(abstraction(U,V),true,thing(U,V),true) = true ).

cnf(clause24,axiom,
    ifeq2(abstraction(U,V),true,nonhuman(U,V),true) = true ).

cnf(clause25,axiom,
    ifeq2(abstraction(U,V),true,general(U,V),true) = true ).

cnf(clause26,axiom,
    ifeq2(abstraction(U,V),true,unisex(U,V),true) = true ).

cnf(clause27,axiom,
    ifeq2(jules_forename(U,V),true,forename(U,V),true) = true ).

cnf(clause28,axiom,
    ifeq2(smoke(U,V),true,event(U,V),true) = true ).

cnf(clause29,axiom,
    ifeq2(proposition(U,V),true,relation(U,V),true) = true ).

cnf(clause30,axiom,
    ifeq2(vincent_forename(U,V),true,forename(U,V),true) = true ).

cnf(clause35,axiom,
    ifeq3(be(U,V,W,X),true,W,X) = X ).

cnf(clause36,axiom,
    ifeq2(accessible_world(U,V),true,ifeq2(state(U,W),true,state(V,W),true),true) = true ).

cnf(clause37,axiom,
    ifeq2(accessible_world(U,V),true,ifeq2(eventuality(U,W),true,eventuality(V,W),true),true) = true ).

cnf(clause38,axiom,
    ifeq2(accessible_world(U,V),true,ifeq2(thing(U,W),true,thing(V,W),true),true) = true ).

cnf(clause39,axiom,
    ifeq2(accessible_world(U,V),true,ifeq2(singleton(U,W),true,singleton(V,W),true),true) = true ).

cnf(clause40,axiom,
    ifeq2(accessible_world(U,V),true,ifeq2(specific(U,W),true,specific(V,W),true),true) = true ).

cnf(clause41,axiom,
    ifeq2(accessible_world(U,V),true,ifeq2(nonexistent(U,W),true,nonexistent(V,W),true),true) = true ).

cnf(clause42,axiom,
    ifeq2(accessible_world(U,V),true,ifeq2(unisex(U,W),true,unisex(V,W),true),true) = true ).

cnf(clause43,axiom,
    ifeq2(accessible_world(U,V),true,ifeq2(event(U,W),true,event(V,W),true),true) = true ).

cnf(clause44,axiom,
    ifeq2(accessible_world(U,V),true,ifeq2(man(U,W),true,man(V,W),true),true) = true ).

cnf(clause45,axiom,
    ifeq2(accessible_world(U,V),true,ifeq2(human_person(U,W),true,human_person(V,W),true),true) = true ).

cnf(clause46,axiom,
    ifeq2(accessible_world(U,V),true,ifeq2(organism(U,W),true,organism(V,W),true),true) = true ).

cnf(clause47,axiom,
    ifeq2(accessible_world(U,V),true,ifeq2(entity(U,W),true,entity(V,W),true),true) = true ).

cnf(clause48,axiom,
    ifeq2(accessible_world(U,V),true,ifeq2(existent(U,W),true,existent(V,W),true),true) = true ).

cnf(clause49,axiom,
    ifeq2(accessible_world(U,V),true,ifeq2(impartial(U,W),true,impartial(V,W),true),true) = true ).

cnf(clause50,axiom,
    ifeq2(accessible_world(U,V),true,ifeq2(living(U,W),true,living(V,W),true),true) = true ).

cnf(clause51,axiom,
    ifeq2(accessible_world(U,V),true,ifeq2(human(U,W),true,human(V,W),true),true) = true ).

cnf(clause52,axiom,
    ifeq2(accessible_world(U,V),true,ifeq2(animate(U,W),true,animate(V,W),true),true) = true ).

cnf(clause53,axiom,
    ifeq2(accessible_world(U,V),true,ifeq2(male(U,W),true,male(V,W),true),true) = true ).

cnf(clause54,axiom,
    ifeq2(accessible_world(U,V),true,ifeq2(forename(U,W),true,forename(V,W),true),true) = true ).

cnf(clause55,axiom,
    ifeq2(accessible_world(U,V),true,ifeq2(relname(U,W),true,relname(V,W),true),true) = true ).

cnf(clause56,axiom,
    ifeq2(accessible_world(U,V),true,ifeq2(relation(U,W),true,relation(V,W),true),true) = true ).

cnf(clause57,axiom,
    ifeq2(accessible_world(U,V),true,ifeq2(abstraction(U,W),true,abstraction(V,W),true),true) = true ).

cnf(clause58,axiom,
    ifeq2(accessible_world(U,V),true,ifeq2(nonhuman(U,W),true,nonhuman(V,W),true),true) = true ).

cnf(clause59,axiom,
    ifeq2(accessible_world(U,V),true,ifeq2(general(U,W),true,general(V,W),true),true) = true ).

cnf(clause60,axiom,
    ifeq2(accessible_world(U,V),true,ifeq2(jules_forename(U,W),true,jules_forename(V,W),true),true) = true ).

cnf(clause61,axiom,
    ifeq2(accessible_world(U,V),true,ifeq2(smoke(U,W),true,smoke(V,W),true),true) = true ).

cnf(clause62,axiom,
    ifeq2(present(U,W),true,ifeq2(accessible_world(U,V),true,present(V,W),true),true) = true ).

cnf(clause63,axiom,
    ifeq2(think_believe_consider(U,W),true,ifeq2(accessible_world(U,V),true,think_believe_consider(V,W),true),true) = true ).

cnf(clause64,axiom,
    ifeq2(accessible_world(U,V),true,ifeq2(proposition(U,W),true,proposition(V,W),true),true) = true ).

cnf(clause65,axiom,
    ifeq2(accessible_world(U,V),true,ifeq2(vincent_forename(U,W),true,vincent_forename(V,W),true),true) = true ).

cnf(clause66,axiom,
    ifeq2(of(U,W,X),true,ifeq2(accessible_world(U,V),true,of(V,W,X),true),true) = true ).

cnf(clause67,axiom,
    ifeq2(agent(U,W,X),true,ifeq2(accessible_world(U,V),true,agent(V,W,X),true),true) = true ).

cnf(clause68,axiom,
    ifeq2(theme(U,W,X),true,ifeq2(accessible_world(U,V),true,theme(V,W,X),true),true) = true ).

cnf(clause69,axiom,
    ifeq2(be(U,W,X,Y),true,ifeq2(accessible_world(U,V),true,be(V,W,X,Y),true),true) = true ).

cnf(clause70,axiom,
    ifeq3(of(U,W,X),true,ifeq3(of(U,V,X),true,ifeq3(forename(U,W),true,ifeq3(forename(U,V),true,ifeq3(entity(U,X),true,W,V),V),V),V),V) = V ).

cnf(clause71,axiom,
    ifeq3(theme(U,Y,W),true,ifeq3(theme(U,X,V),true,ifeq3(agent(U,Y,Z),true,ifeq3(agent(U,X,Z),true,ifeq3(think_believe_consider(U,Y),true,ifeq3(think_believe_consider(U,X),true,ifeq3(proposition(U,W),true,ifeq3(proposition(U,V),true,V,W),W),W),W),W),W),W),W) = W ).

cnf(clause72,negated_conjecture,
    actual_world(skc9) = true ).

cnf(clause73,negated_conjecture,
    man(skc9,skc17) = true ).

cnf(clause74,negated_conjecture,
    forename(skc9,skc16) = true ).

cnf(clause75,negated_conjecture,
    vincent_forename(skc9,skc16) = true ).

cnf(clause76,negated_conjecture,
    event(skc9,skc15) = true ).

cnf(clause77,negated_conjecture,
    present(skc9,skc15) = true ).

cnf(clause78,negated_conjecture,
    think_believe_consider(skc9,skc15) = true ).

cnf(clause79,negated_conjecture,
    man(skc9,skc13) = true ).

cnf(clause80,negated_conjecture,
    forename(skc9,skc12) = true ).

cnf(clause81,negated_conjecture,
    jules_forename(skc9,skc12) = true ).

cnf(clause82,negated_conjecture,
    man(skc9,skc11) = true ).

cnf(clause83,negated_conjecture,
    state(skc9,skc10) = true ).

cnf(clause84,negated_conjecture,
    accessible_world(skc9,skc14) = true ).

cnf(clause85,negated_conjecture,
    proposition(skc9,skc14) = true ).

cnf(clause86,negated_conjecture,
    of(skc9,skc16,skc17) = true ).

cnf(clause87,negated_conjecture,
    agent(skc9,skc15,skc17) = true ).

cnf(clause88,negated_conjecture,
    theme(skc9,skc15,skc14) = true ).

cnf(clause89,negated_conjecture,
    of(skc9,skc12,skc13) = true ).

cnf(clause90,negated_conjecture,
    be(skc9,skc10,skc13,skc11) = true ).

cnf(clause91,negated_conjecture,
    ifeq2(man(skc14,U),true,smoke(skc14,skf1(V)),true) = true ).

cnf(clause92,negated_conjecture,
    ifeq2(man(skc14,U),true,present(skc14,skf1(V)),true) = true ).

cnf(clause93,negated_conjecture,
    ifeq2(man(skc14,U),true,event(skc14,skf1(V)),true) = true ).

cnf(clause94,negated_conjecture,
    ifeq2(man(skc14,U),true,agent(skc14,skf1(U),U),true) = true ).

cnf(clause31,axiom,
    ifeq(tuple(unisex(U,V),male(U,V)),tuple(true,true),a,b) = b ).

cnf(clause32,axiom,
    ifeq(tuple(specific(U,V),general(U,V)),tuple(true,true),a,b) = b ).

cnf(clause33,axiom,
    ifeq(tuple(human(U,V),nonhuman(U,V)),tuple(true,true),a,b) = b ).

cnf(clause34,axiom,
    ifeq(tuple(nonexistent(U,V),existent(U,V)),tuple(true,true),a,b) = b ).

cnf(goal,negated_conjecture,
    a != b ).

%------------------------------------------------------------------------------
