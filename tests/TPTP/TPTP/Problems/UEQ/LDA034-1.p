%------------------------------------------------------------------------------
% File     : LDA034-1 : TPTP v9.0.0. Released v4.1.0.
% Domain   : LD-Algebras
% Problem  : Identity 30 in the equational theory of group conjugation
% Version  : Especial.
% English  :

% Refs     : [Sta09] Stanovsky (2009), Email to Geoff Sutcliffe
% Source   : [Sta09]
% Names    : conj30 [Sta09]

% Status   : Satisfiable
% Rating   : 0.71 v9.0.0, 0.78 v8.2.0, 0.60 v8.1.0, 0.50 v7.5.0, 0.25 v7.1.0, 0.33 v7.0.0, 0.00 v6.4.0, 0.50 v6.3.0, 0.33 v6.2.0, 0.83 v6.1.0, 0.60 v5.5.0, 0.80 v5.4.0, 0.75 v5.3.0, 0.67 v5.2.0, 0.33 v4.1.0
% Syntax   : Number of clauses     :    5 (   5 unt;   0 nHn;   1 RR)
%            Number of literals    :    5 (   5 equ;   1 neg)
%            Maximal clause size   :    1 (   1 avg)
%            Maximal term depth    :    5 (   2 avg)
%            Number of predicates  :    1 (   0 usr;   0 prp; 2-2 aty)
%            Number of functors    :    4 (   4 usr;   3 con; 0-2 aty)
%            Number of variables   :   11 (   0 sgn)
% SPC      : CNF_SAT_RFO_PEQ_UEQ

% Comments : These are somehwat different from other LDA problems.
%------------------------------------------------------------------------------
cnf(sos01,axiom,
    product(A,A) = A ).

cnf(sos02,axiom,
    product(A,product(B,C)) = product(product(A,B),product(A,C)) ).

cnf(sos03,axiom,
    product(product(product(A,product(B,A)),product(product(B,A),A)),product(product(A,B),C)) = product(product(product(A,product(B,A)),product(B,A)),product(product(A,product(A,B)),C)) ).

cnf(sos04,axiom,
    product(product(product(A,B),product(C,A)),product(product(product(A,B),product(A,C)),product(C,D))) = product(product(product(A,B),product(product(C,A),A)),product(product(product(A,B),C),product(C,D))) ).

cnf(goals,negated_conjecture,
    product(product(product(x0,x1),x1),product(x0,x2)) != product(product(x0,x1),product(product(x1,x0),x2)) ).

%------------------------------------------------------------------------------
