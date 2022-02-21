nat(zero).
nat(succ(X)) :- nat(X).

leq(zero, Y) :- nat(Y).
leq(succ(X), succ(Y)) :- leq(X,Y), nat(X), nat(Y).

add(X, zero, X) :- nat(X).
add(succ(X), Y, succ(R)) :- add(X,Y,R), nat(X), nat(Y), nat(R).

add(X,Y,F) :- add(Y,X,F).

factorial(0,1).
factorial(N,V) :- N1 is N-1, factorial(N1,V1), V is V1*N.



member(X,[X|_]).
member(X,[_|XS]) :- member(X,XS).

append([],L2,L2).
append([X:XS],L2,[X|L33]) :- append(XS,L2,L33).

rev([],[]).
rev([X|XS],L) :- rev(XS,L1), append(L1,[X],L).

mylength([],0).
mylength([_|XS],N) :- mylength(XS,N1), N is N1+1.

insert(X,[],[X]).
insert(X,[Y|YS],[X|[Y|YS]]) :- X<Y.
insert(X,[Y|YS],[Y|ZS]):- X>=Y, insert(X,YS,ZS).


mixed(r(X,T1,T2,T3)) :- string(X), mixed(T1), mixed(T2), mixed(T3). 
mixed(r(X,T1,T2)) :- string(X), mixed(T1),mixed(T2).
mixed(r(X)) :- string(X).

r("gorilla",r("goat",r("duck",r("koala"),r("manatee")),r("impala")),r("horse"),r("ostrich")).

leftmost(r(X),Y):-string(X).
leftmost(r(_,T1,_),Y) :- leftmost(T1,Y).
leftmost(r(_,T1,_,_),Y) :- leftmost(T1,Y).

fwin(L1,L2) :- append(_,L1,L11), append(L11,_,L2).

lwt(L1, L2) :- append(X,L1,NP1), append(NP1,K,L2).

