%------------------------------------------------------------------------------
% File     : SWV015-10 : TPTP v9.0.0. Released v7.5.0.
% Domain   : Puzzles
% Problem  : Fact 7 of the Neumann-Stubblebine analysis
% Version  : Especial.
% English  :

% Refs     : [CS18]  Claessen & Smallbone (2018), Efficient Encodings of Fi
%          : [Sma18] Smallbone (2018), Email to Geoff Sutcliffe
% Source   : [Sma18]
% Names    :

% Status   : Satisfiable
% Rating   : 0.57 v9.0.0, 0.33 v8.2.0, 0.00 v8.1.0, 0.25 v7.5.0
% Syntax   : Number of clauses     :   34 (  34 unt;   0 nHn;  10 RR)
%            Number of literals    :   34 (  34 equ;   1 neg)
%            Maximal clause size   :    1 (   1 avg)
%            Maximal term depth    :   11 (   2 avg)
%            Number of predicates  :    1 (   0 usr;   0 prp; 2-2 aty)
%            Number of functors    :   27 (  27 usr;   7 con; 0-4 aty)
%            Number of variables   :   74 (  28 sgn)
% SPC      : CNF_SAT_RFO_PEQ_UEQ

% Comments : Converted from SWV015-1 to UEQ using [CS18].
%------------------------------------------------------------------------------
cnf(ifeq_axiom,axiom,
    ifeq(A,A,B,C) = B ).

cnf(a_is_party_of_protocol_2,axiom,
    party_of_protocol(a) = true ).

cnf(a_sent_message_i_to_b_3,axiom,
    message(sent(a,b,pair(a,an_a_nonce))) = true ).

cnf(a_stored_message_i_4,axiom,
    a_stored(pair(b,an_a_nonce)) = true ).

cnf(a_forwards_secure_5,axiom,
    ifeq(a_stored(pair(A,B)),true,ifeq(message(sent(t,a,triple(encrypt(quadruple(A,B,C,D),at),E,F))),true,message(sent(a,A,pair(E,encrypt(F,C)))),true),true) = true ).

cnf(b_is_party_of_protocol_8,axiom,
    party_of_protocol(b) = true ).

cnf(nonce_a_is_fresh_to_b_9,axiom,
    fresh_to_b(an_a_nonce) = true ).

cnf(b_creates_freash_nonces_in_time_10,axiom,
    ifeq(fresh_to_b(B),true,ifeq(message(sent(A,b,pair(A,B))),true,message(sent(b,t,triple(b,generate_b_nonce(B),encrypt(triple(A,B,generate_expiration_time(B)),bt)))),true),true) = true ).

cnf(t_holds_key_at_for_a_13,axiom,
    t_holds(key(at,a)) = true ).

cnf(t_holds_key_bt_for_b_14,axiom,
    t_holds(key(bt,b)) = true ).

cnf(t_is_party_of_protocol_15,axiom,
    party_of_protocol(t) = true ).

cnf(server_t_generates_key_16,axiom,
    ifeq(a_nonce(D),true,ifeq(t_holds(key(F,A)),true,ifeq(t_holds(key(G,C)),true,ifeq(message(sent(A,t,triple(A,B,encrypt(triple(C,D,E),F)))),true,message(sent(t,C,triple(encrypt(quadruple(A,D,generate_key(D),E),G),encrypt(triple(C,generate_key(D),E),F),B))),true),true),true),true) = true ).

cnf(intruder_can_record_17,axiom,
    ifeq(message(sent(A,B,C)),true,intruder_message(C),true) = true ).

cnf(intruder_decomposes_pairs_18,axiom,
    ifeq(intruder_message(pair(A,B)),true,intruder_message(A),true) = true ).

cnf(intruder_decomposes_pairs_19,axiom,
    ifeq(intruder_message(pair(A,B)),true,intruder_message(B),true) = true ).

cnf(intruder_decomposes_triples_20,axiom,
    ifeq(intruder_message(triple(A,B,C)),true,intruder_message(A),true) = true ).

cnf(intruder_decomposes_triples_21,axiom,
    ifeq(intruder_message(triple(A,B,C)),true,intruder_message(B),true) = true ).

cnf(intruder_decomposes_triples_22,axiom,
    ifeq(intruder_message(triple(A,B,C)),true,intruder_message(C),true) = true ).

cnf(intruder_decomposes_quadruples_23,axiom,
    ifeq(intruder_message(quadruple(A,B,C,D)),true,intruder_message(A),true) = true ).

cnf(intruder_decomposes_quadruples_24,axiom,
    ifeq(intruder_message(quadruple(A,B,C,D)),true,intruder_message(B),true) = true ).

cnf(intruder_decomposes_quadruples_25,axiom,
    ifeq(intruder_message(quadruple(A,B,C,D)),true,intruder_message(C),true) = true ).

cnf(intruder_decomposes_quadruples_26,axiom,
    ifeq(intruder_message(quadruple(A,B,C,D)),true,intruder_message(D),true) = true ).

cnf(intruder_composes_pairs_27,axiom,
    ifeq(intruder_message(B),true,ifeq(intruder_message(A),true,intruder_message(pair(A,B)),true),true) = true ).

cnf(intruder_composes_triples_28,axiom,
    ifeq(intruder_message(C),true,ifeq(intruder_message(B),true,ifeq(intruder_message(A),true,intruder_message(triple(A,B,C)),true),true),true) = true ).

cnf(intruder_composes_quadruples_29,axiom,
    ifeq(intruder_message(D),true,ifeq(intruder_message(C),true,ifeq(intruder_message(B),true,ifeq(intruder_message(A),true,intruder_message(quadruple(A,B,C,D)),true),true),true),true) = true ).

cnf(intruder_interception_30,axiom,
    ifeq(intruder_holds(key(B,C)),true,ifeq(intruder_message(encrypt(A,B)),true,ifeq(party_of_protocol(C),true,intruder_message(B),true),true),true) = true ).

cnf(intruder_message_sent_31,axiom,
    ifeq(intruder_message(A),true,ifeq(party_of_protocol(C),true,ifeq(party_of_protocol(B),true,message(sent(B,C,A)),true),true),true) = true ).

cnf(intruder_holds_key_32,axiom,
    ifeq(intruder_message(A),true,ifeq(party_of_protocol(B),true,intruder_holds(key(A,B)),true),true) = true ).

cnf(intruder_key_encrypts_33,axiom,
    ifeq(intruder_holds(key(B,C)),true,ifeq(intruder_message(A),true,ifeq(party_of_protocol(C),true,intruder_message(encrypt(A,B)),true),true),true) = true ).

cnf(an_a_nonce_is_a_nonce_34,axiom,
    a_nonce(an_a_nonce) = true ).

cnf(generated_times_and_nonces_are_nonces_36,axiom,
    a_nonce(generate_expiration_time(A)) = true ).

cnf(generated_times_and_nonces_are_nonces_37,axiom,
    a_nonce(generate_b_nonce(A)) = true ).

cnf(fnothing_is_a_nonce_and_a_key_38,axiom,
    tuple(a_nonce(A),a_key(A)) != tuple(true,true) ).

cnf(generated_keys_are_keys_39,axiom,
    a_key(generate_key(A)) = true ).

%------------------------------------------------------------------------------
