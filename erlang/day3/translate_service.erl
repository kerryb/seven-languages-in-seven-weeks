-module(translate_service).
-export([start/0, translate/2, kill/1]).

loop() ->
  receive
    {From, "casa"} ->
      From ! "house",
      loop();

    {From, "blanca"} ->
      From ! "white",
      loop();

    {From, die} ->
      From ! "Aargh!",
      erlang:raise(exit, "Aargh!", []);

    {From, _} ->
      From ! "I don't understand.",
      loop()
  end.

start() -> spawn(fun loop/0).

translate(To, Word) ->
  To ! {self(), Word},
  receive
    Translation -> Translation
  end.

kill(Victim) -> Victim ! {self, die},
  receive
    LastWords -> LastWords
  end.
