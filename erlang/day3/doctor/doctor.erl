-module(doctor).
-export([loop/0, start/0]).
loop() ->
  process_flag(trap_exit, true),
  receive
    new ->
      io:format("Creating and monitoring process.~n"),
      register(revolver, spawn_link(fun roulette:loop/0)),
      loop();
    die -> exit({doctor,die,at,erlang:time()});
    {'EXIT', From, Reason} ->
      io:format("The shooter ~p died with reason ~p.", [From, Reason]),
      io:format(" Restarting. ~n"),
      self() ! new,
      loop()
  end.

start() ->
  register(doctor, spawn(fun doctor:loop/0)),
  doctor ! new.
