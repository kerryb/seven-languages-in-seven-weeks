-module(shopping_list).
-export([totals/1]).
-include_lib("eunit/include/eunit.hrl").

totals(List) -> [{Product, Price * Quantity * 1.0} || {Product, Price, Quantity} <- List].

totals_test() ->
  List = [{beer, 2, 5}, {crisps, 0.50, 4}, {nuts, 0.75, 2}],
  [{beer, 10.00}, {crisps, 2.00}, {nuts, 1.50}] = totals(List).
