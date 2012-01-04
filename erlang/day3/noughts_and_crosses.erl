-module(noughts_and_crosses).
-export([state/1]).
-include_lib("eunit/include/eunit.hrl").

state([o, o, o|_]) -> o;
state(_) -> no_winner.

empty_board_test() -> no_winner = state([
      '', '', '',
      '', '', '',
      '', '', '']).

unfinished_game_test() -> no_winner = state([
      '',  x,  o,
       o,  o,  x,
       x, '', '']).

top_row_noughts_test() -> o = state([
       o,  o,  o,
       x,  x, '',
      '', '', '']).
