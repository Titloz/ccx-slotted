%------------------------------------------------------------------------------
% File     : SWV238-10 : TPTP v9.0.0. Released v7.3.0.
% Domain   : Puzzles
% Problem  : Visa Security Module (VSM) attack denied
% Version  : Especial.
% English  :

% Refs     : [CS18]  Claessen & Smallbone (2018), Efficient Encodings of Fi
%          : [Sma18] Smallbone (2018), Email to Geoff Sutcliffe
% Source   : [Sma18]
% Names    :

% Status   : Satisfiable
% Rating   : 1.00 v7.3.0
% Syntax   : Number of clauses     :   25 (  25 unt;   0 nHn;   9 RR)
%            Number of literals    :   25 (  25 equ;   1 neg)
%            Maximal clause size   :    1 (   1 avg)
%            Maximal term depth    :   10 (   2 avg)
%            Number of predicates  :    1 (   0 usr;   0 prp; 2-2 aty)
%            Number of functors    :   17 (  17 usr;  13 con; 0-4 aty)
%            Number of variables   :   42 (  11 sgn)
% SPC      : CNF_SAT_RFO_PEQ_UEQ

% Comments : Converted from SWV238+1 to UEQ using [CS18].
%------------------------------------------------------------------------------
cnf(ifeq_axiom,axiom,
    ifeq(A,A,B,C) = B ).

cnf(enc_dec_cancel,axiom,
    enc(i(U),enc(U,V)) = V ).

cnf(dec_enc_cancel,axiom,
    enc(U,enc(i(U),V)) = V ).

cnf(double_inverse_cancel,axiom,
    i(i(U)) = U ).

cnf(keys_are_symmetric,axiom,
    ifeq(p(U),true,p(i(U)),true) = true ).

cnf(key_translate_from_ZCMK_to_TMK,axiom,
    ifeq(p(W),true,ifeq(p(V),true,ifeq(p(U),true,p(enc(tmk,enc(i(enc(i(zcmk),V)),U))),true),true),true) = true ).

cnf(key_translate_from_TMK_to_ZCMK,axiom,
    ifeq(p(W),true,ifeq(p(V),true,ifeq(p(U),true,p(enc(i(enc(i(zcmk),V)),enc(i(tmk),U))),true),true),true) = true ).

cnf(receive_working_key_from_switch,axiom,
    ifeq(p(W),true,ifeq(p(V),true,ifeq(p(U),true,p(enc(wk,enc(i(tmk),U))),true),true),true) = true ).

cnf(encrypt_a_PIN_derivation_key_under_a_TMK,axiom,
    ifeq(p(W),true,ifeq(p(V),true,ifeq(p(U),true,p(enc(enc(i(tmk),V),enc(i(tmk),U))),true),true),true) = true ).

cnf(encrypt_a_stored_comms_key,axiom,
    ifeq(p(W),true,ifeq(p(V),true,ifeq(p(U),true,p(enc(enc(i(tmk),V),enc(i(tc),U))),true),true),true) = true ).

cnf(data_encrypt,axiom,
    ifeq(p(W),true,ifeq(p(V),true,ifeq(p(U),true,p(enc(enc(i(tc),U),V)),true),true),true) = true ).

cnf(data_decrypt,axiom,
    ifeq(p(W),true,ifeq(p(V),true,ifeq(p(U),true,p(enc(i(enc(i(tc),U)),V)),true),true),true) = true ).

cnf(data_translate_PIN_from_local_to_interchange_key,axiom,
    ifeq(p(W),true,ifeq(p(V),true,ifeq(p(U),true,p(enc(enc(i(wk),W),enc(i(enc(i(tmk),V)),U))),true),true),true) = true ).

cnf(data_translate_between_interchange_keys,axiom,
    ifeq(p(W),true,ifeq(p(V),true,ifeq(p(U),true,p(enc(enc(i(wk),W),enc(i(enc(i(wk),V)),U))),true),true),true) = true ).

cnf(data_translate_PIN_from_local_storage_to_interchange_key,axiom,
    ifeq(p(W),true,ifeq(p(V),true,ifeq(p(U),true,p(enc(enc(i(wk),V),enc(i(lp),U))),true),true),true) = true ).

cnf(attacker_can_encrypt,axiom,
    ifeq(p(W),true,ifeq(p(V),true,ifeq(p(U),true,p(enc(U,V)),true),true),true) = true ).

cnf(intruder_knows_1,axiom,
    p(enc(tmk,pp)) = true ).

cnf(intruder_knows_2,axiom,
    p(enc(wk,w)) = true ).

cnf(intruder_knows_3,axiom,
    p(enc(w,t1)) = true ).

cnf(intruder_knows_4,axiom,
    p(enc(lp,t2)) = true ).

cnf(intruder_knows_5,axiom,
    p(enc(tc,k)) = true ).

cnf(intruder_knows_6,axiom,
    p(kk) = true ).

cnf(intruder_knows_7,axiom,
    p(i(kk)) = true ).

cnf(intruder_knows_8,axiom,
    p(a) = true ).

cnf(co1,negated_conjecture,
    p(enc(pp,a)) != true ).

%------------------------------------------------------------------------------
