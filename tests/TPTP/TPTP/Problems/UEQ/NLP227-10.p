%------------------------------------------------------------------------------
% File     : NLP227-10 : TPTP v9.0.0. Released v7.3.0.
% Domain   : Puzzles
% Problem  : Vincent believes that every man smokes, problem 8
% Version  : Especial.
% English  :

% Refs     : [CS18]  Claessen & Smallbone (2018), Efficient Encodings of Fi
%          : [Sma18] Smallbone (2018), Email to Geoff Sutcliffe
% Source   : [Sma18]
% Names    :

% Status   : Satisfiable
% Rating   : 0.43 v9.0.0, 0.44 v8.2.0, 0.60 v8.1.0, 0.50 v7.5.0, 0.75 v7.3.0
% Syntax   : Number of clauses     :   94 (  94 unt;   0 nHn;  13 RR)
%            Number of literals    :   94 (  94 equ;   1 neg)
%            Maximal clause size   :    1 (   1 avg)
%            Maximal term depth    :   22 (   2 avg)
%            Number of predicates  :    1 (   0 usr;   0 prp; 2-2 aty)
%            Number of functors    :   52 (  52 usr;   8 con; 0-23 aty)
%            Number of variables   :  227 (  12 sgn)
% SPC      : CNF_SAT_RFO_PEQ_UEQ

% Comments : Converted from NLP227-1 to UEQ using [CS18].
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
    ifeq3(state(U,V),true,eventuality(U,V),true) = true ).

cnf(clause2,axiom,
    ifeq3(eventuality(U,V),true,thing(U,V),true) = true ).

cnf(clause3,axiom,
    ifeq3(thing(U,V),true,singleton(U,V),true) = true ).

cnf(clause4,axiom,
    ifeq3(eventuality(U,V),true,specific(U,V),true) = true ).

cnf(clause5,axiom,
    ifeq3(eventuality(U,V),true,nonexistent(U,V),true) = true ).

cnf(clause6,axiom,
    ifeq3(eventuality(U,V),true,unisex(U,V),true) = true ).

cnf(clause7,axiom,
    ifeq3(state(U,V),true,event(U,V),true) = true ).

cnf(clause8,axiom,
    ifeq3(event(U,V),true,eventuality(U,V),true) = true ).

cnf(clause9,axiom,
    ifeq3(man(U,V),true,human_person(U,V),true) = true ).

cnf(clause10,axiom,
    ifeq3(human_person(U,V),true,organism(U,V),true) = true ).

cnf(clause11,axiom,
    ifeq3(organism(U,V),true,entity(U,V),true) = true ).

cnf(clause12,axiom,
    ifeq3(entity(U,V),true,thing(U,V),true) = true ).

cnf(clause13,axiom,
    ifeq3(entity(U,V),true,specific(U,V),true) = true ).

cnf(clause14,axiom,
    ifeq3(entity(U,V),true,existent(U,V),true) = true ).

cnf(clause15,axiom,
    ifeq3(organism(U,V),true,impartial(U,V),true) = true ).

cnf(clause16,axiom,
    ifeq3(organism(U,V),true,living(U,V),true) = true ).

cnf(clause17,axiom,
    ifeq3(human_person(U,V),true,human(U,V),true) = true ).

cnf(clause18,axiom,
    ifeq3(human_person(U,V),true,animate(U,V),true) = true ).

cnf(clause19,axiom,
    ifeq3(man(U,V),true,male(U,V),true) = true ).

cnf(clause20,axiom,
    ifeq3(forename(U,V),true,relname(U,V),true) = true ).

cnf(clause21,axiom,
    ifeq3(relname(U,V),true,relation(U,V),true) = true ).

cnf(clause22,axiom,
    ifeq3(relation(U,V),true,abstraction(U,V),true) = true ).

cnf(clause23,axiom,
    ifeq3(abstraction(U,V),true,thing(U,V),true) = true ).

cnf(clause24,axiom,
    ifeq3(abstraction(U,V),true,nonhuman(U,V),true) = true ).

cnf(clause25,axiom,
    ifeq3(abstraction(U,V),true,general(U,V),true) = true ).

cnf(clause26,axiom,
    ifeq3(abstraction(U,V),true,unisex(U,V),true) = true ).

cnf(clause27,axiom,
    ifeq3(jules_forename(U,V),true,forename(U,V),true) = true ).

cnf(clause28,axiom,
    ifeq3(smoke(U,V),true,event(U,V),true) = true ).

cnf(clause29,axiom,
    ifeq3(proposition(U,V),true,relation(U,V),true) = true ).

cnf(clause30,axiom,
    ifeq3(vincent_forename(U,V),true,forename(U,V),true) = true ).

cnf(clause35,axiom,
    ifeq4(be(U,V,W,X),true,W,X) = X ).

cnf(clause36,axiom,
    ifeq3(accessible_world(U,V),true,ifeq3(state(U,W),true,state(V,W),true),true) = true ).

cnf(clause37,axiom,
    ifeq3(accessible_world(U,V),true,ifeq3(eventuality(U,W),true,eventuality(V,W),true),true) = true ).

cnf(clause38,axiom,
    ifeq3(accessible_world(U,V),true,ifeq3(thing(U,W),true,thing(V,W),true),true) = true ).

cnf(clause39,axiom,
    ifeq3(accessible_world(U,V),true,ifeq3(singleton(U,W),true,singleton(V,W),true),true) = true ).

cnf(clause40,axiom,
    ifeq3(accessible_world(U,V),true,ifeq3(specific(U,W),true,specific(V,W),true),true) = true ).

cnf(clause41,axiom,
    ifeq3(accessible_world(U,V),true,ifeq3(nonexistent(U,W),true,nonexistent(V,W),true),true) = true ).

cnf(clause42,axiom,
    ifeq3(accessible_world(U,V),true,ifeq3(unisex(U,W),true,unisex(V,W),true),true) = true ).

cnf(clause43,axiom,
    ifeq3(accessible_world(U,V),true,ifeq3(event(U,W),true,event(V,W),true),true) = true ).

cnf(clause44,axiom,
    ifeq3(accessible_world(U,V),true,ifeq3(man(U,W),true,man(V,W),true),true) = true ).

cnf(clause45,axiom,
    ifeq3(accessible_world(U,V),true,ifeq3(human_person(U,W),true,human_person(V,W),true),true) = true ).

cnf(clause46,axiom,
    ifeq3(accessible_world(U,V),true,ifeq3(organism(U,W),true,organism(V,W),true),true) = true ).

cnf(clause47,axiom,
    ifeq3(accessible_world(U,V),true,ifeq3(entity(U,W),true,entity(V,W),true),true) = true ).

cnf(clause48,axiom,
    ifeq3(accessible_world(U,V),true,ifeq3(existent(U,W),true,existent(V,W),true),true) = true ).

cnf(clause49,axiom,
    ifeq3(accessible_world(U,V),true,ifeq3(impartial(U,W),true,impartial(V,W),true),true) = true ).

cnf(clause50,axiom,
    ifeq3(accessible_world(U,V),true,ifeq3(living(U,W),true,living(V,W),true),true) = true ).

cnf(clause51,axiom,
    ifeq3(accessible_world(U,V),true,ifeq3(human(U,W),true,human(V,W),true),true) = true ).

cnf(clause52,axiom,
    ifeq3(accessible_world(U,V),true,ifeq3(animate(U,W),true,animate(V,W),true),true) = true ).

cnf(clause53,axiom,
    ifeq3(accessible_world(U,V),true,ifeq3(male(U,W),true,male(V,W),true),true) = true ).

cnf(clause54,axiom,
    ifeq3(accessible_world(U,V),true,ifeq3(forename(U,W),true,forename(V,W),true),true) = true ).

cnf(clause55,axiom,
    ifeq3(accessible_world(U,V),true,ifeq3(relname(U,W),true,relname(V,W),true),true) = true ).

cnf(clause56,axiom,
    ifeq3(accessible_world(U,V),true,ifeq3(relation(U,W),true,relation(V,W),true),true) = true ).

cnf(clause57,axiom,
    ifeq3(accessible_world(U,V),true,ifeq3(abstraction(U,W),true,abstraction(V,W),true),true) = true ).

cnf(clause58,axiom,
    ifeq3(accessible_world(U,V),true,ifeq3(nonhuman(U,W),true,nonhuman(V,W),true),true) = true ).

cnf(clause59,axiom,
    ifeq3(accessible_world(U,V),true,ifeq3(general(U,W),true,general(V,W),true),true) = true ).

cnf(clause60,axiom,
    ifeq3(accessible_world(U,V),true,ifeq3(jules_forename(U,W),true,jules_forename(V,W),true),true) = true ).

cnf(clause61,axiom,
    ifeq3(accessible_world(U,V),true,ifeq3(smoke(U,W),true,smoke(V,W),true),true) = true ).

cnf(clause62,axiom,
    ifeq3(present(U,W),true,ifeq3(accessible_world(U,V),true,present(V,W),true),true) = true ).

cnf(clause63,axiom,
    ifeq3(think_believe_consider(U,W),true,ifeq3(accessible_world(U,V),true,think_believe_consider(V,W),true),true) = true ).

cnf(clause64,axiom,
    ifeq3(accessible_world(U,V),true,ifeq3(proposition(U,W),true,proposition(V,W),true),true) = true ).

cnf(clause65,axiom,
    ifeq3(accessible_world(U,V),true,ifeq3(vincent_forename(U,W),true,vincent_forename(V,W),true),true) = true ).

cnf(clause66,axiom,
    ifeq3(of(U,W,X),true,ifeq3(accessible_world(U,V),true,of(V,W,X),true),true) = true ).

cnf(clause67,axiom,
    ifeq3(agent(U,W,X),true,ifeq3(accessible_world(U,V),true,agent(V,W,X),true),true) = true ).

cnf(clause68,axiom,
    ifeq3(theme(U,W,X),true,ifeq3(accessible_world(U,V),true,theme(V,W,X),true),true) = true ).

cnf(clause69,axiom,
    ifeq3(be(U,W,X,Y),true,ifeq3(accessible_world(U,V),true,be(V,W,X,Y),true),true) = true ).

cnf(clause70,axiom,
    ifeq4(of(U,W,X),true,ifeq4(of(U,V,X),true,ifeq4(forename(U,W),true,ifeq4(forename(U,V),true,ifeq4(entity(U,X),true,W,V),V),V),V),V) = V ).

cnf(clause71,axiom,
    ifeq4(theme(U,Y,W),true,ifeq4(theme(U,X,V),true,ifeq4(agent(U,Y,Z),true,ifeq4(agent(U,X,Z),true,ifeq4(think_believe_consider(U,Y),true,ifeq4(think_believe_consider(U,X),true,ifeq4(proposition(U,W),true,ifeq4(proposition(U,V),true,V,W),W),W),W),W),W),W),W) = W ).

cnf(clause72,negated_conjecture,
    actual_world(skc5) = true ).

cnf(clause73,negated_conjecture,
    man(skc5,skc9) = true ).

cnf(clause74,negated_conjecture,
    forename(skc5,skc8) = true ).

cnf(clause75,negated_conjecture,
    vincent_forename(skc5,skc8) = true ).

cnf(clause76,negated_conjecture,
    event(skc5,skc7) = true ).

cnf(clause77,negated_conjecture,
    present(skc5,skc7) = true ).

cnf(clause78,negated_conjecture,
    think_believe_consider(skc5,skc7) = true ).

cnf(clause79,negated_conjecture,
    accessible_world(skc5,skc6) = true ).

cnf(clause80,negated_conjecture,
    proposition(skc5,skc6) = true ).

cnf(clause81,negated_conjecture,
    of(skc5,skc8,skc9) = true ).

cnf(clause82,negated_conjecture,
    agent(skc5,skc7,skc9) = true ).

cnf(clause83,negated_conjecture,
    theme(skc5,skc7,skc6) = true ).

cnf(clause84,negated_conjecture,
    ifeq3(man(skc6,U),true,smoke(skc6,skf2(V)),true) = true ).

cnf(clause85,negated_conjecture,
    ifeq3(man(skc6,U),true,present(skc6,skf2(V)),true) = true ).

cnf(clause86,negated_conjecture,
    ifeq3(man(skc6,U),true,event(skc6,skf2(V)),true) = true ).

cnf(clause87,negated_conjecture,
    ifeq3(man(skc6,U),true,agent(skc6,skf2(U),U),true) = true ).

cnf(clause88,negated_conjecture,
    ifeq3(actual_world(U),true,ifeq3(be(U,Z,X3,X1),true,ifeq3(theme(U,W,V),true,ifeq3(agent(U,W,Y),true,ifeq3(of(U,X2,X3),true,ifeq3(of(U,X,Y),true,ifeq3(think_believe_consider(U,W),true,ifeq3(present(U,W),true,ifeq3(accessible_world(U,V),true,ifeq3(vincent_forename(U,X),true,ifeq3(proposition(U,V),true,ifeq3(jules_forename(U,X2),true,ifeq3(forename(U,X2),true,ifeq3(forename(U,X),true,ifeq3(man(U,X3),true,ifeq3(man(U,X1),true,ifeq3(man(U,Y),true,ifeq3(event(U,W),true,ifeq3(state(U,Z),true,man(V,skf4(V)),true),true),true),true),true),true),true),true),true),true),true),true),true),true),true),true),true),true),true) = true ).

cnf(clause31,axiom,
    ifeq2(tuple2(unisex(U,V),male(U,V)),tuple2(true,true),a,b) = b ).

cnf(clause32,axiom,
    ifeq2(tuple2(specific(U,V),general(U,V)),tuple2(true,true),a,b) = b ).

cnf(clause33,axiom,
    ifeq2(tuple2(human(U,V),nonhuman(U,V)),tuple2(true,true),a,b) = b ).

cnf(clause34,axiom,
    ifeq2(tuple2(nonexistent(U,V),existent(U,V)),tuple2(true,true),a,b) = b ).

cnf(clause89,negated_conjecture,
    ifeq(tuple(state(U,X1),event(U,X),event(V,W),man(U,Z),man(U,X2),man(U,X4),forename(U,Y),forename(U,X3),jules_forename(U,X3),smoke(V,W),proposition(U,V),vincent_forename(U,Y),accessible_world(U,V),present(U,X),present(V,W),think_believe_consider(U,X),of(U,Y,Z),of(U,X3,X4),agent(U,X,Z),agent(V,W,skf4(V)),theme(U,X,V),be(U,X1,X4,X2),actual_world(U)),tuple(true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true,true),a,b) = b ).

cnf(goal,negated_conjecture,
    a != b ).

%------------------------------------------------------------------------------
