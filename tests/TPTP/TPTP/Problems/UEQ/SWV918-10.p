%------------------------------------------------------------------------------
% File     : SWV918-10 : TPTP v9.0.0. Released v7.3.0.
% Domain   : Puzzles
% Problem  : Java type soundness 030_39
% Version  : Especial.
% English  :

% Refs     : [CS18]  Claessen & Smallbone (2018), Efficient Encodings of Fi
%          : [Sma18] Smallbone (2018), Email to Geoff Sutcliffe
% Source   : [Sma18]
% Names    :

% Status   : Satisfiable
% Rating   : 0.00 v7.3.0
% Syntax   : Number of clauses     :   12 (  12 unt;   0 nHn;   6 RR)
%            Number of literals    :   12 (  12 equ;   1 neg)
%            Maximal clause size   :    1 (   1 avg)
%            Maximal term depth    :    7 (   2 avg)
%            Number of predicates  :    1 (   0 usr;   0 prp; 2-2 aty)
%            Number of functors    :   29 (  29 usr;  11 con; 0-5 aty)
%            Number of variables   :   16 (   7 sgn)
% SPC      : CNF_SAT_RFO_PEQ_UEQ

% Comments : Converted from SWV918-1 to UEQ using [CS18].
%------------------------------------------------------------------------------
cnf(ifeq_axiom,axiom,
    ifeq2(A,A,B,C) = B ).

cnf(ifeq_axiom_001,axiom,
    ifeq(A,A,B,C) = B ).

cnf(cls_COMBI__def_0,axiom,
    c_COMBI(V_P,T_a) = V_P ).

cnf(cls_hconf__def_1,axiom,
    ifeq(c_Conform_Ohconf(V_P,V_h,T_a),true,c_Exceptions_Opreallocated(V_h),true) = true ).

cnf(cls_hconf_0,axiom,
    c_Conform_Ohconf(v_P,v_ha____,tc_prod(tc_List_Olist(tc_List_Olist(tc_String_Ochar)),tc_Expr_Oexp(tc_List_Olist(tc_String_Ochar)))) = true ).

cnf(cls_COMBI__def__raw_0,axiom,
    c_COMBI(v_P,t_a) = v_P ).

cnf(cls_CHAINED_0,axiom,
    v_h_Ha____ = c_Fun_Ofun__upd(v_ha____,v_a____,c_Option_Ooption_OSome(c_Pair(v_C____,c_Objects_Oinit__fields(v_FDTs____),tc_List_Olist(tc_String_Ochar),tc_fun(tc_prod(tc_List_Olist(tc_String_Ochar),tc_List_Olist(tc_String_Ochar)),tc_Option_Ooption(tc_Value_Oval))),tc_prod(tc_List_Olist(tc_String_Ochar),tc_fun(tc_prod(tc_List_Olist(tc_String_Ochar),tc_List_Olist(tc_String_Ochar)),tc_Option_Ooption(tc_Value_Oval)))),tc_nat,tc_Option_Ooption(tc_prod(tc_List_Olist(tc_String_Ochar),tc_fun(tc_prod(tc_List_Olist(tc_String_Ochar),tc_List_Olist(tc_String_Ochar)),tc_Option_Ooption(tc_Value_Oval))))) ).

cnf(cls_CHAINED_0_01,axiom,
    c_Conform_Ooconf(v_P,v_ha____,c_Pair(v_C____,c_Objects_Oinit__fields(v_FDTs____),tc_List_Olist(tc_String_Ochar),tc_fun(tc_prod(tc_List_Olist(tc_String_Ochar),tc_List_Olist(tc_String_Ochar)),tc_Option_Ooption(tc_Value_Oval))),tc_prod(tc_List_Olist(tc_List_Olist(tc_String_Ochar)),tc_Expr_Oexp(tc_List_Olist(tc_String_Ochar)))) = true ).

cnf(cls_CHAINED_0_02,axiom,
    hAPP(v_ha____,v_a____) = c_Option_Ooption_ONone(tc_prod(tc_List_Olist(tc_String_Ochar),tc_fun(tc_prod(tc_List_Olist(tc_String_Ochar),tc_List_Olist(tc_String_Ochar)),tc_Option_Ooption(tc_Value_Oval)))) ).

cnf(cls_conjecture_0,negated_conjecture,
    c_Conform_Ohconf(v_P,v_h_Ha____,tc_prod(tc_List_Olist(tc_List_Olist(tc_String_Ochar)),tc_Expr_Oexp(tc_List_Olist(tc_String_Ochar)))) != true ).

cnf(cls_ATP__Linkup_Oequal__imp__fequal_0,axiom,
    c_fequal(V_x,V_x,T_a) = true ).

cnf(cls_ATP__Linkup_Ofequal__imp__equal_0,axiom,
    ifeq2(c_fequal(V_X,V_Y,T_a),true,V_X,V_Y) = V_Y ).

%------------------------------------------------------------------------------
