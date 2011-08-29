mysort([], []).
mysort([X], [X]).
mysort([Head|Tail], [Head|SortedTail]) :-
  mysort(Tail, SortedTail),
  [Head1|_] = SortedTail,
  Head =< Head1.
mysort([Head|Tail], Sorted) :-
  mysort(Tail, SortedTail),
  [Head1|Tail1] = SortedTail,
  Head > Head1,
  mysort([Head|Tail1], ResortedTail),
  Sorted = [Head1|ResortedTail].
