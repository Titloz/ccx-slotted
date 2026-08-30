%------------------------------------------------------------------------------
% File     : LDA039-1 : TPTP v9.0.0. Released v4.1.0.
% Domain   : LD-Algebras
% Problem  : Identity xx in the equational theory of group conjugation
% Version  : Especial.
% English  :

% Refs     : [Sta09] Stanovsky (2009), Email to Geoff Sutcliffe
% Source   : [Sta09]
% Names    : conjxx [Sta09]

% Status   : Satisfiable
% Rating   : 0.86 v9.0.0, 0.89 v8.2.0, 0.60 v8.1.0, 0.75 v7.1.0, 0.67 v6.4.0, 1.00 v4.1.0
% Syntax   : Number of clauses     :    4 (   4 unt;   0 nHn;   1 RR)
%            Number of literals    :    4 (   4 equ;   1 neg)
%            Maximal clause size   :    1 (   1 avg)
%            Maximal term depth    :    5 (   2 avg)
%            Number of predicates  :    1 (   0 usr;   0 prp; 2-2 aty)
%            Number of functors    :    4 (   4 usr;   3 con; 0-2 aty)
%            Number of variables   :    7 (   0 sgn)
% SPC      : CNF_SAT_RFO_PEQ_UEQ

% Comments : These are somehwat different from other LDA problems.
%------------------------------------------------------------------------------
cnf(sos01,axiom,
    product(A,A) = A ).

cnf(sos02,axiom,
    product(A,product(B,C)) = product(product(A,B),product(A,C)) ).

cnf(sos03,axiom,
    product(product(A,product(B,A)),product(product(B,product(A,B)),product(product(C,B),A))) = product(product(product(A,product(B,A)),B),product(A,product(product(C,B),A))) ).

cnf(goals,negated_conjecture,
    product(product(x0,product(x1,x0)),product(product(x1,product(x0,x1)),product(x2,x0))) != product(product(product(x0,product(x1,x0)),x1),product(x0,product(x2,x0))) ).

%------------------------------------------------------------------------------
