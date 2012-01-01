-module(counter).
-export([count_to/1]).

count_to(N) -> count_to(N, 1).
count_to(N, Next) ->
  if
    Next > N -> ok;
    Next =< N ->
      io:format("~B~n", [Next]),
      count_to(N, Next + 1)
  end.
