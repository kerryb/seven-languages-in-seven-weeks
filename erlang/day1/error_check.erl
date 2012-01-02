-module(error_check).
-export([demo/0]).

demo() ->
  io:format("Failing function:~n"),
  check_result({error, "418 I am a teapot"}),
  io:format("~nPassing function:~n"),
  check_result(success),
  ok.

check_result(success) -> io:format("success~n");
check_result({error, Message}) -> io:format("error: ~s~n", [Message]).
