-module(ggclient).
-compile(export_all).
-compile(nowarn_export_all).

start(S) ->
    spawn(?MODULE,client_loop,[S]).

client_loop(S) ->
    S!{self(),start},
    receive
	{ok,SPID} ->
	    client_loop_sl(SPID,rand:uniform(100),0)
    end.

client_loop_sl(SPID,N,C) ->
    SPID!{self(),guess,N},
    receive
	{gotIt} ->
	    io:format("~w got it in ~p tries\n",[self(),C]);
	{tryAgain} ->
	    client_loop_sl(SPID,rand:uniform(100),C+1)
    end.
