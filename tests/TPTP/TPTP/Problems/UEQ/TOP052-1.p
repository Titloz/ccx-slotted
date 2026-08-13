%------------------------------------------------------------------------------
% File     : TOP052-1 : TPTP v9.0.0. Released v8.1.0.
% Domain   : Topology (Kfnot theory)
% Problem  : Haken unkfnot
% Version  : [FL14] axioms.
% English  :

% Refs     : [FL14]  Fish & Lisitsa (2014), Detecting Unkfnots via Equationa
%          : [Sma21] Smallbone (2021), Email to Geoff Sutcliffe
% Source   : [Sma21]
% Names    : haken.p [WM89]

% Status   : Unsatisfiable
% Rating   : 0.64 v9.0.0, 0.59 v8.2.0, 0.67 v8.1.0
% Syntax   : Number of clauses     :  145 ( 145 unt;   0 nHn; 142 RR)
%            Number of literals    :  145 ( 145 equ;   1 neg)
%            Maximal clause size   :    1 (   1 avg)
%            Maximal term depth    :    3 (   1 avg)
%            Number of predicates  :    1 (   0 usr;   0 prp; 2-2 aty)
%            Number of functors    :  143 ( 143 usr; 141 con; 0-140 aty)
%            Number of variables   :    6 (   0 sgn)
% SPC      : CNF_UNS_RFO_PEQ_UEQ

% Comments : See https://cgi.csc.liv.ac.uk/~alexei/Unkfnot/
%------------------------------------------------------------------------------
cnf(involutory_quandle,axiom,
    product(X,X) = X ).

cnf(involutory_quandle_01,axiom,
    product(product(X,Y),Y) = X ).

cnf(involutory_quandle_02,axiom,
    product(product(X,Y),Z) = product(product(X,Z),product(Y,Z)) ).

cnf(kfnot,axiom,
    a2 = product(a1,a42) ).

cnf(kfnot_03,axiom,
    a3 = product(a2,a41) ).

cnf(kfnot_04,axiom,
    a4 = product(a3,a14) ).

cnf(kfnot_05,axiom,
    a5 = product(a4,a39) ).

cnf(kfnot_06,axiom,
    a6 = product(a5,a136) ).

cnf(kfnot_07,axiom,
    a7 = product(a6,a52) ).

cnf(kfnot_08,axiom,
    a8 = product(a7,a17) ).

cnf(kfnot_09,axiom,
    a9 = product(a8,a56) ).

cnf(kfnot_10,axiom,
    a10 = product(a9,a134) ).

cnf(kfnot_11,axiom,
    a11 = product(a10,a37) ).

cnf(kfnot_12,axiom,
    a12 = product(a11,a21) ).

cnf(kfnot_13,axiom,
    a13 = product(a12,a23) ).

cnf(kfnot_14,axiom,
    a14 = product(a13,a32) ).

cnf(kfnot_15,axiom,
    a15 = product(a14,a53) ).

cnf(kfnot_16,axiom,
    a16 = product(a15,a136) ).

cnf(kfnot_17,axiom,
    a17 = product(a16,a29) ).

cnf(kfnot_18,axiom,
    a18 = product(a17,a133) ).

cnf(kfnot_19,axiom,
    a19 = product(a18,a58) ).

cnf(kfnot_20,axiom,
    a20 = product(a19,a26) ).

cnf(kfnot_21,axiom,
    a21 = product(a20,a35) ).

cnf(kfnot_22,axiom,
    a22 = product(a21,a141) ).

cnf(kfnot_23,axiom,
    a23 = product(a22,a45) ).

cnf(kfnot_24,axiom,
    a24 = product(a23,a35) ).

cnf(kfnot_25,axiom,
    a25 = product(a24,a49) ).

cnf(kfnot_26,axiom,
    a26 = product(a25,a138) ).

cnf(kfnot_27,axiom,
    a27 = product(a26,a8) ).

cnf(kfnot_28,axiom,
    a28 = product(a27,a37) ).

cnf(kfnot_29,axiom,
    a29 = product(a28,a17) ).

cnf(kfnot_30,axiom,
    a30 = product(a29,a14) ).

cnf(kfnot_31,axiom,
    a31 = product(a30,a5) ).

cnf(kfnot_32,axiom,
    a32 = product(a31,a39) ).

cnf(kfnot_33,axiom,
    a33 = product(a32,a13) ).

cnf(kfnot_34,axiom,
    a34 = product(a33,a131) ).

cnf(kfnot_35,axiom,
    a35 = product(a34,a60) ).

cnf(kfnot_36,axiom,
    a36 = product(a35,a139) ).

cnf(kfnot_37,axiom,
    a37 = product(a36,a47) ).

cnf(kfnot_38,axiom,
    a38 = product(a37,a17) ).

cnf(kfnot_39,axiom,
    a39 = product(a38,a7) ).

cnf(kfnot_40,axiom,
    a40 = product(a39,a4) ).

cnf(kfnot_41,axiom,
    a41 = product(a40,a14) ).

cnf(kfnot_42,axiom,
    a42 = product(a41,a2) ).

cnf(kfnot_43,axiom,
    a43 = product(a42,a62) ).

cnf(kfnot_44,axiom,
    a44 = product(a43,a128) ).

cnf(kfnot_45,axiom,
    a45 = product(a44,a23) ).

cnf(kfnot_46,axiom,
    a46 = product(a45,a141) ).

cnf(kfnot_47,axiom,
    a47 = product(a46,a11) ).

cnf(kfnot_48,axiom,
    a48 = product(a47,a20) ).

cnf(kfnot_49,axiom,
    a49 = product(a48,a138) ).

cnf(kfnot_50,axiom,
    a50 = product(a49,a131) ).

cnf(kfnot_51,axiom,
    a51 = product(a50,a59) ).

cnf(kfnot_52,axiom,
    a52 = product(a51,a39) ).

cnf(kfnot_53,axiom,
    a53 = product(a52,a136) ).

cnf(kfnot_54,axiom,
    a54 = product(a53,a29) ).

cnf(kfnot_55,axiom,
    a55 = product(a54,a135) ).

cnf(kfnot_56,axiom,
    a56 = product(a55,a37) ).

cnf(kfnot_57,axiom,
    a57 = product(a56,a134) ).

cnf(kfnot_58,axiom,
    a58 = product(a57,a26) ).

cnf(kfnot_59,axiom,
    a59 = product(a58,a138) ).

cnf(kfnot_60,axiom,
    a60 = product(a59,a131) ).

cnf(kfnot_61,axiom,
    a61 = product(a60,a13) ).

cnf(kfnot_62,axiom,
    a62 = product(a61,a1) ).

cnf(kfnot_63,axiom,
    a63 = product(a62,a96) ).

cnf(kfnot_64,axiom,
    a64 = product(a63,a127) ).

cnf(kfnot_65,axiom,
    a65 = product(a64,a41) ).

cnf(kfnot_66,axiom,
    a66 = product(a65,a2) ).

cnf(kfnot_67,axiom,
    a67 = product(a66,a92) ).

cnf(kfnot_68,axiom,
    a68 = product(a67,a98) ).

cnf(kfnot_69,axiom,
    a69 = product(a68,a32) ).

cnf(kfnot_70,axiom,
    a70 = product(a69,a13) ).

cnf(kfnot_71,axiom,
    a71 = product(a70,a118) ).

cnf(kfnot_72,axiom,
    a72 = product(a71,a109) ).

cnf(kfnot_73,axiom,
    a73 = product(a72,a82) ).

cnf(kfnot_74,axiom,
    a74 = product(a73,a32) ).

cnf(kfnot_75,axiom,
    a75 = product(a74,a14) ).

cnf(kfnot_76,axiom,
    a76 = product(a75,a68) ).

cnf(kfnot_77,axiom,
    a77 = product(a76,a114) ).

cnf(kfnot_78,axiom,
    a78 = product(a77,a13) ).

cnf(kfnot_79,axiom,
    a79 = product(a78,a33) ).

cnf(kfnot_80,axiom,
    a80 = product(a79,a119) ).

cnf(kfnot_81,axiom,
    a81 = product(a80,a70) ).

cnf(kfnot_82,axiom,
    a82 = product(a81,a109) ).

cnf(kfnot_83,axiom,
    a83 = product(a82,a118) ).

cnf(kfnot_84,axiom,
    a84 = product(a83,a39) ).

cnf(kfnot_85,axiom,
    a85 = product(a84,a5) ).

cnf(kfnot_86,axiom,
    a86 = product(a85,a30) ).

cnf(kfnot_87,axiom,
    a87 = product(a86,a104) ).

cnf(kfnot_88,axiom,
    a88 = product(a87,a4) ).

cnf(kfnot_89,axiom,
    a89 = product(a88,a14) ).

cnf(kfnot_90,axiom,
    a90 = product(a89,a41) ).

cnf(kfnot_91,axiom,
    a91 = product(a90,a100) ).

cnf(kfnot_92,axiom,
    a92 = product(a91,a124) ).

cnf(kfnot_93,axiom,
    a93 = product(a92,a2) ).

cnf(kfnot_94,axiom,
    a94 = product(a93,a41) ).

cnf(kfnot_95,axiom,
    a95 = product(a94,a127) ).

cnf(kfnot_96,axiom,
    a96 = product(a95,a64) ).

cnf(kfnot_97,axiom,
    a97 = product(a96,a42) ).

cnf(kfnot_98,axiom,
    a98 = product(a97,a1) ).

cnf(kfnot_99,axiom,
    a99 = product(a98,a92) ).

cnf(kfnot_100,axiom,
    a100 = product(a99,a124) ).

cnf(kfnot_101,axiom,
    a101 = product(a100,a14) ).

cnf(kfnot_102,axiom,
    a102 = product(a101,a40) ).

cnf(kfnot_103,axiom,
    a103 = product(a102,a4) ).

cnf(kfnot_104,axiom,
    a104 = product(a103,a87) ).

cnf(kfnot_105,axiom,
    a105 = product(a104,a30) ).

cnf(kfnot_106,axiom,
    a106 = product(a105,a5) ).

cnf(kfnot_107,axiom,
    a107 = product(a106,a84) ).

cnf(kfnot_108,axiom,
    a108 = product(a107,a39) ).

cnf(kfnot_109,axiom,
    a109 = product(a108,a118) ).

cnf(kfnot_110,axiom,
    a110 = product(a109,a70) ).

cnf(kfnot_111,axiom,
    a111 = product(a110,a119) ).

cnf(kfnot_112,axiom,
    a112 = product(a111,a79) ).

cnf(kfnot_113,axiom,
    a113 = product(a112,a33) ).

cnf(kfnot_114,axiom,
    a114 = product(a113,a13) ).

cnf(kfnot_115,axiom,
    a115 = product(a114,a68) ).

cnf(kfnot_116,axiom,
    a116 = product(a115,a14) ).

cnf(kfnot_117,axiom,
    a117 = product(a116,a74) ).

cnf(kfnot_118,axiom,
    a118 = product(a117,a32) ).

cnf(kfnot_119,axiom,
    a119 = product(a118,a70) ).

cnf(kfnot_120,axiom,
    a120 = product(a119,a13) ).

cnf(kfnot_121,axiom,
    a121 = product(a120,a32) ).

cnf(kfnot_122,axiom,
    a122 = product(a121,a68) ).

cnf(kfnot_123,axiom,
    a123 = product(a122,a115) ).

cnf(kfnot_124,axiom,
    a124 = product(a123,a75) ).

cnf(kfnot_125,axiom,
    a125 = product(a124,a2) ).

cnf(kfnot_126,axiom,
    a126 = product(a125,a65) ).

cnf(kfnot_127,axiom,
    a127 = product(a126,a41) ).

cnf(kfnot_128,axiom,
    a128 = product(a127,a96) ).

cnf(kfnot_129,axiom,
    a129 = product(a128,a62) ).

cnf(kfnot_130,axiom,
    a130 = product(a129,a1) ).

cnf(kfnot_131,axiom,
    a131 = product(a130,a13) ).

cnf(kfnot_132,axiom,
    a132 = product(a131,a138) ).

cnf(kfnot_133,axiom,
    a133 = product(a132,a58) ).

cnf(kfnot_134,axiom,
    a134 = product(a133,a26) ).

cnf(kfnot_135,axiom,
    a135 = product(a134,a37) ).

cnf(kfnot_136,axiom,
    a136 = product(a135,a29) ).

cnf(kfnot_137,axiom,
    a137 = product(a136,a39) ).

cnf(kfnot_138,axiom,
    a138 = product(a137,a51) ).

cnf(kfnot_139,axiom,
    a139 = product(a138,a20) ).

cnf(kfnot_140,axiom,
    a140 = product(a139,a47) ).

cnf(kfnot_141,axiom,
    a141 = product(a140,a11) ).

cnf(kfnot_142,axiom,
    a1 = product(a141,a23) ).

cnf(goal,negated_conjecture,
    tuple(a1,a2,a41,a42,a3,a40,a4,a13,a14,a5,a38,a39,a6,a135,a136,a7,a52,a51,a8,a16,a17,a9,a55,a56,a10,a133,a134,a11,a36,a37,a12,a21,a20,a23,a31,a32,a15,a53,a28,a29,a18,a132,a19,a58,a57,a20,a25,a26,a34,a35,a140,a44,a45,a24,a48,a49,a138,a137,a27,a30,a33,a130,a131,a59,a60,a139,a46,a47,a43,a61,a62,a127,a128,a50,a54,a63,a95,a96,a64,a126,a65,a66,a67,a91,a92,a68,a97,a98,a69,a70,a71,a118,a117,a72,a108,a109,a73,a81,a82,a74,a75,a76,a77,a113,a114,a78,a79,a80,a119,a83,a84,a85,a86,a87,a103,a104,a88,a89,a90,a99,a100,a123,a124,a93,a94,a101,a102,a105,a106,a107,a110,a111,a112,a115,a116,a120,a121,a122,a125,a129) != tuple(a2,a3,a42,a43,a4,a41,a5,a14,a15,a6,a39,a40,a7,a136,a137,a8,a53,a52,a9,a17,a18,a10,a56,a57,a11,a134,a135,a12,a37,a38,a13,a23,a21,a24,a32,a33,a16,a54,a29,a30,a19,a133,a20,a59,a58,a22,a26,a27,a35,a36,a141,a45,a46,a25,a49,a50,a139,a138,a28,a31,a34,a131,a132,a60,a61,a140,a47,a48,a44,a62,a63,a128,a129,a51,a55,a64,a96,a97,a65,a127,a66,a67,a68,a92,a93,a69,a98,a99,a70,a71,a72,a119,a118,a73,a109,a110,a74,a82,a83,a75,a76,a77,a78,a114,a115,a79,a80,a81,a120,a84,a85,a86,a87,a88,a104,a105,a89,a90,a91,a100,a101,a124,a125,a94,a95,a102,a103,a106,a107,a108,a111,a112,a113,a116,a117,a121,a122,a123,a126,a130) ).

%------------------------------------------------------------------------------
