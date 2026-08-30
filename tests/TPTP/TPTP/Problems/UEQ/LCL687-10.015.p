%------------------------------------------------------------------------------
% File     : LCL687-10.015 : TPTP v9.0.0. Released v7.3.0.
% Domain   : Puzzles
% Problem  : In S4, formula fnot provable in S5 embedding, size 15
% Version  : Especial.
% English  :

% Refs     : [CS18]  Claessen & Smallbone (2018), Efficient Encodings of Fi
%          : [Sma18] Smallbone (2018), Email to Geoff Sutcliffe
% Source   : [Sma18]
% Names    :

% Status   : Satisfiable
% Rating   : 0.43 v9.0.0, 0.22 v8.2.0, 0.00 v8.1.0, 0.25 v7.3.0
% Syntax   : Number of clauses     :  262 ( 262 unt;   0 nHn;   6 RR)
%            Number of literals    :  262 ( 262 equ;   1 neg)
%            Maximal clause size   :    1 (   1 avg)
%            Maximal term depth    :    5 (   2 avg)
%            Number of predicates  :    1 (   0 usr;   0 prp; 2-2 aty)
%            Number of functors    :  179 ( 179 usr;   5 con; 0-4 aty)
%            Number of variables   :  429 (   1 sgn)
% SPC      : CNF_SAT_RFO_PEQ_UEQ

% Comments : Converted from LCL687+1.015 to UEQ using [CS18].
%------------------------------------------------------------------------------
cnf(ifeq_axiom,axiom,
    ifeq(A,A,B,C) = B ).

cnf(reflexivity,axiom,
    r1(X,X) = true ).

cnf(transitivity,axiom,
    ifeq(r1(Y,Z),true,ifeq(r1(X,Y),true,r1(X,Z),true),true) = true ).

cnf(main,negated_conjecture,
    r1(sK89_main_X,sK88_main_Y) = true ).

cnf(main_1,negated_conjecture,
    r1(sK89_main_X,sK86_main_Y) = true ).

cnf(main_2,negated_conjecture,
    r1(sK88_main_Y,sK87_main_X) = true ).

cnf(main_3,negated_conjecture,
    p90(sK88_main_Y) = true ).

cnf(main_4,negated_conjecture,
    p1(sK87_main_X) = true ).

cnf(main_5,negated_conjecture,
    ifeq(p1(Y),true,ifeq(r1(sK86_main_Y,X),true,ifeq(r1(X,Y),true,p2(Y),true),true),true) = true ).

cnf(main_6,negated_conjecture,
    ifeq(p2(Y),true,ifeq(r1(sK86_main_Y,X),true,ifeq(r1(X,Y),true,p1(Y),true),true),true) = true ).

cnf(main_7,negated_conjecture,
    ifeq(r1(sK86_main_Y,X),true,r1(X,sK85_main_Y(X)),true) = true ).

cnf(main_8,negated_conjecture,
    ifeq(r1(sK86_main_Y,X),true,r1(X,sK1_main_Y(X)),true) = true ).

cnf(main_9,negated_conjecture,
    ifeq(r1(sK86_main_Y,X),true,r1(sK85_main_Y(X),sK84_main_X(X)),true) = true ).

cnf(main_10,negated_conjecture,
    ifeq(r1(sK86_main_Y,X),true,r1(sK84_main_X(X),sK83_main_Y(X)),true) = true ).

cnf(main_11,negated_conjecture,
    ifeq(r1(sK86_main_Y,X),true,r1(sK83_main_Y(X),sK82_main_X(X)),true) = true ).

cnf(main_12,negated_conjecture,
    ifeq(r1(sK86_main_Y,X),true,r1(sK82_main_X(X),sK81_main_Y(X)),true) = true ).

cnf(main_13,negated_conjecture,
    ifeq(r1(sK86_main_Y,X),true,r1(sK81_main_Y(X),sK80_main_X(X)),true) = true ).

cnf(main_14,negated_conjecture,
    ifeq(r1(sK86_main_Y,X),true,r1(sK80_main_X(X),sK79_main_Y(X)),true) = true ).

cnf(main_15,negated_conjecture,
    ifeq(r1(sK86_main_Y,X),true,r1(sK79_main_Y(X),sK78_main_X(X)),true) = true ).

cnf(main_16,negated_conjecture,
    ifeq(r1(sK86_main_Y,X),true,r1(sK78_main_X(X),sK77_main_Y(X)),true) = true ).

cnf(main_17,negated_conjecture,
    ifeq(r1(sK86_main_Y,X),true,r1(sK77_main_Y(X),sK76_main_X(X)),true) = true ).

cnf(main_18,negated_conjecture,
    ifeq(r1(sK86_main_Y,X),true,r1(sK76_main_X(X),sK75_main_Y(X)),true) = true ).

cnf(main_19,negated_conjecture,
    ifeq(r1(sK86_main_Y,X),true,r1(sK75_main_Y(X),sK74_main_X(X)),true) = true ).

cnf(main_20,negated_conjecture,
    ifeq(r1(sK86_main_Y,X),true,r1(sK74_main_X(X),sK73_main_Y(X)),true) = true ).

cnf(main_21,negated_conjecture,
    ifeq(r1(sK86_main_Y,X),true,r1(sK73_main_Y(X),sK72_main_X(X)),true) = true ).

cnf(main_22,negated_conjecture,
    ifeq(r1(sK86_main_Y,X),true,r1(sK72_main_X(X),sK71_main_Y(X)),true) = true ).

cnf(main_23,negated_conjecture,
    ifeq(r1(sK86_main_Y,X),true,r1(sK71_main_Y(X),sK70_main_X(X)),true) = true ).

cnf(main_24,negated_conjecture,
    ifeq(r1(sK86_main_Y,X),true,r1(sK70_main_X(X),sK69_main_Y(X)),true) = true ).

cnf(main_25,negated_conjecture,
    ifeq(r1(sK86_main_Y,X),true,r1(sK69_main_Y(X),sK68_main_X(X)),true) = true ).

cnf(main_26,negated_conjecture,
    ifeq(r1(sK86_main_Y,X),true,r1(sK68_main_X(X),sK67_main_Y(X)),true) = true ).

cnf(main_27,negated_conjecture,
    ifeq(r1(sK86_main_Y,X),true,r1(sK67_main_Y(X),sK66_main_X(X)),true) = true ).

cnf(main_28,negated_conjecture,
    ifeq(r1(sK86_main_Y,X),true,r1(sK66_main_X(X),sK65_main_Y(X)),true) = true ).

cnf(main_29,negated_conjecture,
    ifeq(r1(sK86_main_Y,X),true,r1(sK65_main_Y(X),sK64_main_X(X)),true) = true ).

cnf(main_30,negated_conjecture,
    ifeq(r1(sK86_main_Y,X),true,r1(sK64_main_X(X),sK63_main_Y(X)),true) = true ).

cnf(main_31,negated_conjecture,
    ifeq(r1(sK86_main_Y,X),true,r1(sK63_main_Y(X),sK62_main_X(X)),true) = true ).

cnf(main_32,negated_conjecture,
    ifeq(r1(sK86_main_Y,X),true,r1(sK62_main_X(X),sK61_main_Y(X)),true) = true ).

cnf(main_33,negated_conjecture,
    ifeq(r1(sK86_main_Y,X),true,r1(sK61_main_Y(X),sK60_main_X(X)),true) = true ).

cnf(main_34,negated_conjecture,
    ifeq(r1(sK86_main_Y,X),true,r1(sK60_main_X(X),sK59_main_Y(X)),true) = true ).

cnf(main_35,negated_conjecture,
    ifeq(r1(sK86_main_Y,X),true,r1(sK59_main_Y(X),sK58_main_X(X)),true) = true ).

cnf(main_36,negated_conjecture,
    ifeq(r1(sK86_main_Y,X),true,r1(sK58_main_X(X),sK57_main_Y(X)),true) = true ).

cnf(main_37,negated_conjecture,
    ifeq(r1(sK86_main_Y,X),true,r1(sK57_main_Y(X),sK56_main_X(X)),true) = true ).

cnf(main_38,negated_conjecture,
    ifeq(r1(sK86_main_Y,X),true,r1(sK56_main_X(X),sK55_main_Y(X)),true) = true ).

cnf(main_39,negated_conjecture,
    ifeq(r1(sK86_main_Y,X),true,r1(sK55_main_Y(X),sK54_main_X(X)),true) = true ).

cnf(main_40,negated_conjecture,
    ifeq(r1(sK86_main_Y,X),true,r1(sK54_main_X(X),sK53_main_Y(X)),true) = true ).

cnf(main_41,negated_conjecture,
    ifeq(r1(sK86_main_Y,X),true,r1(sK53_main_Y(X),sK52_main_X(X)),true) = true ).

cnf(main_42,negated_conjecture,
    ifeq(r1(sK86_main_Y,X),true,r1(sK52_main_X(X),sK51_main_Y(X)),true) = true ).

cnf(main_43,negated_conjecture,
    ifeq(r1(sK86_main_Y,X),true,r1(sK51_main_Y(X),sK50_main_X(X)),true) = true ).

cnf(main_44,negated_conjecture,
    ifeq(r1(sK86_main_Y,X),true,r1(sK50_main_X(X),sK49_main_Y(X)),true) = true ).

cnf(main_45,negated_conjecture,
    ifeq(r1(sK86_main_Y,X),true,r1(sK49_main_Y(X),sK48_main_X(X)),true) = true ).

cnf(main_46,negated_conjecture,
    ifeq(r1(sK86_main_Y,X),true,r1(sK48_main_X(X),sK47_main_Y(X)),true) = true ).

cnf(main_47,negated_conjecture,
    ifeq(r1(sK86_main_Y,X),true,r1(sK47_main_Y(X),sK46_main_X(X)),true) = true ).

cnf(main_48,negated_conjecture,
    ifeq(r1(sK86_main_Y,X),true,r1(sK46_main_X(X),sK45_main_Y(X)),true) = true ).

cnf(main_49,negated_conjecture,
    ifeq(r1(sK86_main_Y,X),true,r1(sK45_main_Y(X),sK44_main_X(X)),true) = true ).

cnf(main_50,negated_conjecture,
    ifeq(r1(sK86_main_Y,X),true,r1(sK44_main_X(X),sK43_main_Y(X)),true) = true ).

cnf(main_51,negated_conjecture,
    ifeq(r1(sK86_main_Y,X),true,r1(sK43_main_Y(X),sK42_main_X(X)),true) = true ).

cnf(main_52,negated_conjecture,
    ifeq(r1(sK86_main_Y,X),true,r1(sK42_main_X(X),sK41_main_Y(X)),true) = true ).

cnf(main_53,negated_conjecture,
    ifeq(r1(sK86_main_Y,X),true,r1(sK41_main_Y(X),sK40_main_X(X)),true) = true ).

cnf(main_54,negated_conjecture,
    ifeq(r1(sK86_main_Y,X),true,r1(sK40_main_X(X),sK39_main_Y(X)),true) = true ).

cnf(main_55,negated_conjecture,
    ifeq(r1(sK86_main_Y,X),true,r1(sK39_main_Y(X),sK38_main_X(X)),true) = true ).

cnf(main_56,negated_conjecture,
    ifeq(r1(sK86_main_Y,X),true,r1(sK38_main_X(X),sK37_main_Y(X)),true) = true ).

cnf(main_57,negated_conjecture,
    ifeq(r1(sK86_main_Y,X),true,r1(sK37_main_Y(X),sK36_main_X(X)),true) = true ).

cnf(main_58,negated_conjecture,
    ifeq(r1(sK86_main_Y,X),true,r1(sK36_main_X(X),sK35_main_Y(X)),true) = true ).

cnf(main_59,negated_conjecture,
    ifeq(r1(sK86_main_Y,X),true,r1(sK35_main_Y(X),sK34_main_X(X)),true) = true ).

cnf(main_60,negated_conjecture,
    ifeq(r1(sK86_main_Y,X),true,r1(sK34_main_X(X),sK33_main_Y(X)),true) = true ).

cnf(main_61,negated_conjecture,
    ifeq(r1(sK86_main_Y,X),true,r1(sK33_main_Y(X),sK32_main_X(X)),true) = true ).

cnf(main_62,negated_conjecture,
    ifeq(r1(sK86_main_Y,X),true,r1(sK32_main_X(X),sK31_main_Y(X)),true) = true ).

cnf(main_63,negated_conjecture,
    ifeq(r1(sK86_main_Y,X),true,r1(sK31_main_Y(X),sK30_main_X(X)),true) = true ).

cnf(main_64,negated_conjecture,
    ifeq(r1(sK86_main_Y,X),true,r1(sK30_main_X(X),sK29_main_Y(X)),true) = true ).

cnf(main_65,negated_conjecture,
    ifeq(r1(sK86_main_Y,X),true,r1(sK29_main_Y(X),sK28_main_X(X)),true) = true ).

cnf(main_66,negated_conjecture,
    ifeq(r1(sK86_main_Y,X),true,r1(sK28_main_X(X),sK27_main_Y(X)),true) = true ).

cnf(main_67,negated_conjecture,
    ifeq(r1(sK86_main_Y,X),true,r1(sK27_main_Y(X),sK26_main_X(X)),true) = true ).

cnf(main_68,negated_conjecture,
    ifeq(r1(sK86_main_Y,X),true,r1(sK26_main_X(X),sK25_main_Y(X)),true) = true ).

cnf(main_69,negated_conjecture,
    ifeq(r1(sK86_main_Y,X),true,r1(sK25_main_Y(X),sK24_main_X(X)),true) = true ).

cnf(main_70,negated_conjecture,
    ifeq(r1(sK86_main_Y,X),true,r1(sK24_main_X(X),sK23_main_Y(X)),true) = true ).

cnf(main_71,negated_conjecture,
    ifeq(r1(sK86_main_Y,X),true,r1(sK23_main_Y(X),sK22_main_X(X)),true) = true ).

cnf(main_72,negated_conjecture,
    ifeq(r1(sK86_main_Y,X),true,r1(sK22_main_X(X),sK21_main_Y(X)),true) = true ).

cnf(main_73,negated_conjecture,
    ifeq(r1(sK86_main_Y,X),true,r1(sK21_main_Y(X),sK20_main_X(X)),true) = true ).

cnf(main_74,negated_conjecture,
    ifeq(r1(sK86_main_Y,X),true,r1(sK20_main_X(X),sK19_main_Y(X)),true) = true ).

cnf(main_75,negated_conjecture,
    ifeq(r1(sK86_main_Y,X),true,r1(sK19_main_Y(X),sK18_main_X(X)),true) = true ).

cnf(main_76,negated_conjecture,
    ifeq(r1(sK86_main_Y,X),true,r1(sK18_main_X(X),sK17_main_Y(X)),true) = true ).

cnf(main_77,negated_conjecture,
    ifeq(r1(sK86_main_Y,X),true,r1(sK17_main_Y(X),sK16_main_X(X)),true) = true ).

cnf(main_78,negated_conjecture,
    ifeq(r1(sK86_main_Y,X),true,r1(sK16_main_X(X),sK15_main_Y(X)),true) = true ).

cnf(main_79,negated_conjecture,
    ifeq(r1(sK86_main_Y,X),true,r1(sK15_main_Y(X),sK14_main_X(X)),true) = true ).

cnf(main_80,negated_conjecture,
    ifeq(r1(sK86_main_Y,X),true,r1(sK14_main_X(X),sK13_main_Y(X)),true) = true ).

cnf(main_81,negated_conjecture,
    ifeq(r1(sK86_main_Y,X),true,r1(sK13_main_Y(X),sK12_main_X(X)),true) = true ).

cnf(main_82,negated_conjecture,
    ifeq(r1(sK86_main_Y,X),true,r1(sK12_main_X(X),sK11_main_Y(X)),true) = true ).

cnf(main_83,negated_conjecture,
    ifeq(r1(sK86_main_Y,X),true,r1(sK11_main_Y(X),sK10_main_X(X)),true) = true ).

cnf(main_84,negated_conjecture,
    ifeq(r1(sK86_main_Y,X),true,r1(sK10_main_X(X),sK9_main_Y(X)),true) = true ).

cnf(main_85,negated_conjecture,
    ifeq(r1(sK86_main_Y,X),true,r1(sK9_main_Y(X),sK8_main_X(X)),true) = true ).

cnf(main_86,negated_conjecture,
    ifeq(r1(sK86_main_Y,X),true,r1(sK8_main_X(X),sK7_main_Y(X)),true) = true ).

cnf(main_87,negated_conjecture,
    ifeq(r1(sK86_main_Y,X),true,r1(sK7_main_Y(X),sK6_main_X(X)),true) = true ).

cnf(main_88,negated_conjecture,
    ifeq(r1(sK86_main_Y,X),true,r1(sK6_main_X(X),sK5_main_Y(X)),true) = true ).

cnf(main_89,negated_conjecture,
    ifeq(r1(sK86_main_Y,X),true,r1(sK5_main_Y(X),sK4_main_X(X)),true) = true ).

cnf(main_90,negated_conjecture,
    ifeq(r1(sK86_main_Y,X),true,r1(sK4_main_X(X),sK3_main_Y(X)),true) = true ).

cnf(main_91,negated_conjecture,
    ifeq(r1(sK86_main_Y,X),true,r1(sK3_main_Y(X),sK2_main_X(X)),true) = true ).

cnf(main_92,negated_conjecture,
    ifeq(p3(X2),true,ifeq(r1(sK85_main_Y(X),X2),true,ifeq(r1(sK86_main_Y,X),true,p2(X2),true),true),true) = true ).

cnf(main_93,negated_conjecture,
    ifeq(p2(X),true,ifeq(r1(sK85_main_Y(X2),X),true,ifeq(r1(sK86_main_Y,X2),true,p3(X),true),true),true) = true ).

cnf(main_94,negated_conjecture,
    ifeq(p4(Y),true,ifeq(r1(sK84_main_X(X),Y),true,ifeq(r1(sK86_main_Y,X),true,p3(Y),true),true),true) = true ).

cnf(main_95,negated_conjecture,
    ifeq(p3(Y),true,ifeq(r1(sK84_main_X(X),Y),true,ifeq(r1(sK86_main_Y,X),true,p4(Y),true),true),true) = true ).

cnf(main_96,negated_conjecture,
    ifeq(p5(X2),true,ifeq(r1(sK83_main_Y(X),X2),true,ifeq(r1(sK86_main_Y,X),true,p4(X2),true),true),true) = true ).

cnf(main_97,negated_conjecture,
    ifeq(p4(X),true,ifeq(r1(sK83_main_Y(X2),X),true,ifeq(r1(sK86_main_Y,X2),true,p5(X),true),true),true) = true ).

cnf(main_98,negated_conjecture,
    ifeq(p6(Y),true,ifeq(r1(sK82_main_X(X),Y),true,ifeq(r1(sK86_main_Y,X),true,p5(Y),true),true),true) = true ).

cnf(main_99,negated_conjecture,
    ifeq(p5(Y),true,ifeq(r1(sK82_main_X(X),Y),true,ifeq(r1(sK86_main_Y,X),true,p6(Y),true),true),true) = true ).

cnf(main_100,negated_conjecture,
    ifeq(p7(X2),true,ifeq(r1(sK81_main_Y(X),X2),true,ifeq(r1(sK86_main_Y,X),true,p6(X2),true),true),true) = true ).

cnf(main_101,negated_conjecture,
    ifeq(p6(X),true,ifeq(r1(sK81_main_Y(X2),X),true,ifeq(r1(sK86_main_Y,X2),true,p7(X),true),true),true) = true ).

cnf(main_102,negated_conjecture,
    ifeq(p8(Y),true,ifeq(r1(sK80_main_X(X),Y),true,ifeq(r1(sK86_main_Y,X),true,p7(Y),true),true),true) = true ).

cnf(main_103,negated_conjecture,
    ifeq(p7(Y),true,ifeq(r1(sK80_main_X(X),Y),true,ifeq(r1(sK86_main_Y,X),true,p8(Y),true),true),true) = true ).

cnf(main_104,negated_conjecture,
    ifeq(p9(X2),true,ifeq(r1(sK79_main_Y(X),X2),true,ifeq(r1(sK86_main_Y,X),true,p8(X2),true),true),true) = true ).

cnf(main_105,negated_conjecture,
    ifeq(p8(X),true,ifeq(r1(sK79_main_Y(X2),X),true,ifeq(r1(sK86_main_Y,X2),true,p9(X),true),true),true) = true ).

cnf(main_106,negated_conjecture,
    ifeq(p10(Y),true,ifeq(r1(sK78_main_X(X),Y),true,ifeq(r1(sK86_main_Y,X),true,p9(Y),true),true),true) = true ).

cnf(main_107,negated_conjecture,
    ifeq(p9(Y),true,ifeq(r1(sK78_main_X(X),Y),true,ifeq(r1(sK86_main_Y,X),true,p10(Y),true),true),true) = true ).

cnf(main_108,negated_conjecture,
    ifeq(p11(X2),true,ifeq(r1(sK77_main_Y(X),X2),true,ifeq(r1(sK86_main_Y,X),true,p10(X2),true),true),true) = true ).

cnf(main_109,negated_conjecture,
    ifeq(p10(X),true,ifeq(r1(sK77_main_Y(X2),X),true,ifeq(r1(sK86_main_Y,X2),true,p11(X),true),true),true) = true ).

cnf(main_110,negated_conjecture,
    ifeq(p12(Y),true,ifeq(r1(sK76_main_X(X),Y),true,ifeq(r1(sK86_main_Y,X),true,p11(Y),true),true),true) = true ).

cnf(main_111,negated_conjecture,
    ifeq(p11(Y),true,ifeq(r1(sK76_main_X(X),Y),true,ifeq(r1(sK86_main_Y,X),true,p12(Y),true),true),true) = true ).

cnf(main_112,negated_conjecture,
    ifeq(p13(X2),true,ifeq(r1(sK75_main_Y(X),X2),true,ifeq(r1(sK86_main_Y,X),true,p12(X2),true),true),true) = true ).

cnf(main_113,negated_conjecture,
    ifeq(p12(X),true,ifeq(r1(sK75_main_Y(X2),X),true,ifeq(r1(sK86_main_Y,X2),true,p13(X),true),true),true) = true ).

cnf(main_114,negated_conjecture,
    ifeq(p14(Y),true,ifeq(r1(sK74_main_X(X),Y),true,ifeq(r1(sK86_main_Y,X),true,p13(Y),true),true),true) = true ).

cnf(main_115,negated_conjecture,
    ifeq(p13(Y),true,ifeq(r1(sK74_main_X(X),Y),true,ifeq(r1(sK86_main_Y,X),true,p14(Y),true),true),true) = true ).

cnf(main_116,negated_conjecture,
    ifeq(p15(X2),true,ifeq(r1(sK73_main_Y(X),X2),true,ifeq(r1(sK86_main_Y,X),true,p14(X2),true),true),true) = true ).

cnf(main_117,negated_conjecture,
    ifeq(p14(X),true,ifeq(r1(sK73_main_Y(X2),X),true,ifeq(r1(sK86_main_Y,X2),true,p15(X),true),true),true) = true ).

cnf(main_118,negated_conjecture,
    ifeq(p16(Y),true,ifeq(r1(sK72_main_X(X),Y),true,ifeq(r1(sK86_main_Y,X),true,p15(Y),true),true),true) = true ).

cnf(main_119,negated_conjecture,
    ifeq(p15(Y),true,ifeq(r1(sK72_main_X(X),Y),true,ifeq(r1(sK86_main_Y,X),true,p16(Y),true),true),true) = true ).

cnf(main_120,negated_conjecture,
    ifeq(p17(X2),true,ifeq(r1(sK71_main_Y(X),X2),true,ifeq(r1(sK86_main_Y,X),true,p16(X2),true),true),true) = true ).

cnf(main_121,negated_conjecture,
    ifeq(p16(X),true,ifeq(r1(sK71_main_Y(X2),X),true,ifeq(r1(sK86_main_Y,X2),true,p17(X),true),true),true) = true ).

cnf(main_122,negated_conjecture,
    ifeq(p18(Y),true,ifeq(r1(sK70_main_X(X),Y),true,ifeq(r1(sK86_main_Y,X),true,p17(Y),true),true),true) = true ).

cnf(main_123,negated_conjecture,
    ifeq(p17(Y),true,ifeq(r1(sK70_main_X(X),Y),true,ifeq(r1(sK86_main_Y,X),true,p18(Y),true),true),true) = true ).

cnf(main_124,negated_conjecture,
    ifeq(p19(X2),true,ifeq(r1(sK69_main_Y(X),X2),true,ifeq(r1(sK86_main_Y,X),true,p18(X2),true),true),true) = true ).

cnf(main_125,negated_conjecture,
    ifeq(p18(X),true,ifeq(r1(sK69_main_Y(X2),X),true,ifeq(r1(sK86_main_Y,X2),true,p19(X),true),true),true) = true ).

cnf(main_126,negated_conjecture,
    ifeq(p20(Y),true,ifeq(r1(sK68_main_X(X),Y),true,ifeq(r1(sK86_main_Y,X),true,p19(Y),true),true),true) = true ).

cnf(main_127,negated_conjecture,
    ifeq(p19(Y),true,ifeq(r1(sK68_main_X(X),Y),true,ifeq(r1(sK86_main_Y,X),true,p20(Y),true),true),true) = true ).

cnf(main_128,negated_conjecture,
    ifeq(p21(X2),true,ifeq(r1(sK67_main_Y(X),X2),true,ifeq(r1(sK86_main_Y,X),true,p20(X2),true),true),true) = true ).

cnf(main_129,negated_conjecture,
    ifeq(p20(X),true,ifeq(r1(sK67_main_Y(X2),X),true,ifeq(r1(sK86_main_Y,X2),true,p21(X),true),true),true) = true ).

cnf(main_130,negated_conjecture,
    ifeq(p22(Y),true,ifeq(r1(sK66_main_X(X),Y),true,ifeq(r1(sK86_main_Y,X),true,p21(Y),true),true),true) = true ).

cnf(main_131,negated_conjecture,
    ifeq(p21(Y),true,ifeq(r1(sK66_main_X(X),Y),true,ifeq(r1(sK86_main_Y,X),true,p22(Y),true),true),true) = true ).

cnf(main_132,negated_conjecture,
    ifeq(p23(X2),true,ifeq(r1(sK65_main_Y(X),X2),true,ifeq(r1(sK86_main_Y,X),true,p22(X2),true),true),true) = true ).

cnf(main_133,negated_conjecture,
    ifeq(p22(X),true,ifeq(r1(sK65_main_Y(X2),X),true,ifeq(r1(sK86_main_Y,X2),true,p23(X),true),true),true) = true ).

cnf(main_134,negated_conjecture,
    ifeq(p24(Y),true,ifeq(r1(sK64_main_X(X),Y),true,ifeq(r1(sK86_main_Y,X),true,p23(Y),true),true),true) = true ).

cnf(main_135,negated_conjecture,
    ifeq(p23(Y),true,ifeq(r1(sK64_main_X(X),Y),true,ifeq(r1(sK86_main_Y,X),true,p24(Y),true),true),true) = true ).

cnf(main_136,negated_conjecture,
    ifeq(p25(X2),true,ifeq(r1(sK63_main_Y(X),X2),true,ifeq(r1(sK86_main_Y,X),true,p24(X2),true),true),true) = true ).

cnf(main_137,negated_conjecture,
    ifeq(p24(X),true,ifeq(r1(sK63_main_Y(X2),X),true,ifeq(r1(sK86_main_Y,X2),true,p25(X),true),true),true) = true ).

cnf(main_138,negated_conjecture,
    ifeq(p26(Y),true,ifeq(r1(sK62_main_X(X),Y),true,ifeq(r1(sK86_main_Y,X),true,p25(Y),true),true),true) = true ).

cnf(main_139,negated_conjecture,
    ifeq(p25(Y),true,ifeq(r1(sK62_main_X(X),Y),true,ifeq(r1(sK86_main_Y,X),true,p26(Y),true),true),true) = true ).

cnf(main_140,negated_conjecture,
    ifeq(p27(X2),true,ifeq(r1(sK61_main_Y(X),X2),true,ifeq(r1(sK86_main_Y,X),true,p26(X2),true),true),true) = true ).

cnf(main_141,negated_conjecture,
    ifeq(p26(X),true,ifeq(r1(sK61_main_Y(X2),X),true,ifeq(r1(sK86_main_Y,X2),true,p27(X),true),true),true) = true ).

cnf(main_142,negated_conjecture,
    ifeq(p28(Y),true,ifeq(r1(sK60_main_X(X),Y),true,ifeq(r1(sK86_main_Y,X),true,p27(Y),true),true),true) = true ).

cnf(main_143,negated_conjecture,
    ifeq(p27(Y),true,ifeq(r1(sK60_main_X(X),Y),true,ifeq(r1(sK86_main_Y,X),true,p28(Y),true),true),true) = true ).

cnf(main_144,negated_conjecture,
    ifeq(p29(X2),true,ifeq(r1(sK59_main_Y(X),X2),true,ifeq(r1(sK86_main_Y,X),true,p28(X2),true),true),true) = true ).

cnf(main_145,negated_conjecture,
    ifeq(p28(X),true,ifeq(r1(sK59_main_Y(X2),X),true,ifeq(r1(sK86_main_Y,X2),true,p29(X),true),true),true) = true ).

cnf(main_146,negated_conjecture,
    ifeq(p30(Y),true,ifeq(r1(sK58_main_X(X),Y),true,ifeq(r1(sK86_main_Y,X),true,p29(Y),true),true),true) = true ).

cnf(main_147,negated_conjecture,
    ifeq(p29(Y),true,ifeq(r1(sK58_main_X(X),Y),true,ifeq(r1(sK86_main_Y,X),true,p30(Y),true),true),true) = true ).

cnf(main_148,negated_conjecture,
    ifeq(p31(X2),true,ifeq(r1(sK57_main_Y(X),X2),true,ifeq(r1(sK86_main_Y,X),true,p30(X2),true),true),true) = true ).

cnf(main_149,negated_conjecture,
    ifeq(p30(X),true,ifeq(r1(sK57_main_Y(X2),X),true,ifeq(r1(sK86_main_Y,X2),true,p31(X),true),true),true) = true ).

cnf(main_150,negated_conjecture,
    ifeq(p32(Y),true,ifeq(r1(sK56_main_X(X),Y),true,ifeq(r1(sK86_main_Y,X),true,p31(Y),true),true),true) = true ).

cnf(main_151,negated_conjecture,
    ifeq(p31(Y),true,ifeq(r1(sK56_main_X(X),Y),true,ifeq(r1(sK86_main_Y,X),true,p32(Y),true),true),true) = true ).

cnf(main_152,negated_conjecture,
    ifeq(p33(X2),true,ifeq(r1(sK55_main_Y(X),X2),true,ifeq(r1(sK86_main_Y,X),true,p32(X2),true),true),true) = true ).

cnf(main_153,negated_conjecture,
    ifeq(p32(X),true,ifeq(r1(sK55_main_Y(X2),X),true,ifeq(r1(sK86_main_Y,X2),true,p33(X),true),true),true) = true ).

cnf(main_154,negated_conjecture,
    ifeq(p34(Y),true,ifeq(r1(sK54_main_X(X),Y),true,ifeq(r1(sK86_main_Y,X),true,p33(Y),true),true),true) = true ).

cnf(main_155,negated_conjecture,
    ifeq(p33(Y),true,ifeq(r1(sK54_main_X(X),Y),true,ifeq(r1(sK86_main_Y,X),true,p34(Y),true),true),true) = true ).

cnf(main_156,negated_conjecture,
    ifeq(p35(X2),true,ifeq(r1(sK53_main_Y(X),X2),true,ifeq(r1(sK86_main_Y,X),true,p34(X2),true),true),true) = true ).

cnf(main_157,negated_conjecture,
    ifeq(p34(X),true,ifeq(r1(sK53_main_Y(X2),X),true,ifeq(r1(sK86_main_Y,X2),true,p35(X),true),true),true) = true ).

cnf(main_158,negated_conjecture,
    ifeq(p36(Y),true,ifeq(r1(sK52_main_X(X),Y),true,ifeq(r1(sK86_main_Y,X),true,p35(Y),true),true),true) = true ).

cnf(main_159,negated_conjecture,
    ifeq(p35(Y),true,ifeq(r1(sK52_main_X(X),Y),true,ifeq(r1(sK86_main_Y,X),true,p36(Y),true),true),true) = true ).

cnf(main_160,negated_conjecture,
    ifeq(p37(X2),true,ifeq(r1(sK51_main_Y(X),X2),true,ifeq(r1(sK86_main_Y,X),true,p36(X2),true),true),true) = true ).

cnf(main_161,negated_conjecture,
    ifeq(p36(X),true,ifeq(r1(sK51_main_Y(X2),X),true,ifeq(r1(sK86_main_Y,X2),true,p37(X),true),true),true) = true ).

cnf(main_162,negated_conjecture,
    ifeq(p38(Y),true,ifeq(r1(sK50_main_X(X),Y),true,ifeq(r1(sK86_main_Y,X),true,p37(Y),true),true),true) = true ).

cnf(main_163,negated_conjecture,
    ifeq(p37(Y),true,ifeq(r1(sK50_main_X(X),Y),true,ifeq(r1(sK86_main_Y,X),true,p38(Y),true),true),true) = true ).

cnf(main_164,negated_conjecture,
    ifeq(p39(X2),true,ifeq(r1(sK49_main_Y(X),X2),true,ifeq(r1(sK86_main_Y,X),true,p38(X2),true),true),true) = true ).

cnf(main_165,negated_conjecture,
    ifeq(p38(X),true,ifeq(r1(sK49_main_Y(X2),X),true,ifeq(r1(sK86_main_Y,X2),true,p39(X),true),true),true) = true ).

cnf(main_166,negated_conjecture,
    ifeq(p40(Y),true,ifeq(r1(sK48_main_X(X),Y),true,ifeq(r1(sK86_main_Y,X),true,p39(Y),true),true),true) = true ).

cnf(main_167,negated_conjecture,
    ifeq(p39(Y),true,ifeq(r1(sK48_main_X(X),Y),true,ifeq(r1(sK86_main_Y,X),true,p40(Y),true),true),true) = true ).

cnf(main_168,negated_conjecture,
    ifeq(p41(X2),true,ifeq(r1(sK47_main_Y(X),X2),true,ifeq(r1(sK86_main_Y,X),true,p40(X2),true),true),true) = true ).

cnf(main_169,negated_conjecture,
    ifeq(p40(X),true,ifeq(r1(sK47_main_Y(X2),X),true,ifeq(r1(sK86_main_Y,X2),true,p41(X),true),true),true) = true ).

cnf(main_170,negated_conjecture,
    ifeq(p42(Y),true,ifeq(r1(sK46_main_X(X),Y),true,ifeq(r1(sK86_main_Y,X),true,p41(Y),true),true),true) = true ).

cnf(main_171,negated_conjecture,
    ifeq(p41(Y),true,ifeq(r1(sK46_main_X(X),Y),true,ifeq(r1(sK86_main_Y,X),true,p42(Y),true),true),true) = true ).

cnf(main_172,negated_conjecture,
    ifeq(p43(X2),true,ifeq(r1(sK45_main_Y(X),X2),true,ifeq(r1(sK86_main_Y,X),true,p42(X2),true),true),true) = true ).

cnf(main_173,negated_conjecture,
    ifeq(p42(X),true,ifeq(r1(sK45_main_Y(X2),X),true,ifeq(r1(sK86_main_Y,X2),true,p43(X),true),true),true) = true ).

cnf(main_174,negated_conjecture,
    ifeq(p44(Y),true,ifeq(r1(sK44_main_X(X),Y),true,ifeq(r1(sK86_main_Y,X),true,p43(Y),true),true),true) = true ).

cnf(main_175,negated_conjecture,
    ifeq(p43(Y),true,ifeq(r1(sK44_main_X(X),Y),true,ifeq(r1(sK86_main_Y,X),true,p44(Y),true),true),true) = true ).

cnf(main_176,negated_conjecture,
    ifeq(p45(X2),true,ifeq(r1(sK43_main_Y(X),X2),true,ifeq(r1(sK86_main_Y,X),true,p44(X2),true),true),true) = true ).

cnf(main_177,negated_conjecture,
    ifeq(p44(X),true,ifeq(r1(sK43_main_Y(X2),X),true,ifeq(r1(sK86_main_Y,X2),true,p45(X),true),true),true) = true ).

cnf(main_178,negated_conjecture,
    ifeq(p46(Y),true,ifeq(r1(sK42_main_X(X),Y),true,ifeq(r1(sK86_main_Y,X),true,p45(Y),true),true),true) = true ).

cnf(main_179,negated_conjecture,
    ifeq(p45(Y),true,ifeq(r1(sK42_main_X(X),Y),true,ifeq(r1(sK86_main_Y,X),true,p46(Y),true),true),true) = true ).

cnf(main_180,negated_conjecture,
    ifeq(p47(X2),true,ifeq(r1(sK41_main_Y(X),X2),true,ifeq(r1(sK86_main_Y,X),true,p46(X2),true),true),true) = true ).

cnf(main_181,negated_conjecture,
    ifeq(p46(X),true,ifeq(r1(sK41_main_Y(X2),X),true,ifeq(r1(sK86_main_Y,X2),true,p47(X),true),true),true) = true ).

cnf(main_182,negated_conjecture,
    ifeq(p48(Y),true,ifeq(r1(sK40_main_X(X),Y),true,ifeq(r1(sK86_main_Y,X),true,p47(Y),true),true),true) = true ).

cnf(main_183,negated_conjecture,
    ifeq(p47(Y),true,ifeq(r1(sK40_main_X(X),Y),true,ifeq(r1(sK86_main_Y,X),true,p48(Y),true),true),true) = true ).

cnf(main_184,negated_conjecture,
    ifeq(p49(X2),true,ifeq(r1(sK39_main_Y(X),X2),true,ifeq(r1(sK86_main_Y,X),true,p48(X2),true),true),true) = true ).

cnf(main_185,negated_conjecture,
    ifeq(p48(X),true,ifeq(r1(sK39_main_Y(X2),X),true,ifeq(r1(sK86_main_Y,X2),true,p49(X),true),true),true) = true ).

cnf(main_186,negated_conjecture,
    ifeq(p50(Y),true,ifeq(r1(sK38_main_X(X),Y),true,ifeq(r1(sK86_main_Y,X),true,p49(Y),true),true),true) = true ).

cnf(main_187,negated_conjecture,
    ifeq(p49(Y),true,ifeq(r1(sK38_main_X(X),Y),true,ifeq(r1(sK86_main_Y,X),true,p50(Y),true),true),true) = true ).

cnf(main_188,negated_conjecture,
    ifeq(p51(X2),true,ifeq(r1(sK37_main_Y(X),X2),true,ifeq(r1(sK86_main_Y,X),true,p50(X2),true),true),true) = true ).

cnf(main_189,negated_conjecture,
    ifeq(p50(X),true,ifeq(r1(sK37_main_Y(X2),X),true,ifeq(r1(sK86_main_Y,X2),true,p51(X),true),true),true) = true ).

cnf(main_190,negated_conjecture,
    ifeq(p52(Y),true,ifeq(r1(sK36_main_X(X),Y),true,ifeq(r1(sK86_main_Y,X),true,p51(Y),true),true),true) = true ).

cnf(main_191,negated_conjecture,
    ifeq(p51(Y),true,ifeq(r1(sK36_main_X(X),Y),true,ifeq(r1(sK86_main_Y,X),true,p52(Y),true),true),true) = true ).

cnf(main_192,negated_conjecture,
    ifeq(p53(X2),true,ifeq(r1(sK35_main_Y(X),X2),true,ifeq(r1(sK86_main_Y,X),true,p52(X2),true),true),true) = true ).

cnf(main_193,negated_conjecture,
    ifeq(p52(X),true,ifeq(r1(sK35_main_Y(X2),X),true,ifeq(r1(sK86_main_Y,X2),true,p53(X),true),true),true) = true ).

cnf(main_194,negated_conjecture,
    ifeq(p54(Y),true,ifeq(r1(sK34_main_X(X),Y),true,ifeq(r1(sK86_main_Y,X),true,p53(Y),true),true),true) = true ).

cnf(main_195,negated_conjecture,
    ifeq(p53(Y),true,ifeq(r1(sK34_main_X(X),Y),true,ifeq(r1(sK86_main_Y,X),true,p54(Y),true),true),true) = true ).

cnf(main_196,negated_conjecture,
    ifeq(p55(X2),true,ifeq(r1(sK33_main_Y(X),X2),true,ifeq(r1(sK86_main_Y,X),true,p54(X2),true),true),true) = true ).

cnf(main_197,negated_conjecture,
    ifeq(p54(X),true,ifeq(r1(sK33_main_Y(X2),X),true,ifeq(r1(sK86_main_Y,X2),true,p55(X),true),true),true) = true ).

cnf(main_198,negated_conjecture,
    ifeq(p56(Y),true,ifeq(r1(sK32_main_X(X),Y),true,ifeq(r1(sK86_main_Y,X),true,p55(Y),true),true),true) = true ).

cnf(main_199,negated_conjecture,
    ifeq(p55(Y),true,ifeq(r1(sK32_main_X(X),Y),true,ifeq(r1(sK86_main_Y,X),true,p56(Y),true),true),true) = true ).

cnf(main_200,negated_conjecture,
    ifeq(p57(X2),true,ifeq(r1(sK31_main_Y(X),X2),true,ifeq(r1(sK86_main_Y,X),true,p56(X2),true),true),true) = true ).

cnf(main_201,negated_conjecture,
    ifeq(p56(X),true,ifeq(r1(sK31_main_Y(X2),X),true,ifeq(r1(sK86_main_Y,X2),true,p57(X),true),true),true) = true ).

cnf(main_202,negated_conjecture,
    ifeq(p58(Y),true,ifeq(r1(sK30_main_X(X),Y),true,ifeq(r1(sK86_main_Y,X),true,p57(Y),true),true),true) = true ).

cnf(main_203,negated_conjecture,
    ifeq(p57(Y),true,ifeq(r1(sK30_main_X(X),Y),true,ifeq(r1(sK86_main_Y,X),true,p58(Y),true),true),true) = true ).

cnf(main_204,negated_conjecture,
    ifeq(p59(X2),true,ifeq(r1(sK29_main_Y(X),X2),true,ifeq(r1(sK86_main_Y,X),true,p58(X2),true),true),true) = true ).

cnf(main_205,negated_conjecture,
    ifeq(p58(X),true,ifeq(r1(sK29_main_Y(X2),X),true,ifeq(r1(sK86_main_Y,X2),true,p59(X),true),true),true) = true ).

cnf(main_206,negated_conjecture,
    ifeq(p60(Y),true,ifeq(r1(sK28_main_X(X),Y),true,ifeq(r1(sK86_main_Y,X),true,p59(Y),true),true),true) = true ).

cnf(main_207,negated_conjecture,
    ifeq(p59(Y),true,ifeq(r1(sK28_main_X(X),Y),true,ifeq(r1(sK86_main_Y,X),true,p60(Y),true),true),true) = true ).

cnf(main_208,negated_conjecture,
    ifeq(p61(X2),true,ifeq(r1(sK27_main_Y(X),X2),true,ifeq(r1(sK86_main_Y,X),true,p60(X2),true),true),true) = true ).

cnf(main_209,negated_conjecture,
    ifeq(p60(X),true,ifeq(r1(sK27_main_Y(X2),X),true,ifeq(r1(sK86_main_Y,X2),true,p61(X),true),true),true) = true ).

cnf(main_210,negated_conjecture,
    ifeq(p62(Y),true,ifeq(r1(sK26_main_X(X),Y),true,ifeq(r1(sK86_main_Y,X),true,p61(Y),true),true),true) = true ).

cnf(main_211,negated_conjecture,
    ifeq(p61(Y),true,ifeq(r1(sK26_main_X(X),Y),true,ifeq(r1(sK86_main_Y,X),true,p62(Y),true),true),true) = true ).

cnf(main_212,negated_conjecture,
    ifeq(p63(X2),true,ifeq(r1(sK25_main_Y(X),X2),true,ifeq(r1(sK86_main_Y,X),true,p62(X2),true),true),true) = true ).

cnf(main_213,negated_conjecture,
    ifeq(p62(X),true,ifeq(r1(sK25_main_Y(X2),X),true,ifeq(r1(sK86_main_Y,X2),true,p63(X),true),true),true) = true ).

cnf(main_214,negated_conjecture,
    ifeq(p64(Y),true,ifeq(r1(sK24_main_X(X),Y),true,ifeq(r1(sK86_main_Y,X),true,p63(Y),true),true),true) = true ).

cnf(main_215,negated_conjecture,
    ifeq(p63(Y),true,ifeq(r1(sK24_main_X(X),Y),true,ifeq(r1(sK86_main_Y,X),true,p64(Y),true),true),true) = true ).

cnf(main_216,negated_conjecture,
    ifeq(p65(X2),true,ifeq(r1(sK23_main_Y(X),X2),true,ifeq(r1(sK86_main_Y,X),true,p64(X2),true),true),true) = true ).

cnf(main_217,negated_conjecture,
    ifeq(p64(X),true,ifeq(r1(sK23_main_Y(X2),X),true,ifeq(r1(sK86_main_Y,X2),true,p65(X),true),true),true) = true ).

cnf(main_218,negated_conjecture,
    ifeq(p66(Y),true,ifeq(r1(sK22_main_X(X),Y),true,ifeq(r1(sK86_main_Y,X),true,p65(Y),true),true),true) = true ).

cnf(main_219,negated_conjecture,
    ifeq(p65(Y),true,ifeq(r1(sK22_main_X(X),Y),true,ifeq(r1(sK86_main_Y,X),true,p66(Y),true),true),true) = true ).

cnf(main_220,negated_conjecture,
    ifeq(p67(X2),true,ifeq(r1(sK21_main_Y(X),X2),true,ifeq(r1(sK86_main_Y,X),true,p66(X2),true),true),true) = true ).

cnf(main_221,negated_conjecture,
    ifeq(p66(X),true,ifeq(r1(sK21_main_Y(X2),X),true,ifeq(r1(sK86_main_Y,X2),true,p67(X),true),true),true) = true ).

cnf(main_222,negated_conjecture,
    ifeq(p68(Y),true,ifeq(r1(sK20_main_X(X),Y),true,ifeq(r1(sK86_main_Y,X),true,p67(Y),true),true),true) = true ).

cnf(main_223,negated_conjecture,
    ifeq(p67(Y),true,ifeq(r1(sK20_main_X(X),Y),true,ifeq(r1(sK86_main_Y,X),true,p68(Y),true),true),true) = true ).

cnf(main_224,negated_conjecture,
    ifeq(p69(X2),true,ifeq(r1(sK19_main_Y(X),X2),true,ifeq(r1(sK86_main_Y,X),true,p68(X2),true),true),true) = true ).

cnf(main_225,negated_conjecture,
    ifeq(p68(X),true,ifeq(r1(sK19_main_Y(X2),X),true,ifeq(r1(sK86_main_Y,X2),true,p69(X),true),true),true) = true ).

cnf(main_226,negated_conjecture,
    ifeq(p70(Y),true,ifeq(r1(sK18_main_X(X),Y),true,ifeq(r1(sK86_main_Y,X),true,p69(Y),true),true),true) = true ).

cnf(main_227,negated_conjecture,
    ifeq(p69(Y),true,ifeq(r1(sK18_main_X(X),Y),true,ifeq(r1(sK86_main_Y,X),true,p70(Y),true),true),true) = true ).

cnf(main_228,negated_conjecture,
    ifeq(p71(X2),true,ifeq(r1(sK17_main_Y(X),X2),true,ifeq(r1(sK86_main_Y,X),true,p70(X2),true),true),true) = true ).

cnf(main_229,negated_conjecture,
    ifeq(p70(X),true,ifeq(r1(sK17_main_Y(X2),X),true,ifeq(r1(sK86_main_Y,X2),true,p71(X),true),true),true) = true ).

cnf(main_230,negated_conjecture,
    ifeq(p72(Y),true,ifeq(r1(sK16_main_X(X),Y),true,ifeq(r1(sK86_main_Y,X),true,p71(Y),true),true),true) = true ).

cnf(main_231,negated_conjecture,
    ifeq(p71(Y),true,ifeq(r1(sK16_main_X(X),Y),true,ifeq(r1(sK86_main_Y,X),true,p72(Y),true),true),true) = true ).

cnf(main_232,negated_conjecture,
    ifeq(p73(X2),true,ifeq(r1(sK15_main_Y(X),X2),true,ifeq(r1(sK86_main_Y,X),true,p72(X2),true),true),true) = true ).

cnf(main_233,negated_conjecture,
    ifeq(p72(X),true,ifeq(r1(sK15_main_Y(X2),X),true,ifeq(r1(sK86_main_Y,X2),true,p73(X),true),true),true) = true ).

cnf(main_234,negated_conjecture,
    ifeq(p74(Y),true,ifeq(r1(sK14_main_X(X),Y),true,ifeq(r1(sK86_main_Y,X),true,p73(Y),true),true),true) = true ).

cnf(main_235,negated_conjecture,
    ifeq(p73(Y),true,ifeq(r1(sK14_main_X(X),Y),true,ifeq(r1(sK86_main_Y,X),true,p74(Y),true),true),true) = true ).

cnf(main_236,negated_conjecture,
    ifeq(p75(X2),true,ifeq(r1(sK13_main_Y(X),X2),true,ifeq(r1(sK86_main_Y,X),true,p74(X2),true),true),true) = true ).

cnf(main_237,negated_conjecture,
    ifeq(p74(X),true,ifeq(r1(sK13_main_Y(X2),X),true,ifeq(r1(sK86_main_Y,X2),true,p75(X),true),true),true) = true ).

cnf(main_238,negated_conjecture,
    ifeq(p76(Y),true,ifeq(r1(sK12_main_X(X),Y),true,ifeq(r1(sK86_main_Y,X),true,p75(Y),true),true),true) = true ).

cnf(main_239,negated_conjecture,
    ifeq(p75(Y),true,ifeq(r1(sK12_main_X(X),Y),true,ifeq(r1(sK86_main_Y,X),true,p76(Y),true),true),true) = true ).

cnf(main_240,negated_conjecture,
    ifeq(p77(X2),true,ifeq(r1(sK11_main_Y(X),X2),true,ifeq(r1(sK86_main_Y,X),true,p76(X2),true),true),true) = true ).

cnf(main_241,negated_conjecture,
    ifeq(p76(X),true,ifeq(r1(sK11_main_Y(X2),X),true,ifeq(r1(sK86_main_Y,X2),true,p77(X),true),true),true) = true ).

cnf(main_242,negated_conjecture,
    ifeq(p78(Y),true,ifeq(r1(sK10_main_X(X),Y),true,ifeq(r1(sK86_main_Y,X),true,p77(Y),true),true),true) = true ).

cnf(main_243,negated_conjecture,
    ifeq(p77(Y),true,ifeq(r1(sK10_main_X(X),Y),true,ifeq(r1(sK86_main_Y,X),true,p78(Y),true),true),true) = true ).

cnf(main_244,negated_conjecture,
    ifeq(p79(X2),true,ifeq(r1(sK9_main_Y(X),X2),true,ifeq(r1(sK86_main_Y,X),true,p78(X2),true),true),true) = true ).

cnf(main_245,negated_conjecture,
    ifeq(p78(X),true,ifeq(r1(sK9_main_Y(X2),X),true,ifeq(r1(sK86_main_Y,X2),true,p79(X),true),true),true) = true ).

cnf(main_246,negated_conjecture,
    ifeq(p80(Y),true,ifeq(r1(sK8_main_X(X),Y),true,ifeq(r1(sK86_main_Y,X),true,p79(Y),true),true),true) = true ).

cnf(main_247,negated_conjecture,
    ifeq(p79(Y),true,ifeq(r1(sK8_main_X(X),Y),true,ifeq(r1(sK86_main_Y,X),true,p80(Y),true),true),true) = true ).

cnf(main_248,negated_conjecture,
    ifeq(p81(X2),true,ifeq(r1(sK7_main_Y(X),X2),true,ifeq(r1(sK86_main_Y,X),true,p80(X2),true),true),true) = true ).

cnf(main_249,negated_conjecture,
    ifeq(p80(X),true,ifeq(r1(sK7_main_Y(X2),X),true,ifeq(r1(sK86_main_Y,X2),true,p81(X),true),true),true) = true ).

cnf(main_250,negated_conjecture,
    ifeq(p82(Y),true,ifeq(r1(sK6_main_X(X),Y),true,ifeq(r1(sK86_main_Y,X),true,p81(Y),true),true),true) = true ).

cnf(main_251,negated_conjecture,
    ifeq(p81(Y),true,ifeq(r1(sK6_main_X(X),Y),true,ifeq(r1(sK86_main_Y,X),true,p82(Y),true),true),true) = true ).

cnf(main_252,negated_conjecture,
    ifeq(p83(X2),true,ifeq(r1(sK5_main_Y(X),X2),true,ifeq(r1(sK86_main_Y,X),true,p82(X2),true),true),true) = true ).

cnf(main_253,negated_conjecture,
    ifeq(p82(X),true,ifeq(r1(sK5_main_Y(X2),X),true,ifeq(r1(sK86_main_Y,X2),true,p83(X),true),true),true) = true ).

cnf(main_254,negated_conjecture,
    ifeq(p84(Y),true,ifeq(r1(sK4_main_X(X),Y),true,ifeq(r1(sK86_main_Y,X),true,p83(Y),true),true),true) = true ).

cnf(main_255,negated_conjecture,
    ifeq(p83(Y),true,ifeq(r1(sK4_main_X(X),Y),true,ifeq(r1(sK86_main_Y,X),true,p84(Y),true),true),true) = true ).

cnf(main_256,negated_conjecture,
    ifeq(p85(X2),true,ifeq(r1(sK3_main_Y(X),X2),true,ifeq(r1(sK86_main_Y,X),true,p84(X2),true),true),true) = true ).

cnf(main_257,negated_conjecture,
    ifeq(p84(X),true,ifeq(r1(sK3_main_Y(X2),X),true,ifeq(r1(sK86_main_Y,X2),true,p85(X),true),true),true) = true ).

cnf(main_258,negated_conjecture,
    tuple(r1(sK86_main_Y,X),p90(sK1_main_Y(X))) != tuple(true,true) ).

%------------------------------------------------------------------------------
