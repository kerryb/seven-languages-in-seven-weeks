-module(day1).
-export([word_count/1]).
-include_lib("eunit/include/eunit.hrl").

word_count("") -> 0;
word_count("\n" ++ T) -> word_count(" " ++ T);
word_count("\t" ++ T) -> word_count(" " ++ T);
word_count("  " ++ T) -> word_count(" " ++ T);
word_count(" " ++ T) -> 1 + word_count(T);
word_count([_]) -> 1;
word_count([_|T]) -> word_count(T).

word_count_test() -> [
    ?assert(word_count("") =:= 0),
    ?assert(word_count("foo") =:= 1),
    ?assert(word_count("foo bar") =:= 2),
    ?assert(word_count("foo    bar") =:= 2),
    ?assert(word_count("foo\tbar") =:= 2),
    ?assert(word_count("foo\nbar") =:= 2)
  ].
