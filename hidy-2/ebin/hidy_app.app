{application, hidy_app,
    [{description, "tiny app 2.0"},
     {vsn, "2"},
     {modules, [hidy, hidy_server]},
     {registered, []},
     {applications, [kernel, stdlib, sasl]},
     {mod, {hidy, []}}
    ]
}.
