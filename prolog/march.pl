term(a).
term(plus(T1,T2)) :- term(T1), term(T2).
term(mult(T1,T2)) :- term(T1), term(T2).
term(par(T1)) :- term(T1).


atoms(a,[a]).
atoms(plus(T1,T2),A) :- atoms(T1,A1), atoms(T2,A2), append(A1,A2,A).
atoms(mult(T1,T2),A) :- atoms(T1,A1), atoms(T2,A2), append(A1,A2,A).
atoms(par(T1),A) :- atoms(T1,A).


says(pm,yes).
says(pm,maybe).
says(opp,no).


winner(X,[Z]) :- says(X,Z).
winner(X,[_|T]) :- winner(X,T).
