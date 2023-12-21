-module(gg).
-compile(export_all).
-compile(nowarn_export_all).

start() ->
    spawn(?MODULE,server_loop,[]).

server_loop() ->
    receive
	{From,start} ->
	    Sl = spawn(?MODULE,server_loop_sl,[From,rand:uniform(100)]),
	    From!{ok,Sl},
	    server_loop()
    end.

server_loop_sl(Cl,N) ->
    receive
	{Cl,guess,M} when M==N ->
	    Cl!{gotIt};
	{Cl,guess,M} when M/=N ->
	    Cl!{tryAgain},
	    server_loop_sl(Cl,N)
    end.
