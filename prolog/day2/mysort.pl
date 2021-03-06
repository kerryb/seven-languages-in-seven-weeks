mysort([], []).
mysort([X], [X]).
mysort([Head|Tail], [Head|SortedTail]) :-
  mysort(Tail, SortedTail),
  [Head1|_] = SortedTail,
  Head =< Head1.
mysort([Head|Tail], [Head1|SortedRest]) :-
  mysort(Tail, [Head1|Tail1]),
  Head > Head1,
  mysort([Head|Tail1], SortedRest).
