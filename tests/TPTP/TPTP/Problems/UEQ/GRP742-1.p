%------------------------------------------------------------------------------
% File     : GRP742-1 : TPTP v9.0.0. Released v4.0.0.
% Domain   : Group Theory (Quasigroups)
% Problem  : Proper power associative CC loop
% Version  : Especial.
% English  :

% Refs     : [Sta08] Stanovsky (2008), Email to G. Sutcliffe
% Source   : [Sta08]
% Names    :

% Status   : Satisfiable
% Rating   : 1.00 v8.1.0, 0.75 v7.4.0, 1.00 v7.3.0, 0.75 v7.1.0, 1.00 v4.0.0
% Syntax   : Number of clauses     :   10 (  10 unt;   0 nHn;   1 RR)
%            Number of literals    :   10 (  10 equ;   1 neg)
%            Maximal clause size   :    1 (   1 avg)
%            Maximal term depth    :    4 (   2 avg)
%            Number of predicates  :    1 (   0 usr;   0 prp; 2-2 aty)
%            Number of functors    :    7 (   7 usr;   4 con; 0-2 aty)
%            Number of variables   :   17 (   0 sgn)
% SPC      : CNF_SAT_RFO_PEQ_UEQ

% Comments : Size ?? (it's probably known, but I don't know the number)
%------------------------------------------------------------------------------
cnf(c01,axiom,
    mult(A,ld(A,B)) = B ).

cnf(c02,axiom,
    ld(A,mult(A,B)) = B ).

cnf(c03,axiom,
    mult(rd(A,B),B) = A ).

cnf(c04,axiom,
    rd(mult(A,B),B) = A ).

cnf(c05,axiom,
    mult(A,unit) = A ).

cnf(c06,axiom,
    mult(unit,A) = A ).

cnf(c07,axiom,
    mult(A,mult(B,C)) = mult(rd(mult(A,B),A),mult(A,C)) ).

cnf(c08,axiom,
    mult(mult(A,B),C) = mult(mult(A,C),ld(C,mult(B,C))) ).

cnf(c09,axiom,
    mult(A,rd(unit,A)) = unit ).

cnf(goals,negated_conjecture,
    mult(mult(a,b),c) != mult(a,mult(b,c)) ).

%------------------------------------------------------------------------------
