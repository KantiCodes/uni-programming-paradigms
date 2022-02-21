#lang datalog

edge(a,b).
edge(b,c).
edge(c,d).
path(X,Y) :- edge(X,Y).
path(X,Z) :- path(X,Y), path(Y,Z).

monarch(queen(margrethe), denmark).
monarch(queen(elizabeth), uk).
monarch(king(carlgustaf), sweden).
monarch(king(willemalex), holand).
queendom(X) :- monarch(queen(Q), X).
kingdom(X) :- not(queendom(X)).


black(X) :- not(white(X)).
white(jack).

fact(0,1).
fact(N,V) :- N1 is N-1, fact(N1, V1), V is V1*N.


mixed(r(X,T1,T2,T3)) :- string(X), mixed(T1), mixed(T2), mixed(T3). 
mixed(r(X,T1,T2)) :- string(X), mixed(T1),mixed(T2).
mixed(r(X)) :- string(X).

mixed(r("koala")).
mixed(r("duck", r("koala"), r("mantee"))).
mixed(r("goat",r("duck", r("koala"), r("mantee")) ,r("impala"))).
mixed(r("gorilla",r("goat",r("duck", r("koala"), r("mantee")) ,r("impala"))  ,r("horse"), r("ostrich"))).

leftmost(r(X),X) :- string(X).
leftmost(r(_,Y,_), E) :- leftmost(Y,E).
leftmost(r(_,Y,_,_),E):-leftmost(Y,E).


left(r(X),X) :- string(X).
left(r(_,T1,_),Y) :- left(T1,Y).
left(r(_,T1,_,_),Y) :- left(T1,Y).

%leftmost(mixed(r("koala")), "koala").
%leftmost(mixed(r("duck", r("koala"), r("mantee"))),"koala").
%leftmost(mixed(r("gorilla",r("goat",r("duck", r("koala"), r("mantee")) ,r("impala"))  ,r("horse"), r("ostrich"))), "jezus").
