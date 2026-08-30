%------------------------------------------------------------------------------
% File     : SWV973-10 : TPTP v9.0.0. Released v7.5.0.
% Domain   : Puzzles
% Problem  : Java type soundness 464_31
% Version  : Especial.
% English  :

% Refs     : [CS18]  Claessen & Smallbone (2018), Efficient Encodings of Fi
%          : [Sma18] Smallbone (2018), Email to Geoff Sutcliffe
% Source   : [Sma18]
% Names    :

% Status   : Satisfiable
% Rating   : 0.43 v9.0.0, 0.44 v8.2.0, 0.60 v8.1.0, 0.50 v7.5.0
% Syntax   : Number of clauses     :   19 (  19 unt;   0 nHn;   5 RR)
%            Number of literals    :   19 (  19 equ;   1 neg)
%            Maximal clause size   :    1 (   1 avg)
%            Maximal term depth    :    4 (   1 avg)
%            Number of predicates  :    1 (   0 usr;   0 prp; 2-2 aty)
%            Number of functors    :   18 (  18 usr;  11 con; 0-5 aty)
%            Number of variables   :   22 (  14 sgn)
% SPC      : CNF_SAT_RFO_PEQ_UEQ

% Comments : Converted from SWV973-1 to UEQ using [CS18].
%------------------------------------------------------------------------------
cnf(ifeq_axiom,axiom,
    ifeq2(A,A,B,C) = B ).

cnf(ifeq_axiom_001,axiom,
    ifeq(A,A,B,C) = B ).

cnf(cls_val_Osimps_I3_J_0,axiom,
    ifeq2(c_Value_Oval_OAddr(V_nat),c_Value_Oval_OAddr(V_nat_H),V_nat,V_nat_H) = V_nat_H ).

cnf(cls_val_Osimps_I2_J_0,axiom,
    ifeq2(c_Value_Oval_OIntg(V_int),c_Value_Oval_OIntg(V_int_H),V_int,V_int_H) = V_int_H ).

cnf(cls_CHAINED_0,axiom,
    c_WellTypeRT_OWTrt(v_P,v_ha____,v_E____,c_Expr_Oexp_OVal(v_v____,tc_List_Olist(tc_String_Ochar)),c_Type_Oty_ONT) = true ).

cnf(cls_val_Osimps_I10_J_0,axiom,
    ifeq(c_Value_Oval_OUnit,c_Value_Oval_OAddr(V_nat_H),a,b) = b ).

cnf(cls_val_Osimps_I22_J_0,axiom,
    ifeq(c_Value_Oval_OIntg(V_int),c_Value_Oval_OAddr(V_nat_H),a,b) = b ).

cnf(cls_val_Osimps_I23_J_0,axiom,
    ifeq(c_Value_Oval_OAddr(V_nat_H),c_Value_Oval_OIntg(V_int),a,b) = b ).

cnf(cls_val_Osimps_I11_J_0,axiom,
    ifeq(c_Value_Oval_OAddr(V_nat_H),c_Value_Oval_OUnit,a,b) = b ).

cnf(cls_val_Osimps_I8_J_0,axiom,
    ifeq(c_Value_Oval_OUnit,c_Value_Oval_OIntg(V_int_H),a,b) = b ).

cnf(cls_val_Osimps_I9_J_0,axiom,
    ifeq(c_Value_Oval_OIntg(V_int_H),c_Value_Oval_OUnit,a,b) = b ).

cnf(cls_val_Osimps_I5_J_0,axiom,
    ifeq(c_Value_Oval_ONull,c_Value_Oval_OUnit,a,b) = b ).

cnf(cls_val_Osimps_I15_J_0,axiom,
    ifeq(c_Value_Oval_OIntg(V_int_H),c_Value_Oval_ONull,a,b) = b ).

cnf(cls_val_Osimps_I4_J_0,axiom,
    ifeq(c_Value_Oval_OUnit,c_Value_Oval_ONull,a,b) = b ).

cnf(cls_val_Osimps_I14_J_0,axiom,
    ifeq(c_Value_Oval_ONull,c_Value_Oval_OIntg(V_int_H),a,b) = b ).

cnf(cls_val_Osimps_I17_J_0,axiom,
    ifeq(c_Value_Oval_OAddr(V_nat_H),c_Value_Oval_ONull,a,b) = b ).

cnf(cls_val_Osimps_I16_J_0,axiom,
    ifeq(c_Value_Oval_ONull,c_Value_Oval_OAddr(V_nat_H),a,b) = b ).

cnf(cls_conjecture_0,negated_conjecture,
    ifeq(v_v____,c_Value_Oval_ONull,a,b) = b ).

cnf(goal,negated_conjecture,
    a != b ).

%------------------------------------------------------------------------------
