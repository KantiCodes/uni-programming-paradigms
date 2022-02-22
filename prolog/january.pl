tree(leaf(V)).
tree(empty).
tree(branch(V,X,Y)) :- tree(X), tree(Y).

leftpath(leaf(V),[V]).
leftpath(empty,[]).
leftpath(branch(V,X,Y),[V|L]) :- leftpath(X,L).



zip([],[],[]).
zip([X|XS],[Y|YS],[(X,Y)|Z]) :- zip(XS,YS,Z).

zip([1,2,3],[a,b,c],Z).

#Uncipping
zip(X,Y,[(1, a), (2, b), (3, c)]).

