%------------------------------------------------------------------------------
% File     : GRP722-1 : TPTP v9.0.0. Released v4.0.0.
% Domain   : Group Theory (Quasigroups)
% Problem  : In commutative A-loops square-subloop operation is commutative
% Version  : Especial.
% English  :

% Refs     : [Sta08] Stanovsky (2008), Email to G. Sutcliffe
% Source   : [Sta08]
% Names    : JKVxx_3 [Sta08]

% Status   : Satisfiable
% Rating   : 0.43 v9.0.0, 0.22 v8.2.0, 0.00 v8.1.0, 0.25 v7.5.0, 0.00 v6.2.0, 0.17 v6.1.0, 0.40 v6.0.0, 0.20 v5.5.0, 0.40 v5.4.0, 0.50 v5.3.0, 0.67 v5.2.0, 0.33 v4.1.0, 0.50 v4.0.1, 1.00 v4.0.0
% Syntax   : Number of clauses     :    9 (   9 unt;   0 nHn;   1 RR)
%            Number of literals    :    9 (   9 equ;   1 neg)
%            Maximal clause size   :    1 (   1 avg)
%            Maximal term depth    :    5 (   2 avg)
%            Number of predicates  :    1 (   0 usr;   0 prp; 2-2 aty)
%            Number of functors    :    6 (   6 usr;   3 con; 0-2 aty)
%            Number of variables   :   17 (   0 sgn)
% SPC      : CNF_SAT_RFO_PEQ_UEQ

% Comments :
%------------------------------------------------------------------------------
cnf(c01,axiom,
    mult(A,unit) = A ).

cnf(c02,axiom,
    mult(unit,A) = A ).

cnf(c03,axiom,
    mult(A,ld(A,B)) = B ).

cnf(c04,axiom,
    ld(A,mult(A,B)) = B ).

cnf(c05,axiom,
    mult(A,B) = mult(B,A) ).

cnf(c06,axiom,
    ld(mult(A,B),mult(A,mult(B,mult(C,D)))) = mult(ld(mult(A,B),mult(A,mult(B,C))),ld(mult(A,B),mult(A,mult(B,D)))) ).

cnf(c07,axiom,
    ld(A,mult(mult(B,C),A)) = mult(ld(A,mult(B,A)),ld(A,mult(C,A))) ).

cnf(c08,axiom,
    mult(mult(A,A),mult(B,B)) = mult(f(A,B),f(A,B)) ).

cnf(goals,negated_conjecture,
    f(a,b) != f(b,a) ).

%------------------------------------------------------------------------------
