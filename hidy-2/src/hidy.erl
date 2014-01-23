-module(hidy).
-behaviour(application).
-behaviour(supervisor).

-export([start/2, stop/1]).
-export([init/1]).
-define(SERVER, hidy_sup).

start(_Type, _Args) ->
    supervisor:start_link({local, ?SERVER}, ?MODULE, []).
    
stop(_State) ->
    ok.
    
%% the supervisor callbacks
init(_Args) ->
    SupStra = {one_for_all, 2, 1},
    HidyServer = {hidy_server, {hidy_server, start_link, []},
                    permanent, 10, worker, [hidy_server]},
    {ok, {SupStra,[HidyServer]}}.
