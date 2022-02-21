says(cow,moo).
says(cow,roar).
says(sheep,baa).

apart([],[],[]).
apart([X|XS],[Y|YS],L) :- says(cow,X), apart(XS,YS,L).
apart([X|XS], L, [Z|ZS]) :- says(sheep,X), apart(XS,L,ZS).


box(red(B1,B2)) :- box(B1),box(B2).
box(blue(brick)).
box(blue(doll)).

%red(blue(brick),blue(doll)), [doll]

listdolls(blue(doll),[doll]).
listdolls(blue(brick),[]).
listdolls(red(B1,B2),L) :- box(B1),box(B2),listdolls(B1,L1), listdolls(B2,L2),append(L1,L2,L).
