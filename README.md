hidy_release_upgrade
====================

###[root@localhost releases]# erl
```
Erlang R16B03 (erts-5.10.4) [source] [64-bit] [async-threads:10] [hipe] [kernel-poll:false]

Eshell V5.10.4  (abort with ^G)

1> application:start(sasl).

=PROGRESS REPORT==== 23-Jan-2014::12:39:59 ===
          supervisor: {local,sasl_safe_sup}
             started: [{pid,<0.39.0>},
                       {name,alarm_handler},
                       {mfargs,{alarm_handler,start_link,[]}},
                       {restart_type,permanent},
                       {shutdown,2000},
                       {child_type,worker}]

=PROGRESS REPORT==== 23-Jan-2014::12:39:59 ===
          supervisor: {local,sasl_safe_sup}
             started: [{pid,<0.40.0>},
                       {name,overload},
                       {mfargs,{overload,start_link,[]}},
                       {restart_type,permanent},
                       {shutdown,2000},
                       {child_type,worker}]


=PROGRESS REPORT==== 23-Jan-2014::12:39:59 ===
          supervisor: {local,sasl_sup}
             started: [{pid,<0.38.0>},
                       {name,sasl_safe_sup},
                       {mfargs,
                           {supervisor,start_link,
                               [{local,sasl_safe_sup},sasl,safe]}},
                       {restart_type,permanent},
                       {shutdown,infinity},
                       {child_type,supervisor}]

=PROGRESS REPORT==== 23-Jan-2014::12:39:59 ===
          supervisor: {local,sasl_sup}
             started: [{pid,<0.41.0>},
                       {name,release_handler},
                       {mfargs,{release_handler,start_link,[]}},
                       {restart_type,permanent},
                       {shutdown,2000},
                       {child_type,worker}]

=PROGRESS REPORT==== 23-Jan-2014::12:39:59 ===
         application: sasl
          started_at: nonode@nohost

ok

2> release_handler:unpack_release("hidy-1").
{ok,"1"}
3> release_handler:which_releases().
[{"hidy app release","1",
  ["kernel-2.16.4","stdlib-1.19.4","sasl-2.3.4"],
  unpacked},
 {"OTP  APN 181 01","R16B03",[],permanent}]
4> release_handler:install_release("1").     
{error,{enoent,"/usr/erlang/lib/erlang/releases/R16B03/relup"}}
5> application:start(hidy_app).
{error,{"no such file or directory","hidy_app.app"}}
6> release_handler:which_releases().        
[{"hidy app release","1",
  ["kernel-2.16.4","stdlib-1.19.4","sasl-2.3.4"],
  unpacked},
 {"OTP  APN 181 01","R16B03",[],permanent}]
7> q().
ok
```
=======================
####[root@localhost releases]# erl -boot /usr/erlang/lib/erlang/releases/1/start
```
Erlang R16B03 (erts-5.10.4) [source] [64-bit] [async-threads:10] [hipe] [kernel-poll:false]


=PROGRESS REPORT==== 23-Jan-2014::14:58:41 ===
          supervisor: {local,sasl_safe_sup}
             started: [{pid,<0.35.0>},
                       {name,alarm_handler},
                       {mfargs,{alarm_handler,start_link,[]}},
                       {restart_type,permanent},
                       {shutdown,2000},
                       {child_type,worker}]

=PROGRESS REPORT==== 23-Jan-2014::14:58:41 ===
          supervisor: {local,sasl_safe_sup}
             started: [{pid,<0.36.0>},
                       {name,overload},
                       {mfargs,{overload,start_link,[]}},
                       {restart_type,permanent},
                       {shutdown,2000},
                       {child_type,worker}]

=PROGRESS REPORT==== 23-Jan-2014::14:58:41 ===
          supervisor: {local,sasl_sup}
             started: [{pid,<0.34.0>},
                       {name,sasl_safe_sup},
                       {mfargs,
                           {supervisor,start_link,
                               [{local,sasl_safe_sup},sasl,safe]}},
                       {restart_type,permanent},
                       {shutdown,infinity},
                       {child_type,supervisor}]

=PROGRESS REPORT==== 23-Jan-2014::14:58:41 ===
          supervisor: {local,sasl_sup}
             started: [{pid,<0.37.0>},
                       {name,release_handler},
                       {mfargs,{release_handler,start_link,[]}},
                       {restart_type,permanent},
                       {shutdown,2000},
                       {child_type,worker}]

=PROGRESS REPORT==== 23-Jan-2014::14:58:41 ===
         application: sasl
          started_at: nonode@nohost

=PROGRESS REPORT==== 23-Jan-2014::14:58:41 ===
          supervisor: {local,hidy_sup}
             started: [{pid,<0.43.0>},
                       {name,hidy_server},
                       {mfargs,{hidy_server,start_link,[]}},
                       {restart_type,permanent},
                       {shutdown,10},
                       {child_type,worker}]

=PROGRESS REPORT==== 23-Jan-2014::14:58:41 ===
         application: hidy_app
          started_at: nonode@nohost
Eshell V5.10.4  (abort with ^G)
1>release_handler:which_releases().
[{"hidy app release","1",
  ["kernel-2.16.4","stdlib-1.19.4","sasl-2.3.4","hidy_app-1"],
  unpacked},
 {"OTP  APN 181 01","R16B03",[],permanent}]
2> release_handler:install_release("1").
{error,{enoent,"/usr/erlang/lib/erlang/releases/R16B03/relup"}}
3> release_handler:make_permanent("1").
{error,{bad_status,unpacked}}
4> release_handler:unpack_release("hidy-2").
{ok,"2"}
5> release_handler:install_release("2").     
{error,{enoent,"/usr/erlang/lib/erlang/releases/R16B03/relup"}}
6> release_handler:which_releases().         
[{"hidy app release","2",
  ["kernel-2.16.4","stdlib-1.19.4","sasl-2.3.4","hidy_app-2"],
  unpacked},
 {"hidy app release","1",
  ["kernel-2.16.4","stdlib-1.19.4","sasl-2.3.4","hidy_app-1"],
  unpacked},
 {"OTP  APN 181 01","R16B03",[],permanent}]
7> release_handler:make_permanent("2").
{error,{bad_status,unpacked}}
8> release_handler:which_releases().         
[{"hidy app release","2",
  ["kernel-2.16.4","stdlib-1.19.4","sasl-2.3.4","hidy_app-2"],
  unpacked},
 {"hidy app release","1",
  ["kernel-2.16.4","stdlib-1.19.4","sasl-2.3.4","hidy_app-1"],
  unpacked},
 {"OTP  APN 181 01","R16B03",[],permanent}]
9>q().
ok
```
========================


```
{sys, [
    {lib_dirs, ["/Users/tuan/Desktop/hidy_release_upgrade"]},
    {erts, [{mod_cond, derived},
            {app_file, strip}]},
    {rel, "hidy", "1",
     [kernel, stdlib, sasl, hidy_app]},
    {boot_rel, "hidy"},
    {relocatable, true},
    {profile, embedded},
    {app_file, strip},
    {incl_cond, exclude},
    {excl_app_filters, ["_tests.beam"]},
    {excl_archive_filters, [".*"]},
    {app, stdlib, [{mod_cond, derived}, {incl_cond, include}]},
    {app, kernel, [{incl_cond, include}]},
    {app, sasl, [{incl_cond, include}]},
    {app, hidy_app, [{vsn, "1"}, {incl_cond, include}]}
]}.
```

===========================

####最终还是要通过sys.config解决热更新，如果采用erlang systools 进行打包会出现各种上述奇怪问题，而且发布到默认安装的erlang目录下，一切的根源就在这里。
