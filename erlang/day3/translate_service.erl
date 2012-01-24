-module(translate_service).
-export([loop/0]).

loop() ->
  receive
    {From, "casa"} ->
      From ! "house",
      loop();

    {From, "blanca"} ->
      From ! "white",
      loop();

    die ->
      erlang:raise(exit, "Aargh!", []);

    {From, _} ->
      From ! "I don't understand.",
      loop()
  end.
