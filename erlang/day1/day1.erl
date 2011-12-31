-module(day1).
-export([word_count/1]).
-include_lib("eunit/include/eunit.hrl").

word_count(_) -> "Not yet implemented".

word_count_test() -> [
    ?assert(word_count("") =:= 0)
  ].
