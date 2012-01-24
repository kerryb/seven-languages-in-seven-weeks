-module(translate).
-export([loop/0, start/0, translate/1, terminate/0]).
loop() ->
  process_flag(trap_exit, true), 
  receive
    new ->
      io:format("Creating and monitoring process.~n"),
      register(translator, spawn_link(fun translate_service:loop/0)),
      loop();
    {'EXIT', From, Reason} -> 
      io:format("The translator ~p died. Its last words were '~p'.~n", [From, Reason]),
      io:format("Restarting. ~n"),
      self() ! new, 
      loop()
  end.

start() ->
  Pid = spawn(fun loop/0),
  Pid ! new.

translate(Word) ->
  translator ! {self(), Word},
  receive
    Translation -> Translation
  end.

terminate() -> translator ! die.
