-module(noughts_and_crosses).
-export([state/1]).
-include_lib("eunit/include/eunit.hrl").

state(Board) -> case completed(Board) of
    true -> cat; % "cat"? No idea, but it's what the book says.
    false -> winner(lines(Board))
  end.

completed(Board) -> lists:all(fun(X) -> X =/= '' end, Board).

lines([A, B, C, D, E, F, G, H, I]) -> [
    [A, B, C], [D, E, F], [G, H, I],
    [A, D, G], [B, E, H], [C, F, I],
    [A, E, I], [C, E, G]].

winner([[o, o, o]|_]) -> o;
winner([[x, x, x]|_]) -> x;
winner([_|T]) -> winner(T);
winner(_) -> no_winner.

% Tests

empty_board_test() -> no_winner = state([
      '', '', '',
      '', '', '',
      '', '', '']).

unfinished_game_test() -> no_winner = state([
      '', x, o,
      o, o, x,
      x, '', '']).

finished_game_test() -> cat = state([
      x, x, o,
      o, o, x,
      x, x, o]).

top_row_noughts_test() -> o = state([
      o, o, o,
      x, x, '',
      '', '', '']).

middle_row_noughts_test() -> o = state([
      x, x, '',
      o, o, o,
      '', '', '']).

bottom_row_noughts_test() -> o = state([
      x, x, '',
      '', '', '',
      o, o, o]).

left_column_noughts_test() -> o = state([
      o, x, '',
      o, x, '',
      o, '', '']).

middle_column_noughts_test() -> o = state([
      x, o, '',
      '', o, x,
      '', o, '']).

right_column_noughts_test() -> o = state([
      x, '', o,
      '', x, o,
      '', '', o]).

upward_diagonal_noughts_test() -> o = state([
      x, '', o,
      x, o, '',
      o, '', '']).

downward_diagonal_noughts_test() -> o = state([
      o, x, x,
      '', o, '',
      '', '', o]).

top_row_crosses_test() -> x = state([
      x, x, x,
      o, o, '',
      '', '', '']).

middle_row_crosses_test() -> x = state([
      o, o, '',
      x, x, x,
      '', '', '']).

bottom_row_crosses_test() -> x = state([
      o, o, '',
      '', '', '',
      x, x, x]).

left_column_crosses_test() -> x = state([
      x, o, '',
      x, o, '',
      x, '', '']).

middle_column_crosses_test() -> x = state([
      o, x, '',
      '', x, o,
      '', x, '']).

right_column_crosses_test() -> x = state([
      o, '', x,
      '', o, x,
      '', '', x]).

upward_diagonal_crosses_test() -> x = state([
      o, '', x,
      o, x, '',
      x, '', '']).

downward_diagonal_crosses_test() -> x = state([
      x, o, o,
      '', x, '',
      '', '', x]).
