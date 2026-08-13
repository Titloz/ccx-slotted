%------------------------------------------------------------------------------
% File     : GRP773-1 : TPTP v9.0.0. Released v4.1.0.
% Domain   : Group Theory (Quasigroups)
% Problem  : Buchsteiner loop problem
% Version  : Especial.
% English  :

% Refs     : [Sta09] Stanovsky (2009), Email to Geoff Sutcliffe
%          : [CDK10] Csoergoe et al. (2010), Buchsteiner Loops
% Source   : [Sta09]
% Names    : buchsteiner [Sta09]

% Status   : Satisfiable
% Rating   : 1.00 v4.1.0
% Syntax   : Number of clauses     :    8 (   8 unt;   0 nHn;   1 RR)
%            Number of literals    :    8 (   8 equ;   1 neg)
%            Maximal clause size   :    1 (   1 avg)
%            Maximal term depth    :    4 (   2 avg)
%            Number of predicates  :    1 (   0 usr;   0 prp; 2-2 aty)
%            Number of functors    :    7 (   7 usr;   4 con; 0-2 aty)
%            Number of variables   :   13 (   0 sgn)
% SPC      : CNF_SAT_RFO_PEQ_UEQ

% Comments : The smallest model has size 64.
%------------------------------------------------------------------------------
% Buchsteiner loop with exp Q/N(Q)!=2
% size 64

cnf(sos01,axiom,
    mult(A,ld(A,B)) = B ).

cnf(sos02,axiom,
    ld(A,mult(A,B)) = B ).

cnf(sos03,axiom,
    mult(rd(A,B),B) = A ).

cnf(sos04,axiom,
    rd(mult(A,B),B) = A ).

cnf(sos05,axiom,
    mult(A,unit) = A ).

cnf(sos06,axiom,
    mult(unit,A) = A ).

cnf(sos07,axiom,
    ld(A,mult(mult(A,B),C)) = rd(mult(B,mult(C,A)),A) ).

cnf(sos08,negated_conjecture,
    mult(mult(mult(a,a),b),c) != mult(mult(a,a),mult(b,c)) ).

%------------------------------------------------------------------------------
