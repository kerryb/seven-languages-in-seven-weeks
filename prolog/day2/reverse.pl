reverse([], []).
reverse([Head|Tail], Reverse) :-
  reverse(Tail, ReverseTail),
  append(ReverseTail, [Head], Reverse).
