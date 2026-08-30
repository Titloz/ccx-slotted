%------------------------------------------------------------------------------
% File     : ALG301-1 : TPTP v9.0.0. Released v4.1.0.
% Domain   : General Algebra
% Problem  : Identity with no nontrivial finite model
% Version  : Especial.
% English  : One of the two shortest identities with no nontrivial finite 
%            models (in a single binary operation).

% Refs     : [Kis97] Kisielewicz (1997), Austin Identities
%          : [Sta09] Stanovsky (2009), Email to Geoff Sutcliffe
% Source   : [Sta09]
% Names    : austin3 [Sta09]

% Status   : Satisfiable
% Rating   : 1.00 v6.3.0, 0.67 v6.2.0, 0.83 v6.1.0, 1.00 v4.1.0
% Syntax   : Number of clauses     :    2 (   2 unt;   0 nHn;   1 RR)
%            Number of literals    :    2 (   2 equ;   1 neg)
%            Maximal clause size   :    1 (   1 avg)
%            Maximal term depth    :    6 (   2 avg)
%            Number of predicates  :    1 (   0 usr;   0 prp; 2-2 aty)
%            Number of functors    :    3 (   3 usr;   2 con; 0-2 aty)
%            Number of variables   :    3 (   1 sgn)
% SPC      : CNF_SAT_RFO_PEQ_UEQ

% Comments : No finite models.
%------------------------------------------------------------------------------
cnf(sos01,axiom,
    product(A,product(A,product(A,product(B,product(C,A))))) = B ).

cnf(sos02,axiom,
    tptp1 != tptp0 ).

%------------------------------------------------------------------------------
