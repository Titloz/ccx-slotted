%------------------------------------------------------------------------------
% File     : NLP023-10 : TPTP v9.0.0. Released v7.3.0.
% Domain   : Puzzles
% Problem  : Mia wants to dance, problem 1
% Version  : Especial.
% English  :

% Refs     : [CS18]  Claessen & Smallbone (2018), Efficient Encodings of Fi
%          : [Sma18] Smallbone (2018), Email to Geoff Sutcliffe
% Source   : [Sma18]
% Names    :

% Status   : Satisfiable
% Rating   : 0.29 v9.0.0, 0.11 v8.2.0, 0.20 v8.1.0, 0.25 v7.4.0, 0.50 v7.3.0
% Syntax   : Number of clauses     :   84 (  84 unt;   0 nHn;  16 RR)
%            Number of literals    :   84 (  84 equ;   1 neg)
%            Maximal clause size   :    1 (   1 avg)
%            Maximal term depth    :    8 (   1 avg)
%            Number of predicates  :    1 (   0 usr;   0 prp; 2-2 aty)
%            Number of functors    :   46 (  46 usr;   9 con; 0-4 aty)
%            Number of variables   :  178 (   3 sgn)
% SPC      : CNF_SAT_RFO_PEQ_UEQ

% Comments : Converted from NLP023-1 to UEQ using [CS18].
%------------------------------------------------------------------------------
cnf(ifeq_axiom,axiom,
    ifeq3(A,A,B,C) = B ).

cnf(ifeq_axiom_001,axiom,
    ifeq2(A,A,B,C) = B ).

cnf(ifeq_axiom_002,axiom,
    ifeq(A,A,B,C) = B ).

cnf(clause1,axiom,
    ifeq2(dance(U,V),true,event(U,V),true) = true ).

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
    ifeq2(desire_want(U,V),true,event(U,V),true) = true ).

cnf(clause9,axiom,
    ifeq2(proposition(U,V),true,relation(U,V),true) = true ).

cnf(clause10,axiom,
    ifeq2(relation(U,V),true,abstraction(U,V),true) = true ).

cnf(clause11,axiom,
    ifeq2(abstraction(U,V),true,thing(U,V),true) = true ).

cnf(clause12,axiom,
    ifeq2(abstraction(U,V),true,nonhuman(U,V),true) = true ).

cnf(clause13,axiom,
    ifeq2(abstraction(U,V),true,general(U,V),true) = true ).

cnf(clause14,axiom,
    ifeq2(abstraction(U,V),true,unisex(U,V),true) = true ).

cnf(clause15,axiom,
    ifeq2(forename(U,V),true,relname(U,V),true) = true ).

cnf(clause16,axiom,
    ifeq2(relname(U,V),true,relation(U,V),true) = true ).

cnf(clause17,axiom,
    ifeq2(mia_forename(U,V),true,forename(U,V),true) = true ).

cnf(clause18,axiom,
    ifeq2(woman(U,V),true,human_person(U,V),true) = true ).

cnf(clause19,axiom,
    ifeq2(human_person(U,V),true,organism(U,V),true) = true ).

cnf(clause20,axiom,
    ifeq2(organism(U,V),true,entity(U,V),true) = true ).

cnf(clause21,axiom,
    ifeq2(entity(U,V),true,thing(U,V),true) = true ).

cnf(clause22,axiom,
    ifeq2(entity(U,V),true,specific(U,V),true) = true ).

cnf(clause23,axiom,
    ifeq2(entity(U,V),true,existent(U,V),true) = true ).

cnf(clause24,axiom,
    ifeq2(organism(U,V),true,impartial(U,V),true) = true ).

cnf(clause25,axiom,
    ifeq2(organism(U,V),true,living(U,V),true) = true ).

cnf(clause26,axiom,
    ifeq2(human_person(U,V),true,human(U,V),true) = true ).

cnf(clause27,axiom,
    ifeq2(human_person(U,V),true,animate(U,V),true) = true ).

cnf(clause28,axiom,
    ifeq2(woman(U,V),true,female(U,V),true) = true ).

cnf(clause33,axiom,
    ifeq2(accessible_world(U,V),true,ifeq2(dance(U,W),true,dance(V,W),true),true) = true ).

cnf(clause34,axiom,
    ifeq2(accessible_world(U,V),true,ifeq2(event(U,W),true,event(V,W),true),true) = true ).

cnf(clause35,axiom,
    ifeq2(accessible_world(U,V),true,ifeq2(eventuality(U,W),true,eventuality(V,W),true),true) = true ).

cnf(clause36,axiom,
    ifeq2(accessible_world(U,V),true,ifeq2(thing(U,W),true,thing(V,W),true),true) = true ).

cnf(clause37,axiom,
    ifeq2(accessible_world(U,V),true,ifeq2(singleton(U,W),true,singleton(V,W),true),true) = true ).

cnf(clause38,axiom,
    ifeq2(accessible_world(U,V),true,ifeq2(specific(U,W),true,specific(V,W),true),true) = true ).

cnf(clause39,axiom,
    ifeq2(accessible_world(U,V),true,ifeq2(nonexistent(U,W),true,nonexistent(V,W),true),true) = true ).

cnf(clause40,axiom,
    ifeq2(accessible_world(U,V),true,ifeq2(unisex(U,W),true,unisex(V,W),true),true) = true ).

cnf(clause41,axiom,
    ifeq2(present(U,W),true,ifeq2(accessible_world(U,V),true,present(V,W),true),true) = true ).

cnf(clause42,axiom,
    ifeq2(accessible_world(U,V),true,ifeq2(desire_want(U,W),true,desire_want(V,W),true),true) = true ).

cnf(clause43,axiom,
    ifeq2(accessible_world(U,V),true,ifeq2(proposition(U,W),true,proposition(V,W),true),true) = true ).

cnf(clause44,axiom,
    ifeq2(accessible_world(U,V),true,ifeq2(relation(U,W),true,relation(V,W),true),true) = true ).

cnf(clause45,axiom,
    ifeq2(accessible_world(U,V),true,ifeq2(abstraction(U,W),true,abstraction(V,W),true),true) = true ).

cnf(clause46,axiom,
    ifeq2(accessible_world(U,V),true,ifeq2(nonhuman(U,W),true,nonhuman(V,W),true),true) = true ).

cnf(clause47,axiom,
    ifeq2(accessible_world(U,V),true,ifeq2(general(U,W),true,general(V,W),true),true) = true ).

cnf(clause48,axiom,
    ifeq2(accessible_world(U,V),true,ifeq2(forename(U,W),true,forename(V,W),true),true) = true ).

cnf(clause49,axiom,
    ifeq2(accessible_world(U,V),true,ifeq2(relname(U,W),true,relname(V,W),true),true) = true ).

cnf(clause50,axiom,
    ifeq2(accessible_world(U,V),true,ifeq2(mia_forename(U,W),true,mia_forename(V,W),true),true) = true ).

cnf(clause51,axiom,
    ifeq2(accessible_world(U,V),true,ifeq2(woman(U,W),true,woman(V,W),true),true) = true ).

cnf(clause52,axiom,
    ifeq2(accessible_world(U,V),true,ifeq2(human_person(U,W),true,human_person(V,W),true),true) = true ).

cnf(clause53,axiom,
    ifeq2(accessible_world(U,V),true,ifeq2(organism(U,W),true,organism(V,W),true),true) = true ).

cnf(clause54,axiom,
    ifeq2(accessible_world(U,V),true,ifeq2(entity(U,W),true,entity(V,W),true),true) = true ).

cnf(clause55,axiom,
    ifeq2(accessible_world(U,V),true,ifeq2(existent(U,W),true,existent(V,W),true),true) = true ).

cnf(clause56,axiom,
    ifeq2(accessible_world(U,V),true,ifeq2(impartial(U,W),true,impartial(V,W),true),true) = true ).

cnf(clause57,axiom,
    ifeq2(accessible_world(U,V),true,ifeq2(living(U,W),true,living(V,W),true),true) = true ).

cnf(clause58,axiom,
    ifeq2(accessible_world(U,V),true,ifeq2(human(U,W),true,human(V,W),true),true) = true ).

cnf(clause59,axiom,
    ifeq2(accessible_world(U,V),true,ifeq2(animate(U,W),true,animate(V,W),true),true) = true ).

cnf(clause60,axiom,
    ifeq2(accessible_world(U,V),true,ifeq2(female(U,W),true,female(V,W),true),true) = true ).

cnf(clause61,axiom,
    ifeq2(agent(U,W,X),true,ifeq2(accessible_world(U,V),true,agent(V,W,X),true),true) = true ).

cnf(clause62,axiom,
    ifeq2(theme(U,W,X),true,ifeq2(accessible_world(U,V),true,theme(V,W,X),true),true) = true ).

cnf(clause63,axiom,
    ifeq2(of(U,W,X),true,ifeq2(accessible_world(U,V),true,of(V,W,X),true),true) = true ).

cnf(clause64,axiom,
    ifeq3(of(U,W,X),true,ifeq3(of(U,V,X),true,ifeq3(entity(U,X),true,ifeq3(forename(U,W),true,ifeq3(forename(U,V),true,W,V),V),V),V),V) = V ).

cnf(clause65,axiom,
    ifeq3(theme(U,Y,X),true,ifeq3(theme(U,V,W),true,ifeq3(proposition(U,X),true,ifeq3(proposition(U,W),true,ifeq3(desire_want(U,Y),true,ifeq3(desire_want(U,V),true,X,W),W),W),W),W),W) = W ).

cnf(clause66,negated_conjecture,
    actual_world(skc6) = true ).

cnf(clause67,negated_conjecture,
    event(skc8,skc11) = true ).

cnf(clause68,negated_conjecture,
    woman(skc6,skc10) = true ).

cnf(clause69,negated_conjecture,
    present(skc8,skc11) = true ).

cnf(clause70,negated_conjecture,
    dance(skc8,skc11) = true ).

cnf(clause71,negated_conjecture,
    forename(skc6,skc9) = true ).

cnf(clause72,negated_conjecture,
    mia_forename(skc6,skc9) = true ).

cnf(clause73,negated_conjecture,
    proposition(skc6,skc8) = true ).

cnf(clause74,negated_conjecture,
    accessible_world(skc6,skc8) = true ).

cnf(clause75,negated_conjecture,
    desire_want(skc6,skc7) = true ).

cnf(clause76,negated_conjecture,
    present(skc6,skc7) = true ).

cnf(clause77,negated_conjecture,
    of(skc6,skc9,skc10) = true ).

cnf(clause78,negated_conjecture,
    agent(skc6,skc7,skc10) = true ).

cnf(clause79,negated_conjecture,
    agent(skc8,skc11,skc10) = true ).

cnf(clause80,negated_conjecture,
    theme(skc6,skc7,skc8) = true ).

cnf(clause29,axiom,
    ifeq(tuple(unisex(U,V),female(U,V)),tuple(true,true),a,b) = b ).

cnf(clause30,axiom,
    ifeq(tuple(specific(U,V),general(U,V)),tuple(true,true),a,b) = b ).

cnf(clause31,axiom,
    ifeq(tuple(nonhuman(U,V),human(U,V)),tuple(true,true),a,b) = b ).

cnf(clause32,axiom,
    ifeq(tuple(nonexistent(U,V),existent(U,V)),tuple(true,true),a,b) = b ).

cnf(goal,negated_conjecture,
    a != b ).

%------------------------------------------------------------------------------
