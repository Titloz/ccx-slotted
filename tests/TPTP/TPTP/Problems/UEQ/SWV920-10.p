%------------------------------------------------------------------------------
% File     : SWV920-10 : TPTP v9.0.0. Released v7.5.0.
% Domain   : Puzzles
% Problem  : Java type soundness 058_5
% Version  : Especial.
% English  :

% Refs     : [CS18]  Claessen & Smallbone (2018), Efficient Encodings of Fi
%          : [Sma18] Smallbone (2018), Email to Geoff Sutcliffe
% Source   : [Sma18]
% Names    :

% Status   : Satisfiable
% Rating   : 0.00 v7.5.0
% Syntax   : Number of clauses     :   16 (  16 unt;   0 nHn;   8 RR)
%            Number of literals    :   16 (  16 equ;   1 neg)
%            Maximal clause size   :    1 (   1 avg)
%            Maximal term depth    :    7 (   2 avg)
%            Number of predicates  :    1 (   0 usr;   0 prp; 2-2 aty)
%            Number of functors    :   33 (  33 usr;  14 con; 0-5 aty)
%            Number of variables   :   23 (   5 sgn)
% SPC      : CNF_SAT_RFO_PEQ_UEQ

% Comments : Converted from SWV920-1 to UEQ using [CS18].
%------------------------------------------------------------------------------
cnf(ifeq_axiom,axiom,
    ifeq2(A,A,B,C) = B ).

cnf(ifeq_axiom_001,axiom,
    ifeq(A,A,B,C) = B ).

cnf(cls_hext__refl_0,axiom,
    c_Objects_Ohext(V_h,V_h) = true ).

cnf(cls_hext__trans_0,axiom,
    ifeq(c_Objects_Ohext(V_h_H,V_h_H_H),true,ifeq(c_Objects_Ohext(V_h,V_h_H),true,c_Objects_Ohext(V_h,V_h_H_H),true),true) = true ).

cnf(cls_COMBI__def_0,axiom,
    c_COMBI(V_P,T_a) = V_P ).

cnf(cls_RedNew_I5_J_0,axiom,
    c_Conform_Olconf(v_P,v_ha______,v_la______,v_E____,tc_prod(tc_List_Olist(tc_List_Olist(tc_String_Ochar)),tc_Expr_Oexp(tc_List_Olist(tc_String_Ochar)))) = true ).

cnf(cls_lconf__hext_0,axiom,
    ifeq(c_Conform_Olconf(V_P,V_h,V_l,V_E,T_a),true,ifeq(c_Objects_Ohext(V_h,V_h_H),true,c_Conform_Olconf(V_P,V_h_H,V_l,V_E,T_a),true),true) = true ).

cnf(cls_COMBI__def__raw_0,axiom,
    c_COMBI(v_P,t_a) = v_P ).

cnf(cls_CHAINED_0,axiom,
    c_Conform_Olconf(v_P,v_ha______,v_la______,v_E____,tc_prod(tc_List_Olist(tc_List_Olist(tc_String_Ochar)),tc_Expr_Oexp(tc_List_Olist(tc_String_Ochar)))) = true ).

cnf(cls_CHAINED_0_01,axiom,
    c_WellTypeRT_OWTrt(v_P,v_ha______,v_E____,c_Expr_Oexp_Onew(v_C______,tc_List_Olist(tc_String_Ochar)),v_T____) = true ).

cnf(cls_CHAINED_0_02,axiom,
    v_h_Ha______ = c_Fun_Ofun__upd(v_ha______,v_a______,c_Option_Ooption_OSome(c_Pair(v_C______,c_Objects_Oinit__fields(v_FDTs______),tc_List_Olist(tc_String_Ochar),tc_fun(tc_prod(tc_List_Olist(tc_String_Ochar),tc_List_Olist(tc_String_Ochar)),tc_Option_Ooption(tc_Value_Oval))),tc_prod(tc_List_Olist(tc_String_Ochar),tc_fun(tc_prod(tc_List_Olist(tc_String_Ochar),tc_List_Olist(tc_String_Ochar)),tc_Option_Ooption(tc_Value_Oval)))),tc_nat,tc_Option_Ooption(tc_prod(tc_List_Olist(tc_String_Ochar),tc_fun(tc_prod(tc_List_Olist(tc_String_Ochar),tc_List_Olist(tc_String_Ochar)),tc_Option_Ooption(tc_Value_Oval))))) ).

cnf(cls_CHAINED_0_03,axiom,
    c_TypeRel_OFields(v_P,v_C______,v_FDTs______,tc_prod(tc_List_Olist(tc_List_Olist(tc_String_Ochar)),tc_Expr_Oexp(tc_List_Olist(tc_String_Ochar)))) = true ).

cnf(cls_CHAINED_0_04,axiom,
    c_Objects_Onew__Addr(v_ha______) = c_Option_Ooption_OSome(v_a______,tc_nat) ).

cnf(cls_conjecture_0,negated_conjecture,
    c_Conform_Olconf(v_P,v_h_Ha______,v_la______,v_E____,tc_prod(tc_List_Olist(tc_List_Olist(tc_String_Ochar)),tc_Expr_Oexp(tc_List_Olist(tc_String_Ochar)))) != true ).

cnf(cls_ATP__Linkup_Oequal__imp__fequal_0,axiom,
    c_fequal(V_x,V_x,T_a) = true ).

cnf(cls_ATP__Linkup_Ofequal__imp__equal_0,axiom,
    ifeq2(c_fequal(V_X,V_Y,T_a),true,V_X,V_Y) = V_Y ).

%------------------------------------------------------------------------------
