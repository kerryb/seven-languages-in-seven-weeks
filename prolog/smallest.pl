smallest([], []).
smallest([X], [X]).
smallest([X, Y], X) :-
  X =< Y.
smallest([X, Y], Y) :-
  X > Y.
smallest([Head|Tail], X) :-
  smallest(Tail, SmallestInTail),
  smallest([Head, SmallestInTail], X).
