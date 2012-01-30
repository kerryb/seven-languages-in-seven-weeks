-module(roulette).
-export([loop/0]).

% send a number, 1-6
loop() ->
  process_flag(trap_exit, true),
  receive
    3 -> io:format("bang.~n"), exit({roulette,die,at,erlang:time()});
    new ->
      io:format("Creating and monitoring process.~n"),
      register(doctor, spawn_link(fun doctor:loop/0)),
      loop();
    {'EXIT', From, Reason} ->
      io:format("The doctor ~p died with reason ~p.", [From, Reason]),
      io:format(" Restarting. ~n"),
      self() ! new,
      loop();
    _ -> io:format("click~n"), loop()
  end.
