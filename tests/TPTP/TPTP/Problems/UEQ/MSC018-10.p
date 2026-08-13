%------------------------------------------------------------------------------
% File     : MSC018-10 : TPTP v9.0.0. Released v7.5.0.
% Domain   : Puzzles
% Problem  : Problem from an encoding of geography of the USA
% Version  : Especial.
% English  :

% Refs     : [CS18]  Claessen & Smallbone (2018), Efficient Encodings of Fi
%          : [Sma18] Smallbone (2018), Email to Geoff Sutcliffe
% Source   : [Sma18]
% Names    :

% Status   : Satisfiable
% Rating   : 0.43 v9.0.0, 0.22 v8.2.0, 0.00 v7.5.0
% Syntax   : Number of clauses     :  603 ( 603 unt;   0 nHn; 601 RR)
%            Number of literals    :  603 ( 603 equ;   1 neg)
%            Maximal clause size   :    1 (   1 avg)
%            Maximal term depth    :    4 (   1 avg)
%            Number of predicates  :    1 (   0 usr;   0 prp; 2-2 aty)
%            Number of functors    :  284 ( 284 usr; 281 con; 0-4 aty)
%            Number of variables   :    6 (   1 sgn)
% SPC      : CNF_SAT_RFO_PEQ_UEQ

% Comments : Converted from MSC018+1 to UEQ using [CS18].
%------------------------------------------------------------------------------
cnf(ifeq_axiom,axiom,
    ifeq(A,A,B,C) = B ).

cnf(kb0,axiom,
    s_contains(s_g001,s_g002) = true ).

cnf(kb1,axiom,
    s_contains(s_g001,s_g009) = true ).

cnf(kb2,axiom,
    s_contains(s_g001,s_g019) = true ).

cnf(kb3,axiom,
    s_contains(s_g001,s_g142) = true ).

cnf(kb4,axiom,
    s_contains(s_g001,s_g150) = true ).

cnf(kb5,axiom,
    s_partOf(s_g002,s_g001) = true ).

cnf(kb6,axiom,
    s_contains(s_g002,s_g011) = true ).

cnf(kb7,axiom,
    s_contains(s_g002,s_g014) = true ).

cnf(kb8,axiom,
    s_contains(s_g002,s_g015) = true ).

cnf(kb9,axiom,
    s_contains(s_g002,s_g017) = true ).

cnf(kb10,axiom,
    s_contains(s_g002,s_g018) = true ).

cnf(kb11,axiom,
    s_partOf(s_g009,s_g001) = true ).

cnf(kb12,axiom,
    s_contains(s_g009,s_g053) = true ).

cnf(kb13,axiom,
    s_contains(s_g009,s_g054) = true ).

cnf(kb14,axiom,
    s_contains(s_g009,s_g057) = true ).

cnf(kb15,axiom,
    s_contains(s_g009,s_g061) = true ).

cnf(kb16,axiom,
    s_partOf(s_g019,s_g001) = true ).

cnf(kb17,axiom,
    s_contains(s_g019,s_g005) = true ).

cnf(kb18,axiom,
    s_contains(s_g019,s_g013) = true ).

cnf(kb19,axiom,
    s_contains(s_g019,s_g021) = true ).

cnf(kb20,axiom,
    s_contains(s_g019,s_g029) = true ).

cnf(kb21,axiom,
    s_contains(s_g019,s_g003) = true ).

cnf(kb22,axiom,
    s_contains(s_g019,s_g419) = true ).

cnf(kb23,axiom,
    s_partOf(s_g142,s_g001) = true ).

cnf(kb24,axiom,
    s_contains(s_g142,s_g030) = true ).

cnf(kb25,axiom,
    s_contains(s_g142,s_g035) = true ).

cnf(kb26,axiom,
    s_contains(s_g142,s_g143) = true ).

cnf(kb27,axiom,
    s_contains(s_g142,s_g145) = true ).

cnf(kb28,axiom,
    s_contains(s_g142,s_g034) = true ).

cnf(kb29,axiom,
    s_contains(s_g142,s_g062) = true ).

cnf(kb30,axiom,
    s_partOf(s_g150,s_g001) = true ).

cnf(kb31,axiom,
    s_contains(s_g150,s_g039) = true ).

cnf(kb32,axiom,
    s_contains(s_g150,s_g151) = true ).

cnf(kb33,axiom,
    s_contains(s_g150,s_g154) = true ).

cnf(kb34,axiom,
    s_contains(s_g150,s_g155) = true ).

cnf(kb35,axiom,
    s_contains(s_g011,s_BF) = true ).

cnf(kb36,axiom,
    s_contains(s_g011,s_BJ) = true ).

cnf(kb37,axiom,
    s_contains(s_g011,s_CI) = true ).

cnf(kb38,axiom,
    s_contains(s_g011,s_CV) = true ).

cnf(kb39,axiom,
    s_contains(s_g011,s_GH) = true ).

cnf(kb40,axiom,
    s_contains(s_g011,s_GM) = true ).

cnf(kb41,axiom,
    s_contains(s_g011,s_GN) = true ).

cnf(kb42,axiom,
    s_contains(s_g011,s_GW) = true ).

cnf(kb43,axiom,
    s_contains(s_g011,s_LR) = true ).

cnf(kb44,axiom,
    s_contains(s_g011,s_ML) = true ).

cnf(kb45,axiom,
    s_contains(s_g011,s_MR) = true ).

cnf(kb46,axiom,
    s_contains(s_g011,s_NE) = true ).

cnf(kb47,axiom,
    s_contains(s_g011,s_NG) = true ).

cnf(kb48,axiom,
    s_contains(s_g011,s_SH) = true ).

cnf(kb49,axiom,
    s_contains(s_g011,s_SL) = true ).

cnf(kb50,axiom,
    s_contains(s_g011,s_SN) = true ).

cnf(kb51,axiom,
    s_contains(s_g011,s_TG) = true ).

cnf(kb52,axiom,
    s_partOf(s_g011,s_g002) = true ).

cnf(kb53,axiom,
    s_partOf(s_BF,s_g011) = true ).

cnf(kb54,axiom,
    s_partOf(s_BJ,s_g011) = true ).

cnf(kb55,axiom,
    s_partOf(s_CI,s_g011) = true ).

cnf(kb56,axiom,
    s_partOf(s_CV,s_g011) = true ).

cnf(kb57,axiom,
    s_partOf(s_GH,s_g011) = true ).

cnf(kb58,axiom,
    s_partOf(s_GM,s_g011) = true ).

cnf(kb59,axiom,
    s_partOf(s_GN,s_g011) = true ).

cnf(kb60,axiom,
    s_partOf(s_GW,s_g011) = true ).

cnf(kb61,axiom,
    s_partOf(s_LR,s_g011) = true ).

cnf(kb62,axiom,
    s_partOf(s_ML,s_g011) = true ).

cnf(kb63,axiom,
    s_partOf(s_MR,s_g011) = true ).

cnf(kb64,axiom,
    s_partOf(s_NE,s_g011) = true ).

cnf(kb65,axiom,
    s_partOf(s_NG,s_g011) = true ).

cnf(kb66,axiom,
    s_partOf(s_SH,s_g011) = true ).

cnf(kb67,axiom,
    s_partOf(s_SL,s_g011) = true ).

cnf(kb68,axiom,
    s_partOf(s_SN,s_g011) = true ).

cnf(kb69,axiom,
    s_partOf(s_TG,s_g011) = true ).

cnf(kb70,axiom,
    s_contains(s_g013,s_BZ) = true ).

cnf(kb71,axiom,
    s_contains(s_g013,s_CR) = true ).

cnf(kb72,axiom,
    s_contains(s_g013,s_GT) = true ).

cnf(kb73,axiom,
    s_contains(s_g013,s_HN) = true ).

cnf(kb74,axiom,
    s_contains(s_g013,s_MX) = true ).

cnf(kb75,axiom,
    s_contains(s_g013,s_NI) = true ).

cnf(kb76,axiom,
    s_contains(s_g013,s_PA) = true ).

cnf(kb77,axiom,
    s_contains(s_g013,s_SV) = true ).

cnf(kb78,axiom,
    s_partOf(s_g013,s_g019) = true ).

cnf(kb79,axiom,
    s_partOf(s_g013,s_g003) = true ).

cnf(kb80,axiom,
    s_partOf(s_g013,s_g419) = true ).

cnf(kb81,axiom,
    s_partOf(s_BZ,s_g013) = true ).

cnf(kb82,axiom,
    s_partOf(s_CR,s_g013) = true ).

cnf(kb83,axiom,
    s_partOf(s_GT,s_g013) = true ).

cnf(kb84,axiom,
    s_partOf(s_HN,s_g013) = true ).

cnf(kb85,axiom,
    s_partOf(s_MX,s_g013) = true ).

cnf(kb86,axiom,
    s_partOf(s_NI,s_g013) = true ).

cnf(kb87,axiom,
    s_partOf(s_PA,s_g013) = true ).

cnf(kb88,axiom,
    s_partOf(s_SV,s_g013) = true ).

cnf(kb89,axiom,
    s_contains(s_g014,s_BI) = true ).

cnf(kb90,axiom,
    s_contains(s_g014,s_DJ) = true ).

cnf(kb91,axiom,
    s_contains(s_g014,s_ER) = true ).

cnf(kb92,axiom,
    s_contains(s_g014,s_ET) = true ).

cnf(kb93,axiom,
    s_contains(s_g014,s_KE) = true ).

cnf(kb94,axiom,
    s_contains(s_g014,s_KM) = true ).

cnf(kb95,axiom,
    s_contains(s_g014,s_MG) = true ).

cnf(kb96,axiom,
    s_contains(s_g014,s_MU) = true ).

cnf(kb97,axiom,
    s_contains(s_g014,s_MW) = true ).

cnf(kb98,axiom,
    s_contains(s_g014,s_MZ) = true ).

cnf(kb99,axiom,
    s_contains(s_g014,s_RE) = true ).

cnf(kb100,axiom,
    s_contains(s_g014,s_RW) = true ).

cnf(kb101,axiom,
    s_contains(s_g014,s_SC) = true ).

cnf(kb102,axiom,
    s_contains(s_g014,s_SO) = true ).

cnf(kb103,axiom,
    s_contains(s_g014,s_TZ) = true ).

cnf(kb104,axiom,
    s_contains(s_g014,s_UG) = true ).

cnf(kb105,axiom,
    s_contains(s_g014,s_YT) = true ).

cnf(kb106,axiom,
    s_contains(s_g014,s_ZM) = true ).

cnf(kb107,axiom,
    s_contains(s_g014,s_ZW) = true ).

cnf(kb108,axiom,
    s_partOf(s_g014,s_g002) = true ).

cnf(kb109,axiom,
    s_partOf(s_BI,s_g014) = true ).

cnf(kb110,axiom,
    s_partOf(s_DJ,s_g014) = true ).

cnf(kb111,axiom,
    s_partOf(s_ER,s_g014) = true ).

cnf(kb112,axiom,
    s_partOf(s_ET,s_g014) = true ).

cnf(kb113,axiom,
    s_partOf(s_KE,s_g014) = true ).

cnf(kb114,axiom,
    s_partOf(s_KM,s_g014) = true ).

cnf(kb115,axiom,
    s_partOf(s_MG,s_g014) = true ).

cnf(kb116,axiom,
    s_partOf(s_MU,s_g014) = true ).

cnf(kb117,axiom,
    s_partOf(s_MW,s_g014) = true ).

cnf(kb118,axiom,
    s_partOf(s_MZ,s_g014) = true ).

cnf(kb119,axiom,
    s_partOf(s_RE,s_g014) = true ).

cnf(kb120,axiom,
    s_partOf(s_RW,s_g014) = true ).

cnf(kb121,axiom,
    s_partOf(s_SC,s_g014) = true ).

cnf(kb122,axiom,
    s_partOf(s_SO,s_g014) = true ).

cnf(kb123,axiom,
    s_partOf(s_TZ,s_g014) = true ).

cnf(kb124,axiom,
    s_partOf(s_UG,s_g014) = true ).

cnf(kb125,axiom,
    s_partOf(s_YT,s_g014) = true ).

cnf(kb126,axiom,
    s_partOf(s_ZM,s_g014) = true ).

cnf(kb127,axiom,
    s_partOf(s_ZW,s_g014) = true ).

cnf(kb128,axiom,
    s_partOf(s_g030,s_g142) = true ).

cnf(kb129,axiom,
    s_contains(s_g030,s_CN) = true ).

cnf(kb130,axiom,
    s_contains(s_g030,s_HK) = true ).

cnf(kb131,axiom,
    s_contains(s_g030,s_JP) = true ).

cnf(kb132,axiom,
    s_contains(s_g030,s_KP) = true ).

cnf(kb133,axiom,
    s_contains(s_g030,s_KR) = true ).

cnf(kb134,axiom,
    s_contains(s_g030,s_MN) = true ).

cnf(kb135,axiom,
    s_contains(s_g030,s_MO) = true ).

cnf(kb136,axiom,
    s_contains(s_g030,s_TW) = true ).

cnf(kb137,axiom,
    s_partOf(s_g035,s_g142) = true ).

cnf(kb138,axiom,
    s_contains(s_g035,s_BN) = true ).

cnf(kb139,axiom,
    s_contains(s_g035,s_ID) = true ).

cnf(kb140,axiom,
    s_contains(s_g035,s_KH) = true ).

cnf(kb141,axiom,
    s_contains(s_g035,s_LA) = true ).

cnf(kb142,axiom,
    s_contains(s_g035,s_MM) = true ).

cnf(kb143,axiom,
    s_contains(s_g035,s_BU) = true ).

cnf(kb144,axiom,
    s_contains(s_g035,s_MY) = true ).

cnf(kb145,axiom,
    s_contains(s_g035,s_PH) = true ).

cnf(kb146,axiom,
    s_contains(s_g035,s_SG) = true ).

cnf(kb147,axiom,
    s_contains(s_g035,s_TH) = true ).

cnf(kb148,axiom,
    s_contains(s_g035,s_TL) = true ).

cnf(kb149,axiom,
    s_contains(s_g035,s_TP) = true ).

cnf(kb150,axiom,
    s_contains(s_g035,s_VN) = true ).

cnf(kb151,axiom,
    s_partOf(s_g143,s_g142) = true ).

cnf(kb152,axiom,
    s_contains(s_g143,s_TM) = true ).

cnf(kb153,axiom,
    s_contains(s_g143,s_TJ) = true ).

cnf(kb154,axiom,
    s_contains(s_g143,s_KG) = true ).

cnf(kb155,axiom,
    s_contains(s_g143,s_KZ) = true ).

cnf(kb156,axiom,
    s_contains(s_g143,s_UZ) = true ).

cnf(kb157,axiom,
    s_partOf(s_g143,s_g062) = true ).

cnf(kb158,axiom,
    s_partOf(s_g145,s_g142) = true ).

cnf(kb159,axiom,
    s_contains(s_g145,s_AE) = true ).

cnf(kb160,axiom,
    s_contains(s_g145,s_AM) = true ).

cnf(kb161,axiom,
    s_contains(s_g145,s_AZ) = true ).

cnf(kb162,axiom,
    s_contains(s_g145,s_BH) = true ).

cnf(kb163,axiom,
    s_contains(s_g145,s_CY) = true ).

cnf(kb164,axiom,
    s_contains(s_g145,s_GE) = true ).

cnf(kb165,axiom,
    s_contains(s_g145,s_IL) = true ).

cnf(kb166,axiom,
    s_contains(s_g145,s_IQ) = true ).

cnf(kb167,axiom,
    s_contains(s_g145,s_JO) = true ).

cnf(kb168,axiom,
    s_contains(s_g145,s_KW) = true ).

cnf(kb169,axiom,
    s_contains(s_g145,s_LB) = true ).

cnf(kb170,axiom,
    s_contains(s_g145,s_OM) = true ).

cnf(kb171,axiom,
    s_contains(s_g145,s_PS) = true ).

cnf(kb172,axiom,
    s_contains(s_g145,s_QA) = true ).

cnf(kb173,axiom,
    s_contains(s_g145,s_SA) = true ).

cnf(kb174,axiom,
    s_contains(s_g145,s_NT) = true ).

cnf(kb175,axiom,
    s_contains(s_g145,s_SY) = true ).

cnf(kb176,axiom,
    s_contains(s_g145,s_TR) = true ).

cnf(kb177,axiom,
    s_contains(s_g145,s_YE) = true ).

cnf(kb178,axiom,
    s_contains(s_g145,s_YD) = true ).

cnf(kb179,axiom,
    s_partOf(s_g034,s_g142) = true ).

cnf(kb180,axiom,
    s_partOf(s_g034,s_g062) = true ).

cnf(kb181,axiom,
    s_contains(s_g034,s_AF) = true ).

cnf(kb182,axiom,
    s_contains(s_g034,s_BD) = true ).

cnf(kb183,axiom,
    s_contains(s_g034,s_BT) = true ).

cnf(kb184,axiom,
    s_contains(s_g034,s_IN) = true ).

cnf(kb185,axiom,
    s_contains(s_g034,s_IR) = true ).

cnf(kb186,axiom,
    s_contains(s_g034,s_LK) = true ).

cnf(kb187,axiom,
    s_contains(s_g034,s_MV) = true ).

cnf(kb188,axiom,
    s_contains(s_g034,s_NP) = true ).

cnf(kb189,axiom,
    s_contains(s_g034,s_PK) = true ).

cnf(kb190,axiom,
    s_partOf(s_g062,s_g142) = true ).

cnf(kb191,axiom,
    s_contains(s_g062,s_g034) = true ).

cnf(kb192,axiom,
    s_contains(s_g062,s_g143) = true ).

cnf(kb193,axiom,
    s_partOf(s_TM,s_g143) = true ).

cnf(kb194,axiom,
    s_partOf(s_TM,s_g172) = true ).

cnf(kb195,axiom,
    s_partOf(s_TJ,s_g143) = true ).

cnf(kb196,axiom,
    s_partOf(s_TJ,s_g172) = true ).

cnf(kb197,axiom,
    s_partOf(s_KG,s_g143) = true ).

cnf(kb198,axiom,
    s_partOf(s_KG,s_g172) = true ).

cnf(kb199,axiom,
    s_partOf(s_KZ,s_g143) = true ).

cnf(kb200,axiom,
    s_partOf(s_KZ,s_g172) = true ).

cnf(kb201,axiom,
    s_partOf(s_UZ,s_g143) = true ).

cnf(kb202,axiom,
    s_partOf(s_UZ,s_g172) = true ).

cnf(kb203,axiom,
    s_partOf(s_AE,s_g145) = true ).

cnf(kb204,axiom,
    s_partOf(s_AM,s_g145) = true ).

cnf(kb205,axiom,
    s_partOf(s_AM,s_g172) = true ).

cnf(kb206,axiom,
    s_partOf(s_AZ,s_g145) = true ).

cnf(kb207,axiom,
    s_partOf(s_AZ,s_g172) = true ).

cnf(kb208,axiom,
    s_partOf(s_BH,s_g145) = true ).

cnf(kb209,axiom,
    s_partOf(s_CY,s_g145) = true ).

cnf(kb210,axiom,
    s_partOf(s_GE,s_g145) = true ).

cnf(kb211,axiom,
    s_partOf(s_GE,s_g172) = true ).

cnf(kb212,axiom,
    s_partOf(s_IL,s_g145) = true ).

cnf(kb213,axiom,
    s_partOf(s_IQ,s_g145) = true ).

cnf(kb214,axiom,
    s_partOf(s_JO,s_g145) = true ).

cnf(kb215,axiom,
    s_partOf(s_KW,s_g145) = true ).

cnf(kb216,axiom,
    s_partOf(s_LB,s_g145) = true ).

cnf(kb217,axiom,
    s_partOf(s_OM,s_g145) = true ).

cnf(kb218,axiom,
    s_partOf(s_PS,s_g145) = true ).

cnf(kb219,axiom,
    s_partOf(s_QA,s_g145) = true ).

cnf(kb220,axiom,
    s_partOf(s_SA,s_g145) = true ).

cnf(kb221,axiom,
    s_partOf(s_NT,s_g145) = true ).

cnf(kb222,axiom,
    s_partOf(s_SY,s_g145) = true ).

cnf(kb223,axiom,
    s_partOf(s_TR,s_g145) = true ).

cnf(kb224,axiom,
    s_partOf(s_YE,s_g145) = true ).

cnf(kb225,axiom,
    s_partOf(s_YD,s_g145) = true ).

cnf(kb226,axiom,
    s_contains(s_g015,s_DZ) = true ).

cnf(kb227,axiom,
    s_contains(s_g015,s_EG) = true ).

cnf(kb228,axiom,
    s_contains(s_g015,s_EH) = true ).

cnf(kb229,axiom,
    s_contains(s_g015,s_LY) = true ).

cnf(kb230,axiom,
    s_contains(s_g015,s_MA) = true ).

cnf(kb231,axiom,
    s_contains(s_g015,s_SD) = true ).

cnf(kb232,axiom,
    s_contains(s_g015,s_TN) = true ).

cnf(kb233,axiom,
    s_partOf(s_g015,s_g002) = true ).

cnf(kb234,axiom,
    s_partOf(s_DZ,s_g015) = true ).

cnf(kb235,axiom,
    s_partOf(s_EG,s_g015) = true ).

cnf(kb236,axiom,
    s_partOf(s_EH,s_g015) = true ).

cnf(kb237,axiom,
    s_partOf(s_LY,s_g015) = true ).

cnf(kb238,axiom,
    s_partOf(s_MA,s_g015) = true ).

cnf(kb239,axiom,
    s_partOf(s_SD,s_g015) = true ).

cnf(kb240,axiom,
    s_partOf(s_TN,s_g015) = true ).

cnf(kb241,axiom,
    s_partOf(s_g039,s_g150) = true ).

cnf(kb242,axiom,
    s_contains(s_g039,s_AD) = true ).

cnf(kb243,axiom,
    s_contains(s_g039,s_AL) = true ).

cnf(kb244,axiom,
    s_contains(s_g039,s_BA) = true ).

cnf(kb245,axiom,
    s_contains(s_g039,s_ES) = true ).

cnf(kb246,axiom,
    s_contains(s_g039,s_GI) = true ).

cnf(kb247,axiom,
    s_contains(s_g039,s_GR) = true ).

cnf(kb248,axiom,
    s_contains(s_g039,s_HR) = true ).

cnf(kb249,axiom,
    s_contains(s_g039,s_IT) = true ).

cnf(kb250,axiom,
    s_contains(s_g039,s_ME) = true ).

cnf(kb251,axiom,
    s_contains(s_g039,s_MK) = true ).

cnf(kb252,axiom,
    s_contains(s_g039,s_MT) = true ).

cnf(kb253,axiom,
    s_contains(s_g039,s_CS) = true ).

cnf(kb254,axiom,
    s_contains(s_g039,s_RS) = true ).

cnf(kb255,axiom,
    s_contains(s_g039,s_PT) = true ).

cnf(kb256,axiom,
    s_contains(s_g039,s_SI) = true ).

cnf(kb257,axiom,
    s_contains(s_g039,s_SM) = true ).

cnf(kb258,axiom,
    s_contains(s_g039,s_VA) = true ).

cnf(kb259,axiom,
    s_contains(s_g039,s_YU) = true ).

cnf(kb260,axiom,
    s_partOf(s_g151,s_g150) = true ).

cnf(kb261,axiom,
    s_contains(s_g151,s_BG) = true ).

cnf(kb262,axiom,
    s_contains(s_g151,s_BY) = true ).

cnf(kb263,axiom,
    s_contains(s_g151,s_CZ) = true ).

cnf(kb264,axiom,
    s_contains(s_g151,s_HU) = true ).

cnf(kb265,axiom,
    s_contains(s_g151,s_MD) = true ).

cnf(kb266,axiom,
    s_contains(s_g151,s_PL) = true ).

cnf(kb267,axiom,
    s_contains(s_g151,s_RO) = true ).

cnf(kb268,axiom,
    s_contains(s_g151,s_RU) = true ).

cnf(kb269,axiom,
    s_contains(s_g151,s_SU) = true ).

cnf(kb270,axiom,
    s_contains(s_g151,s_SK) = true ).

cnf(kb271,axiom,
    s_contains(s_g151,s_UA) = true ).

cnf(kb272,axiom,
    s_partOf(s_g154,s_g150) = true ).

cnf(kb273,axiom,
    s_contains(s_g154,s_GG) = true ).

cnf(kb274,axiom,
    s_contains(s_g154,s_IM) = true ).

cnf(kb275,axiom,
    s_contains(s_g154,s_JE) = true ).

cnf(kb276,axiom,
    s_contains(s_g154,s_AX) = true ).

cnf(kb277,axiom,
    s_contains(s_g154,s_DK) = true ).

cnf(kb278,axiom,
    s_contains(s_g154,s_EE) = true ).

cnf(kb279,axiom,
    s_contains(s_g154,s_FI) = true ).

cnf(kb280,axiom,
    s_contains(s_g154,s_FO) = true ).

cnf(kb281,axiom,
    s_contains(s_g154,s_GB) = true ).

cnf(kb282,axiom,
    s_contains(s_g154,s_IE) = true ).

cnf(kb283,axiom,
    s_contains(s_g154,s_IM) = true ).

cnf(kb284,axiom,
    s_contains(s_g154,s_IS) = true ).

cnf(kb285,axiom,
    s_contains(s_g154,s_LT) = true ).

cnf(kb286,axiom,
    s_contains(s_g154,s_LV) = true ).

cnf(kb287,axiom,
    s_contains(s_g154,s_NO) = true ).

cnf(kb288,axiom,
    s_contains(s_g154,s_SE) = true ).

cnf(kb289,axiom,
    s_contains(s_g154,s_SJ) = true ).

cnf(kb290,axiom,
    s_partOf(s_g155,s_g150) = true ).

cnf(kb291,axiom,
    s_contains(s_g155,s_AT) = true ).

cnf(kb292,axiom,
    s_contains(s_g155,s_BE) = true ).

cnf(kb293,axiom,
    s_contains(s_g155,s_CH) = true ).

cnf(kb294,axiom,
    s_contains(s_g155,s_DE) = true ).

cnf(kb295,axiom,
    s_contains(s_g155,s_DD) = true ).

cnf(kb296,axiom,
    s_contains(s_g155,s_FR) = true ).

cnf(kb297,axiom,
    s_contains(s_g155,s_FX) = true ).

cnf(kb298,axiom,
    s_contains(s_g155,s_LI) = true ).

cnf(kb299,axiom,
    s_contains(s_g155,s_LU) = true ).

cnf(kb300,axiom,
    s_contains(s_g155,s_MC) = true ).

cnf(kb301,axiom,
    s_contains(s_g155,s_NL) = true ).

cnf(kb302,axiom,
    s_partOf(s_BG,s_g151) = true ).

cnf(kb303,axiom,
    s_partOf(s_BY,s_g151) = true ).

cnf(kb304,axiom,
    s_partOf(s_BY,s_g172) = true ).

cnf(kb305,axiom,
    s_partOf(s_CZ,s_g151) = true ).

cnf(kb306,axiom,
    s_partOf(s_HU,s_g151) = true ).

cnf(kb307,axiom,
    s_partOf(s_MD,s_g151) = true ).

cnf(kb308,axiom,
    s_partOf(s_MD,s_g172) = true ).

cnf(kb309,axiom,
    s_partOf(s_PL,s_g151) = true ).

cnf(kb310,axiom,
    s_partOf(s_RO,s_g151) = true ).

cnf(kb311,axiom,
    s_partOf(s_RU,s_g151) = true ).

cnf(kb312,axiom,
    s_partOf(s_RU,s_g172) = true ).

cnf(kb313,axiom,
    s_partOf(s_SU,s_g151) = true ).

cnf(kb314,axiom,
    s_partOf(s_SK,s_g151) = true ).

cnf(kb315,axiom,
    s_partOf(s_UA,s_g151) = true ).

cnf(kb316,axiom,
    s_partOf(s_UA,s_g172) = true ).

cnf(kb317,axiom,
    s_partOf(s_GG,s_g154) = true ).

cnf(kb318,axiom,
    s_partOf(s_GG,s_g830) = true ).

cnf(kb319,axiom,
    s_partOf(s_IM,s_g154) = true ).

cnf(kb320,axiom,
    s_partOf(s_IM,s_g154) = true ).

cnf(kb321,axiom,
    s_partOf(s_JE,s_g154) = true ).

cnf(kb322,axiom,
    s_partOf(s_JE,s_g830) = true ).

cnf(kb323,axiom,
    s_partOf(s_AX,s_g154) = true ).

cnf(kb324,axiom,
    s_partOf(s_DK,s_g154) = true ).

cnf(kb325,axiom,
    s_partOf(s_EE,s_g154) = true ).

cnf(kb326,axiom,
    s_partOf(s_FI,s_g154) = true ).

cnf(kb327,axiom,
    s_partOf(s_FO,s_g154) = true ).

cnf(kb328,axiom,
    s_partOf(s_GB,s_g154) = true ).

cnf(kb329,axiom,
    s_partOf(s_IE,s_g154) = true ).

cnf(kb330,axiom,
    s_partOf(s_IS,s_g154) = true ).

cnf(kb331,axiom,
    s_partOf(s_LT,s_g154) = true ).

cnf(kb332,axiom,
    s_partOf(s_LV,s_g154) = true ).

cnf(kb333,axiom,
    s_partOf(s_NO,s_g154) = true ).

cnf(kb334,axiom,
    s_partOf(s_SE,s_g154) = true ).

cnf(kb335,axiom,
    s_partOf(s_SJ,s_g154) = true ).

cnf(kb336,axiom,
    s_contains(s_g830,s_GG) = true ).

cnf(kb337,axiom,
    s_contains(s_g830,s_JE) = true ).

cnf(kb338,axiom,
    s_partOf(s_AT,s_g155) = true ).

cnf(kb339,axiom,
    s_partOf(s_BE,s_g155) = true ).

cnf(kb340,axiom,
    s_partOf(s_CH,s_g155) = true ).

cnf(kb341,axiom,
    s_partOf(s_DE,s_g155) = true ).

cnf(kb342,axiom,
    s_partOf(s_DD,s_g155) = true ).

cnf(kb343,axiom,
    s_partOf(s_FR,s_g155) = true ).

cnf(kb344,axiom,
    s_partOf(s_FX,s_g155) = true ).

cnf(kb345,axiom,
    s_partOf(s_LI,s_g155) = true ).

cnf(kb346,axiom,
    s_partOf(s_LU,s_g155) = true ).

cnf(kb347,axiom,
    s_partOf(s_MC,s_g155) = true ).

cnf(kb348,axiom,
    s_partOf(s_NL,s_g155) = true ).

cnf(kb349,axiom,
    s_contains(s_g017,s_AO) = true ).

cnf(kb350,axiom,
    s_contains(s_g017,s_CD) = true ).

cnf(kb351,axiom,
    s_contains(s_g017,s_ZR) = true ).

cnf(kb352,axiom,
    s_contains(s_g017,s_CF) = true ).

cnf(kb353,axiom,
    s_contains(s_g017,s_CG) = true ).

cnf(kb354,axiom,
    s_contains(s_g017,s_CM) = true ).

cnf(kb355,axiom,
    s_contains(s_g017,s_GA) = true ).

cnf(kb356,axiom,
    s_contains(s_g017,s_GQ) = true ).

cnf(kb357,axiom,
    s_contains(s_g017,s_ST) = true ).

cnf(kb358,axiom,
    s_contains(s_g017,s_TD) = true ).

cnf(kb359,axiom,
    s_partOf(s_g017,s_g002) = true ).

cnf(kb360,axiom,
    s_partOf(s_AO,s_g017) = true ).

cnf(kb361,axiom,
    s_partOf(s_CD,s_g017) = true ).

cnf(kb362,axiom,
    s_partOf(s_ZR,s_g017) = true ).

cnf(kb363,axiom,
    s_partOf(s_CF,s_g017) = true ).

cnf(kb364,axiom,
    s_partOf(s_CG,s_g017) = true ).

cnf(kb365,axiom,
    s_partOf(s_CM,s_g017) = true ).

cnf(kb366,axiom,
    s_partOf(s_GA,s_g017) = true ).

cnf(kb367,axiom,
    s_partOf(s_GQ,s_g017) = true ).

cnf(kb368,axiom,
    s_partOf(s_ST,s_g017) = true ).

cnf(kb369,axiom,
    s_partOf(s_TD,s_g017) = true ).

cnf(kb370,axiom,
    s_contains(s_g172,s_AM) = true ).

cnf(kb371,axiom,
    s_contains(s_g172,s_AZ) = true ).

cnf(kb372,axiom,
    s_contains(s_g172,s_BY) = true ).

cnf(kb373,axiom,
    s_contains(s_g172,s_GE) = true ).

cnf(kb374,axiom,
    s_contains(s_g172,s_KG) = true ).

cnf(kb375,axiom,
    s_contains(s_g172,s_KZ) = true ).

cnf(kb376,axiom,
    s_contains(s_g172,s_MD) = true ).

cnf(kb377,axiom,
    s_contains(s_g172,s_RU) = true ).

cnf(kb378,axiom,
    s_contains(s_g172,s_TJ) = true ).

cnf(kb379,axiom,
    s_contains(s_g172,s_TM) = true ).

cnf(kb380,axiom,
    s_contains(s_g172,s_UA) = true ).

cnf(kb381,axiom,
    s_contains(s_g172,s_UZ) = true ).

cnf(kb382,axiom,
    s_contains(s_g018,s_BW) = true ).

cnf(kb383,axiom,
    s_contains(s_g018,s_LS) = true ).

cnf(kb384,axiom,
    s_contains(s_g018,s_NA) = true ).

cnf(kb385,axiom,
    s_contains(s_g018,s_SZ) = true ).

cnf(kb386,axiom,
    s_contains(s_g018,s_ZA) = true ).

cnf(kb387,axiom,
    s_partOf(s_g018,s_g002) = true ).

cnf(kb388,axiom,
    s_partOf(s_BW,s_g018) = true ).

cnf(kb389,axiom,
    s_partOf(s_LS,s_g018) = true ).

cnf(kb390,axiom,
    s_partOf(s_NA,s_g018) = true ).

cnf(kb391,axiom,
    s_partOf(s_SZ,s_g018) = true ).

cnf(kb392,axiom,
    s_partOf(s_ZA,s_g018) = true ).

cnf(kb393,axiom,
    s_partOf(s_g005,s_g019) = true ).

cnf(kb394,axiom,
    s_partOf(s_g005,s_g419) = true ).

cnf(kb395,axiom,
    s_contains(s_g005,s_AR) = true ).

cnf(kb396,axiom,
    s_contains(s_g005,s_BO) = true ).

cnf(kb397,axiom,
    s_contains(s_g005,s_BR) = true ).

cnf(kb398,axiom,
    s_contains(s_g005,s_CL) = true ).

cnf(kb399,axiom,
    s_contains(s_g005,s_CO) = true ).

cnf(kb400,axiom,
    s_contains(s_g005,s_EC) = true ).

cnf(kb401,axiom,
    s_contains(s_g005,s_FK) = true ).

cnf(kb402,axiom,
    s_contains(s_g005,s_GF) = true ).

cnf(kb403,axiom,
    s_contains(s_g005,s_GY) = true ).

cnf(kb404,axiom,
    s_contains(s_g005,s_PE) = true ).

cnf(kb405,axiom,
    s_contains(s_g005,s_PY) = true ).

cnf(kb406,axiom,
    s_contains(s_g005,s_SR) = true ).

cnf(kb407,axiom,
    s_contains(s_g005,s_UY) = true ).

cnf(kb408,axiom,
    s_contains(s_g005,s_VE) = true ).

cnf(kb409,axiom,
    s_partOf(s_g021,s_g019) = true ).

cnf(kb410,axiom,
    s_contains(s_g021,s_BM) = true ).

cnf(kb411,axiom,
    s_contains(s_g021,s_CA) = true ).

cnf(kb412,axiom,
    s_contains(s_g021,s_GL) = true ).

cnf(kb413,axiom,
    s_contains(s_g021,s_PM) = true ).

cnf(kb414,axiom,
    s_contains(s_g021,s_US) = true ).

cnf(kb415,axiom,
    s_partOf(s_g021,s_g003) = true ).

cnf(kb416,axiom,
    s_partOf(s_g029,s_g019) = true ).

cnf(kb417,axiom,
    s_contains(s_g029,s_AG) = true ).

cnf(kb418,axiom,
    s_contains(s_g029,s_AI) = true ).

cnf(kb419,axiom,
    s_contains(s_g029,s_AN) = true ).

cnf(kb420,axiom,
    s_contains(s_g029,s_AW) = true ).

cnf(kb421,axiom,
    s_contains(s_g029,s_BB) = true ).

cnf(kb422,axiom,
    s_contains(s_g029,s_BL) = true ).

cnf(kb423,axiom,
    s_contains(s_g029,s_BS) = true ).

cnf(kb424,axiom,
    s_contains(s_g029,s_CU) = true ).

cnf(kb425,axiom,
    s_contains(s_g029,s_DM) = true ).

cnf(kb426,axiom,
    s_contains(s_g029,s_DO) = true ).

cnf(kb427,axiom,
    s_contains(s_g029,s_GD) = true ).

cnf(kb428,axiom,
    s_contains(s_g029,s_GP) = true ).

cnf(kb429,axiom,
    s_contains(s_g029,s_HT) = true ).

cnf(kb430,axiom,
    s_contains(s_g029,s_JM) = true ).

cnf(kb431,axiom,
    s_contains(s_g029,s_KN) = true ).

cnf(kb432,axiom,
    s_contains(s_g029,s_KY) = true ).

cnf(kb433,axiom,
    s_contains(s_g029,s_LC) = true ).

cnf(kb434,axiom,
    s_contains(s_g029,s_MF) = true ).

cnf(kb435,axiom,
    s_contains(s_g029,s_MQ) = true ).

cnf(kb436,axiom,
    s_contains(s_g029,s_MS) = true ).

cnf(kb437,axiom,
    s_contains(s_g029,s_PR) = true ).

cnf(kb438,axiom,
    s_contains(s_g029,s_TC) = true ).

cnf(kb439,axiom,
    s_contains(s_g029,s_TT) = true ).

cnf(kb440,axiom,
    s_contains(s_g029,s_VC) = true ).

cnf(kb441,axiom,
    s_contains(s_g029,s_VG) = true ).

cnf(kb442,axiom,
    s_contains(s_g029,s_VI) = true ).

cnf(kb443,axiom,
    s_partOf(s_g029,s_g003) = true ).

cnf(kb444,axiom,
    s_partOf(s_g029,s_g419) = true ).

cnf(kb445,axiom,
    s_partOf(s_g003,s_g019) = true ).

cnf(kb446,axiom,
    s_contains(s_g003,s_g013) = true ).

cnf(kb447,axiom,
    s_contains(s_g003,s_g021) = true ).

cnf(kb448,axiom,
    s_contains(s_g003,s_g029) = true ).

cnf(kb449,axiom,
    s_partOf(s_g419,s_g019) = true ).

cnf(kb450,axiom,
    s_contains(s_g419,s_g005) = true ).

cnf(kb451,axiom,
    s_contains(s_g419,s_g013) = true ).

cnf(kb452,axiom,
    s_contains(s_g419,s_g029) = true ).

cnf(kb453,axiom,
    s_partOf(s_BM,s_g021) = true ).

cnf(kb454,axiom,
    s_partOf(s_CA,s_g021) = true ).

cnf(kb455,axiom,
    s_partOf(s_GL,s_g021) = true ).

cnf(kb456,axiom,
    s_partOf(s_PM,s_g021) = true ).

cnf(kb457,axiom,
    s_partOf(s_US,s_g021) = true ).

cnf(kb458,axiom,
    s_partOf(s_AG,s_g029) = true ).

cnf(kb459,axiom,
    s_partOf(s_AI,s_g029) = true ).

cnf(kb460,axiom,
    s_partOf(s_AN,s_g029) = true ).

cnf(kb461,axiom,
    s_partOf(s_AW,s_g029) = true ).

cnf(kb462,axiom,
    s_partOf(s_BB,s_g029) = true ).

cnf(kb463,axiom,
    s_partOf(s_BL,s_g029) = true ).

cnf(kb464,axiom,
    s_partOf(s_BS,s_g029) = true ).

cnf(kb465,axiom,
    s_partOf(s_CU,s_g029) = true ).

cnf(kb466,axiom,
    s_partOf(s_DM,s_g029) = true ).

cnf(kb467,axiom,
    s_partOf(s_DO,s_g029) = true ).

cnf(kb468,axiom,
    s_partOf(s_GD,s_g029) = true ).

cnf(kb469,axiom,
    s_partOf(s_GP,s_g029) = true ).

cnf(kb470,axiom,
    s_partOf(s_HT,s_g029) = true ).

cnf(kb471,axiom,
    s_partOf(s_JM,s_g029) = true ).

cnf(kb472,axiom,
    s_partOf(s_KN,s_g029) = true ).

cnf(kb473,axiom,
    s_partOf(s_KY,s_g029) = true ).

cnf(kb474,axiom,
    s_partOf(s_LC,s_g029) = true ).

cnf(kb475,axiom,
    s_partOf(s_MF,s_g029) = true ).

cnf(kb476,axiom,
    s_partOf(s_MQ,s_g029) = true ).

cnf(kb477,axiom,
    s_partOf(s_MS,s_g029) = true ).

cnf(kb478,axiom,
    s_partOf(s_PR,s_g029) = true ).

cnf(kb479,axiom,
    s_partOf(s_TC,s_g029) = true ).

cnf(kb480,axiom,
    s_partOf(s_TT,s_g029) = true ).

cnf(kb481,axiom,
    s_partOf(s_VC,s_g029) = true ).

cnf(kb482,axiom,
    s_partOf(s_VG,s_g029) = true ).

cnf(kb483,axiom,
    s_partOf(s_VI,s_g029) = true ).

cnf(kb484,axiom,
    s_partOf(s_CN,s_g030) = true ).

cnf(kb485,axiom,
    s_partOf(s_HK,s_g030) = true ).

cnf(kb486,axiom,
    s_partOf(s_JP,s_g030) = true ).

cnf(kb487,axiom,
    s_partOf(s_KP,s_g030) = true ).

cnf(kb488,axiom,
    s_partOf(s_KR,s_g030) = true ).

cnf(kb489,axiom,
    s_partOf(s_MN,s_g030) = true ).

cnf(kb490,axiom,
    s_partOf(s_MO,s_g030) = true ).

cnf(kb491,axiom,
    s_partOf(s_TW,s_g030) = true ).

cnf(kb492,axiom,
    s_partOf(s_BN,s_g035) = true ).

cnf(kb493,axiom,
    s_partOf(s_ID,s_g035) = true ).

cnf(kb494,axiom,
    s_partOf(s_KH,s_g035) = true ).

cnf(kb495,axiom,
    s_partOf(s_LA,s_g035) = true ).

cnf(kb496,axiom,
    s_partOf(s_MM,s_g035) = true ).

cnf(kb497,axiom,
    s_partOf(s_BU,s_g035) = true ).

cnf(kb498,axiom,
    s_partOf(s_MY,s_g035) = true ).

cnf(kb499,axiom,
    s_partOf(s_PH,s_g035) = true ).

cnf(kb500,axiom,
    s_partOf(s_SG,s_g035) = true ).

cnf(kb501,axiom,
    s_partOf(s_TH,s_g035) = true ).

cnf(kb502,axiom,
    s_partOf(s_TL,s_g035) = true ).

cnf(kb503,axiom,
    s_partOf(s_TP,s_g035) = true ).

cnf(kb504,axiom,
    s_partOf(s_VN,s_g035) = true ).

cnf(kb505,axiom,
    s_partOf(s_AD,s_g039) = true ).

cnf(kb506,axiom,
    s_partOf(s_AL,s_g039) = true ).

cnf(kb507,axiom,
    s_partOf(s_BA,s_g039) = true ).

cnf(kb508,axiom,
    s_partOf(s_ES,s_g039) = true ).

cnf(kb509,axiom,
    s_partOf(s_GI,s_g039) = true ).

cnf(kb510,axiom,
    s_partOf(s_GR,s_g039) = true ).

cnf(kb511,axiom,
    s_partOf(s_HR,s_g039) = true ).

cnf(kb512,axiom,
    s_partOf(s_IT,s_g039) = true ).

cnf(kb513,axiom,
    s_partOf(s_ME,s_g039) = true ).

cnf(kb514,axiom,
    s_partOf(s_MK,s_g039) = true ).

cnf(kb515,axiom,
    s_partOf(s_MT,s_g039) = true ).

cnf(kb516,axiom,
    s_partOf(s_CS,s_g039) = true ).

cnf(kb517,axiom,
    s_partOf(s_RS,s_g039) = true ).

cnf(kb518,axiom,
    s_partOf(s_PT,s_g039) = true ).

cnf(kb519,axiom,
    s_partOf(s_SI,s_g039) = true ).

cnf(kb520,axiom,
    s_partOf(s_SM,s_g039) = true ).

cnf(kb521,axiom,
    s_partOf(s_VA,s_g039) = true ).

cnf(kb522,axiom,
    s_partOf(s_YU,s_g039) = true ).

cnf(kb523,axiom,
    s_partOf(s_AR,s_g005) = true ).

cnf(kb524,axiom,
    s_partOf(s_BO,s_g005) = true ).

cnf(kb525,axiom,
    s_partOf(s_BR,s_g005) = true ).

cnf(kb526,axiom,
    s_partOf(s_CL,s_g005) = true ).

cnf(kb527,axiom,
    s_partOf(s_CO,s_g005) = true ).

cnf(kb528,axiom,
    s_partOf(s_EC,s_g005) = true ).

cnf(kb529,axiom,
    s_partOf(s_FK,s_g005) = true ).

cnf(kb530,axiom,
    s_partOf(s_GF,s_g005) = true ).

cnf(kb531,axiom,
    s_partOf(s_GY,s_g005) = true ).

cnf(kb532,axiom,
    s_partOf(s_PE,s_g005) = true ).

cnf(kb533,axiom,
    s_partOf(s_PY,s_g005) = true ).

cnf(kb534,axiom,
    s_partOf(s_SR,s_g005) = true ).

cnf(kb535,axiom,
    s_partOf(s_UY,s_g005) = true ).

cnf(kb536,axiom,
    s_partOf(s_VE,s_g005) = true ).

cnf(kb537,axiom,
    s_contains(s_g053,s_AU) = true ).

cnf(kb538,axiom,
    s_contains(s_g053,s_NF) = true ).

cnf(kb539,axiom,
    s_contains(s_g053,s_NZ) = true ).

cnf(kb540,axiom,
    s_partOf(s_g053,s_g009) = true ).

cnf(kb541,axiom,
    s_partOf(s_AU,s_g053) = true ).

cnf(kb542,axiom,
    s_partOf(s_NF,s_g053) = true ).

cnf(kb543,axiom,
    s_partOf(s_NZ,s_g053) = true ).

cnf(kb544,axiom,
    s_contains(s_g054,s_FJ) = true ).

cnf(kb545,axiom,
    s_contains(s_g054,s_NC) = true ).

cnf(kb546,axiom,
    s_contains(s_g054,s_PG) = true ).

cnf(kb547,axiom,
    s_contains(s_g054,s_SB) = true ).

cnf(kb548,axiom,
    s_contains(s_g054,s_VU) = true ).

cnf(kb549,axiom,
    s_partOf(s_g054,s_g009) = true ).

cnf(kb550,axiom,
    s_partOf(s_FJ,s_g054) = true ).

cnf(kb551,axiom,
    s_partOf(s_NC,s_g054) = true ).

cnf(kb552,axiom,
    s_partOf(s_PG,s_g054) = true ).

cnf(kb553,axiom,
    s_partOf(s_SB,s_g054) = true ).

cnf(kb554,axiom,
    s_partOf(s_VU,s_g054) = true ).

cnf(kb555,axiom,
    s_contains(s_g057,s_FM) = true ).

cnf(kb556,axiom,
    s_contains(s_g057,s_GU) = true ).

cnf(kb557,axiom,
    s_contains(s_g057,s_KI) = true ).

cnf(kb558,axiom,
    s_contains(s_g057,s_MH) = true ).

cnf(kb559,axiom,
    s_contains(s_g057,s_MP) = true ).

cnf(kb560,axiom,
    s_contains(s_g057,s_NR) = true ).

cnf(kb561,axiom,
    s_contains(s_g057,s_PW) = true ).

cnf(kb562,axiom,
    s_partOf(s_g057,s_g009) = true ).

cnf(kb563,axiom,
    s_partOf(s_FM,s_g057) = true ).

cnf(kb564,axiom,
    s_partOf(s_GU,s_g057) = true ).

cnf(kb565,axiom,
    s_partOf(s_KI,s_g057) = true ).

cnf(kb566,axiom,
    s_partOf(s_MH,s_g057) = true ).

cnf(kb567,axiom,
    s_partOf(s_MP,s_g057) = true ).

cnf(kb568,axiom,
    s_partOf(s_NR,s_g057) = true ).

cnf(kb569,axiom,
    s_partOf(s_PW,s_g057) = true ).

cnf(kb570,axiom,
    s_contains(s_g061,s_AS) = true ).

cnf(kb571,axiom,
    s_contains(s_g061,s_CK) = true ).

cnf(kb572,axiom,
    s_contains(s_g061,s_NU) = true ).

cnf(kb573,axiom,
    s_contains(s_g061,s_PF) = true ).

cnf(kb574,axiom,
    s_contains(s_g061,s_PN) = true ).

cnf(kb575,axiom,
    s_contains(s_g061,s_TK) = true ).

cnf(kb576,axiom,
    s_contains(s_g061,s_TO) = true ).

cnf(kb577,axiom,
    s_contains(s_g061,s_TV) = true ).

cnf(kb578,axiom,
    s_contains(s_g061,s_WF) = true ).

cnf(kb579,axiom,
    s_contains(s_g061,s_WS) = true ).

cnf(kb580,axiom,
    s_partOf(s_g061,s_g009) = true ).

cnf(kb581,axiom,
    s_partOf(s_AS,s_g061) = true ).

cnf(kb582,axiom,
    s_partOf(s_CK,s_g061) = true ).

cnf(kb583,axiom,
    s_partOf(s_NU,s_g061) = true ).

cnf(kb584,axiom,
    s_partOf(s_PF,s_g061) = true ).

cnf(kb585,axiom,
    s_partOf(s_PN,s_g061) = true ).

cnf(kb586,axiom,
    s_partOf(s_TK,s_g061) = true ).

cnf(kb587,axiom,
    s_partOf(s_TO,s_g061) = true ).

cnf(kb588,axiom,
    s_partOf(s_TV,s_g061) = true ).

cnf(kb589,axiom,
    s_partOf(s_WF,s_g061) = true ).

cnf(kb590,axiom,
    s_partOf(s_WS,s_g061) = true ).

cnf(kb591,axiom,
    s_partOf(s_AF,s_g034) = true ).

cnf(kb592,axiom,
    s_partOf(s_BD,s_g034) = true ).

cnf(kb593,axiom,
    s_partOf(s_BT,s_g034) = true ).

cnf(kb594,axiom,
    s_partOf(s_IN,s_g034) = true ).

cnf(kb595,axiom,
    s_partOf(s_IR,s_g034) = true ).

cnf(kb596,axiom,
    s_partOf(s_LK,s_g034) = true ).

cnf(kb597,axiom,
    s_partOf(s_MV,s_g034) = true ).

cnf(kb598,axiom,
    s_partOf(s_NP,s_g034) = true ).

cnf(kb599,axiom,
    s_partOf(s_PK,s_g034) = true ).

cnf(axiom1,axiom,
    ifeq(s_contains(Y,Z),true,ifeq(s_contains(X,Y),true,s_contains(X,Z),true),true) = true ).

cnf(mexica_in_america_1,negated_conjecture,
    s_contains(s_g030,s_MX) != true ).

%------------------------------------------------------------------------------
