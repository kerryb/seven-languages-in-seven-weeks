-module(noughts_and_crosses).
-export([state/1]).
-include_lib("eunit/include/eunit.hrl").

state(_) -> no_winner.

empty_board_test() -> no_winner = state(['', '', '', '', '', '', '', '', '']).
