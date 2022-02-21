#lang racklog

nat(zero).
nat(succ(X)) :- nat(X).


fib(0,1).
fib(1,1).
fib(X,Z) :- N1 is X-1, N2 is X-2, fib(N1,Z1), fib(N2, Z2), Z is Z1+Z2.


% Problem 4 

prefixx([],_).
prefixx([X|XS],[X|YS]) :- prefixx(XS,YS).

%prefix [] [] = True
%prefix (x:xs) (y:ys) = if x==y then prefix xs ys

% Problem 5

double([],[]).
double([X|A],[X|[X|B]]) :- double(A,B).

tripple([], []).
tripple([X|A],[X|[X|[X|B]]]) :- tripple(A,B).

% Problem 6

zip([],[],[]).
zip([X|XS],[Y|YS],[(X,Y)|XSYS]) :- zip(XS,YS,XSYS).

unzip([],[],[]).
unzip([(X,Y)|XSYS],[X|XS],[Y|YS]) :- unzip(XSYS,XS,YS).

% Problem 7

append1([],YS,YS).
append1([X|XS],YS,[X|XSYS]) :- append1(XS,YS,XSYS).

prefix1(X,Y) :- append1(X,_,Y).
suffix1(X,Y) :- append1(_,X,Y).



