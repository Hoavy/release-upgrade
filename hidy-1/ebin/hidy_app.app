{application, hidy_app,
    [{description, "tiny app 1.0"},
     {vsn, "1"},
     {modules, [hidy, hidy_server]},
     {registered, []},
     {applications, [kernel, stdlib, sasl]},
     {mod, {hidy, []}}
    ]
}.
