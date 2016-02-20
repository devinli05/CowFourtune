-module(hello_handler).
-behaviour(cowboy_http_handler).

-export([init/3]).
-export([handle/2]).
-export([terminate/3]).

-record(state, {
}).

init(_, Req, _Opts) ->
	{ok, Req, #state{}}.

handle(Req, State=#state{}) ->
	%Msg = os:cmd("fortune | cowsay"),
	{ok, Req2} = cowboy_req:reply(200, 
	[{<<"content-type">>, <<"text/plain">>}],
        <<"hello erlang!">>,
	Req),
	{ok, Req2, State}.

terminate(_Reason, _Req, _State) ->
	ok.