-module(hash).
-export([get/2]).
-include_lib("eunit/include/eunit.hrl").

get([{Key, Value}|_], Key) -> Value;
get([_|Tail], Key) -> get(Tail, Key);
get([], _) -> none.

get_test() ->
  Hash = [{erlang, "a functional language"}, {ruby, "an OO language"}],
  [
    ?assert("a functional language" =:= hash:get(Hash, erlang)),
    ?assert("an OO language" =:= hash:get(Hash, ruby)),
    ?assert(none =:= hash:get(Hash, scala))
  ].
