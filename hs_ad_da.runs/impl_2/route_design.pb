
Q
Command: %s
53*	vivadotcl2 
route_design2default:defaultZ4-113h px? 
?
@Attempting to get a license for feature '%s' and/or device '%s'
308*common2"
Implementation2default:default2
xc7z0102default:defaultZ17-347h px? 
?
0Got license for feature '%s' and/or device '%s'
310*common2"
Implementation2default:default2
xc7z0102default:defaultZ17-349h px? 
p
,Running DRC as a precondition to command %s
22*	vivadotcl2 
route_design2default:defaultZ4-22h px? 
P
Running DRC with %s threads
24*drc2
22default:defaultZ23-27h px? 
V
DRC finished with %s
79*	vivadotcl2
0 Errors2default:defaultZ4-198h px? 
e
BPlease refer to the DRC report (report_drc) for more information.
80*	vivadotclZ4-199h px? 
V

Starting %s Task
103*constraints2
Routing2default:defaultZ18-103h px? 
}
BMultithreading enabled for route_design using a maximum of %s CPUs17*	routeflow2
22default:defaultZ35-254h px? 
p

Phase %s%s
101*constraints2
1 2default:default2#
Build RT Design2default:defaultZ18-101h px? 
C
.Phase 1 Build RT Design | Checksum: 17293f13a
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:00:18 ; elapsed = 00:00:15 . Memory (MB): peak = 1728.688 ; gain = 0.0002default:defaulth px? 
v

Phase %s%s
101*constraints2
2 2default:default2)
Router Initialization2default:defaultZ18-101h px? 
o

Phase %s%s
101*constraints2
2.1 2default:default2 
Create Timer2default:defaultZ18-101h px? 
B
-Phase 2.1 Create Timer | Checksum: 17293f13a
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:00:19 ; elapsed = 00:00:16 . Memory (MB): peak = 1728.688 ; gain = 0.0002default:defaulth px? 
{

Phase %s%s
101*constraints2
2.2 2default:default2,
Fix Topology Constraints2default:defaultZ18-101h px? 
N
9Phase 2.2 Fix Topology Constraints | Checksum: 17293f13a
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:00:19 ; elapsed = 00:00:16 . Memory (MB): peak = 1728.688 ; gain = 0.0002default:defaulth px? 
t

Phase %s%s
101*constraints2
2.3 2default:default2%
Pre Route Cleanup2default:defaultZ18-101h px? 
G
2Phase 2.3 Pre Route Cleanup | Checksum: 17293f13a
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:00:19 ; elapsed = 00:00:16 . Memory (MB): peak = 1728.688 ; gain = 0.0002default:defaulth px? 
p

Phase %s%s
101*constraints2
2.4 2default:default2!
Update Timing2default:defaultZ18-101h px? 
C
.Phase 2.4 Update Timing | Checksum: 16e3d05e5
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:00:27 ; elapsed = 00:00:22 . Memory (MB): peak = 1728.688 ; gain = 0.0002default:defaulth px? 
?
Intermediate Timing Summary %s164*route2L
8| WNS=2.570  | TNS=0.000  | WHS=-0.941 | THS=-1845.823|
2default:defaultZ35-416h px? 
}

Phase %s%s
101*constraints2
2.5 2default:default2.
Update Timing for Bus Skew2default:defaultZ18-101h px? 
r

Phase %s%s
101*constraints2
2.5.1 2default:default2!
Update Timing2default:defaultZ18-101h px? 
D
/Phase 2.5.1 Update Timing | Checksum: d88853dd
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:00:30 ; elapsed = 00:00:24 . Memory (MB): peak = 1728.688 ; gain = 0.0002default:defaulth px? 
?
Intermediate Timing Summary %s164*route2J
6| WNS=2.570  | TNS=0.000  | WHS=N/A    | THS=N/A    |
2default:defaultZ35-416h px? 
P
;Phase 2.5 Update Timing for Bus Skew | Checksum: 1243ffc3f
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:00:30 ; elapsed = 00:00:24 . Memory (MB): peak = 1728.688 ; gain = 0.0002default:defaulth px? 
H
3Phase 2 Router Initialization | Checksum: e3bedc6e
*commonh px? 
?

%s
*constraints2o
[Time (s): cpu = 00:00:30 ; elapsed = 00:00:24 . Memory (MB): peak = 1728.688 ; gain = 0.0002default:defaulth px? 
p

Phase %s%s
101*constraints2
3 2default:default2#
Initial Routing2default:defaultZ18-101h px? 
B
-Phase 3 Initial Routing | Checksum: b2fe97e7
*commonh px? 
?

%s
*constraints2p
\Time (s): cpu = 00:00:54 ; elapsed = 00:00:37 . Memory (MB): peak = 1756.984 ; gain = 28.2972default:defaulth px? 
s

Phase %s%s
101*constraints2
4 2default:default2&
Rip-up And Reroute2default:defaultZ18-101h px? 
u

Phase %s%s
101*constraints2
4.1 2default:default2&
Global Iteration 02default:defaultZ18-101h px? 
?
Intermediate Timing Summary %s164*route2J
6| WNS=0.007  | TNS=0.000  | WHS=N/A    | THS=N/A    |
2default:defaultZ35-416h px? 
G
2Phase 4.1 Global Iteration 0 | Checksum: c69c5728
*commonh px? 
?

%s
*constraints2p
\Time (s): cpu = 00:05:35 ; elapsed = 00:03:49 . Memory (MB): peak = 1762.527 ; gain = 33.8402default:defaulth px? 
E
0Phase 4 Rip-up And Reroute | Checksum: c69c5728
*commonh px? 
?

%s
*constraints2p
\Time (s): cpu = 00:05:35 ; elapsed = 00:03:49 . Memory (MB): peak = 1762.527 ; gain = 33.8402default:defaulth px? 
|

Phase %s%s
101*constraints2
5 2default:default2/
Delay and Skew Optimization2default:defaultZ18-101h px? 
p

Phase %s%s
101*constraints2
5.1 2default:default2!
Delay CleanUp2default:defaultZ18-101h px? 
r

Phase %s%s
101*constraints2
5.1.1 2default:default2!
Update Timing2default:defaultZ18-101h px? 
D
/Phase 5.1.1 Update Timing | Checksum: a60320ca
*commonh px? 
?

%s
*constraints2p
\Time (s): cpu = 00:05:36 ; elapsed = 00:03:50 . Memory (MB): peak = 1762.527 ; gain = 33.8402default:defaulth px? 
?
Intermediate Timing Summary %s164*route2J
6| WNS=0.007  | TNS=0.000  | WHS=N/A    | THS=N/A    |
2default:defaultZ35-416h px? 
C
.Phase 5.1 Delay CleanUp | Checksum: 10bd8322e
*commonh px? 
?

%s
*constraints2p
\Time (s): cpu = 00:05:37 ; elapsed = 00:03:50 . Memory (MB): peak = 1762.527 ; gain = 33.8402default:defaulth px? 
z

Phase %s%s
101*constraints2
5.2 2default:default2+
Clock Skew Optimization2default:defaultZ18-101h px? 
M
8Phase 5.2 Clock Skew Optimization | Checksum: 10bd8322e
*commonh px? 
?

%s
*constraints2p
\Time (s): cpu = 00:05:37 ; elapsed = 00:03:50 . Memory (MB): peak = 1762.527 ; gain = 33.8402default:defaulth px? 
O
:Phase 5 Delay and Skew Optimization | Checksum: 10bd8322e
*commonh px? 
?

%s
*constraints2p
\Time (s): cpu = 00:05:37 ; elapsed = 00:03:50 . Memory (MB): peak = 1762.527 ; gain = 33.8402default:defaulth px? 
n

Phase %s%s
101*constraints2
6 2default:default2!
Post Hold Fix2default:defaultZ18-101h px? 
p

Phase %s%s
101*constraints2
6.1 2default:default2!
Hold Fix Iter2default:defaultZ18-101h px? 
r

Phase %s%s
101*constraints2
6.1.1 2default:default2!
Update Timing2default:defaultZ18-101h px? 
E
0Phase 6.1.1 Update Timing | Checksum: 142938e5b
*commonh px? 
?

%s
*constraints2p
\Time (s): cpu = 00:05:38 ; elapsed = 00:03:51 . Memory (MB): peak = 1762.527 ; gain = 33.8402default:defaulth px? 
?
Intermediate Timing Summary %s164*route2J
6| WNS=0.007  | TNS=0.000  | WHS=-0.596 | THS=-0.994 |
2default:defaultZ35-416h px? 
?

Phase %s%s
101*constraints2
6.1.2 2default:default25
!Lut RouteThru Assignment for hold2default:defaultZ18-101h px? 
Y
DPhase 6.1.2 Lut RouteThru Assignment for hold | Checksum: 18531c807
*commonh px? 
?

%s
*constraints2p
\Time (s): cpu = 00:05:39 ; elapsed = 00:03:52 . Memory (MB): peak = 1762.527 ; gain = 33.8402default:defaulth px? 
C
.Phase 6.1 Hold Fix Iter | Checksum: 18531c807
*commonh px? 
?

%s
*constraints2p
\Time (s): cpu = 00:05:39 ; elapsed = 00:03:52 . Memory (MB): peak = 1762.527 ; gain = 33.8402default:defaulth px? 
v

Phase %s%s
101*constraints2
6.2 2default:default2'
Additional Hold Fix2default:defaultZ18-101h px? 
?
Intermediate Timing Summary %s164*route2J
6| WNS=0.007  | TNS=0.000  | WHS=-0.596 | THS=-0.969 |
2default:defaultZ35-416h px? 
I
4Phase 6.2 Additional Hold Fix | Checksum: 1b98fd9af
*commonh px? 
?

%s
*constraints2p
\Time (s): cpu = 00:05:41 ; elapsed = 00:03:53 . Memory (MB): peak = 1762.527 ; gain = 33.8402default:defaulth px? 
A
,Phase 6 Post Hold Fix | Checksum: 1a3ac7724
*commonh px? 
?

%s
*constraints2p
\Time (s): cpu = 00:05:42 ; elapsed = 00:03:55 . Memory (MB): peak = 1762.527 ; gain = 33.8402default:defaulth px? 
o

Phase %s%s
101*constraints2
7 2default:default2"
Route finalize2default:defaultZ18-101h px? 
B
-Phase 7 Route finalize | Checksum: 1d9ccf327
*commonh px? 
?

%s
*constraints2p
\Time (s): cpu = 00:05:42 ; elapsed = 00:03:55 . Memory (MB): peak = 1762.527 ; gain = 33.8402default:defaulth px? 
v

Phase %s%s
101*constraints2
8 2default:default2)
Verifying routed nets2default:defaultZ18-101h px? 
I
4Phase 8 Verifying routed nets | Checksum: 1d9ccf327
*commonh px? 
?

%s
*constraints2p
\Time (s): cpu = 00:05:42 ; elapsed = 00:03:55 . Memory (MB): peak = 1762.527 ; gain = 33.8402default:defaulth px? 
r

Phase %s%s
101*constraints2
9 2default:default2%
Depositing Routes2default:defaultZ18-101h px? 
E
0Phase 9 Depositing Routes | Checksum: 21d11c785
*commonh px? 
?

%s
*constraints2p
\Time (s): cpu = 00:05:44 ; elapsed = 00:03:56 . Memory (MB): peak = 1762.527 ; gain = 33.8402default:defaulth px? 
?
SRouter was unable to fix hold violation on pin %s driven by global clock buffer %s.167*route2M
9ila_1/inst/ila_core_inst/shifted_data_in_reg[7][8]_srl8/D2default:default2!
BUFGCTRL_X0Y32default:defaultZ35-419h px? 
?
SRouter was unable to fix hold violation on pin %s driven by global clock buffer %s.167*route2E
1ila_1/inst/ila_core_inst/probeDelay1[0]_i_1__0/I12default:default2!
BUFGCTRL_X0Y32default:defaultZ35-419h px? 
t

Phase %s%s
101*constraints2
10 2default:default2&
Post Router Timing2default:defaultZ18-101h px? 
q

Phase %s%s
101*constraints2
10.1 2default:default2!
Update Timing2default:defaultZ18-101h px? 
D
/Phase 10.1 Update Timing | Checksum: 24865ebcb
*commonh px? 
?

%s
*constraints2p
\Time (s): cpu = 00:05:45 ; elapsed = 00:03:57 . Memory (MB): peak = 1762.527 ; gain = 33.8402default:defaulth px? 
?
Estimated Timing Summary %s
57*route2J
6| WNS=0.007  | TNS=0.000  | WHS=-0.596 | THS=-0.969 |
2default:defaultZ35-57h px? 
B
!Router estimated timing not met.
128*routeZ35-328h px? 
G
2Phase 10 Post Router Timing | Checksum: 24865ebcb
*commonh px? 
?

%s
*constraints2p
\Time (s): cpu = 00:05:45 ; elapsed = 00:03:57 . Memory (MB): peak = 1762.527 ; gain = 33.8402default:defaulth px? 
@
Router Completed Successfully
2*	routeflowZ35-16h px? 
?

%s
*constraints2p
\Time (s): cpu = 00:05:45 ; elapsed = 00:03:57 . Memory (MB): peak = 1762.527 ; gain = 33.8402default:defaulth px? 
Z
Releasing license: %s
83*common2"
Implementation2default:defaultZ17-83h px? 
?
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
1012default:default2
612default:default2
02default:default2
02default:defaultZ4-41h px? 
^
%s completed successfully
29*	vivadotcl2 
route_design2default:defaultZ4-42h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2"
route_design: 2default:default2
00:05:492default:default2
00:03:592default:default2
1762.5272default:default2
33.8402default:defaultZ17-268h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2 
00:00:00.0102default:default2
1762.5272default:default2
0.0002default:defaultZ17-268h px? 
H
&Writing timing data to binary archive.266*timingZ38-480h px? 
D
Writing placer database...
1603*designutilsZ20-1893h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2.
Netlist sorting complete. 2default:default2
00:00:002default:default2 
00:00:00.0102default:default2
1762.5272default:default2
0.0002default:defaultZ17-268h px? 
=
Writing XDEF routing.
211*designutilsZ20-211h px? 
J
#Writing XDEF routing logical nets.
209*designutilsZ20-209h px? 
J
#Writing XDEF routing special nets.
210*designutilsZ20-210h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2)
Write XDEF Complete: 2default:default2
00:00:062default:default2
00:00:022default:default2
1762.5272default:default2
0.0002default:defaultZ17-268h px? 
?
 The %s '%s' has been generated.
621*common2

checkpoint2default:default2\
HD:/FPGA/ZYNQ_7010_FPGA/hs_ad_da/hs_ad_da.runs/impl_2/hs_ad_da_routed.dcp2default:defaultZ17-1381h px? 
?
%s4*runtcl2?
mExecuting : report_drc -file hs_ad_da_drc_routed.rpt -pb hs_ad_da_drc_routed.pb -rpx hs_ad_da_drc_routed.rpx
2default:defaulth px? 
?
Command: %s
53*	vivadotcl2t
`report_drc -file hs_ad_da_drc_routed.rpt -pb hs_ad_da_drc_routed.pb -rpx hs_ad_da_drc_routed.rpx2default:defaultZ4-113h px? 
>
IP Catalog is up to date.1232*coregenZ19-1839h px? 
P
Running DRC with %s threads
24*drc2
22default:defaultZ23-27h px? 
?
#The results of DRC are in file %s.
168*coretcl2?
LD:/FPGA/ZYNQ_7010_FPGA/hs_ad_da/hs_ad_da.runs/impl_2/hs_ad_da_drc_routed.rptLD:/FPGA/ZYNQ_7010_FPGA/hs_ad_da/hs_ad_da.runs/impl_2/hs_ad_da_drc_routed.rpt2default:default8Z2-168h px? 
\
%s completed successfully
29*	vivadotcl2

report_drc2default:defaultZ4-42h px? 
?
%s4*runtcl2?
?Executing : report_methodology -file hs_ad_da_methodology_drc_routed.rpt -pb hs_ad_da_methodology_drc_routed.pb -rpx hs_ad_da_methodology_drc_routed.rpx
2default:defaulth px? 
?
Command: %s
53*	vivadotcl2?
?report_methodology -file hs_ad_da_methodology_drc_routed.rpt -pb hs_ad_da_methodology_drc_routed.pb -rpx hs_ad_da_methodology_drc_routed.rpx2default:defaultZ4-113h px? 
E
%Done setting XDC timing constraints.
35*timingZ38-35h px? 
Y
$Running Methodology with %s threads
74*drc2
22default:defaultZ23-133h px? 
?
2The results of Report Methodology are in file %s.
450*coretcl2?
XD:/FPGA/ZYNQ_7010_FPGA/hs_ad_da/hs_ad_da.runs/impl_2/hs_ad_da_methodology_drc_routed.rptXD:/FPGA/ZYNQ_7010_FPGA/hs_ad_da/hs_ad_da.runs/impl_2/hs_ad_da_methodology_drc_routed.rpt2default:default8Z2-1520h px? 
d
%s completed successfully
29*	vivadotcl2&
report_methodology2default:defaultZ4-42h px? 
?
I%sTime (s): cpu = %s ; elapsed = %s . Memory (MB): peak = %s ; gain = %s
268*common2(
report_methodology: 2default:default2
00:00:122default:default2
00:00:072default:default2
1775.8552default:default2
13.3282default:defaultZ17-268h px? 
?
%s4*runtcl2?
}Executing : report_power -file hs_ad_da_power_routed.rpt -pb hs_ad_da_power_summary_routed.pb -rpx hs_ad_da_power_routed.rpx
2default:defaulth px? 
?
Command: %s
53*	vivadotcl2?
preport_power -file hs_ad_da_power_routed.rpt -pb hs_ad_da_power_summary_routed.pb -rpx hs_ad_da_power_routed.rpx2default:defaultZ4-113h px? 
E
%Done setting XDC timing constraints.
35*timingZ38-35h px? 
K
,Running Vector-less Activity Propagation...
51*powerZ33-51h px? 
P
3
Finished Running Vector-less Activity Propagation
1*powerZ33-1h px? 
?
G%s Infos, %s Warnings, %s Critical Warnings and %s Errors encountered.
28*	vivadotcl2
1132default:default2
612default:default2
02default:default2
02default:defaultZ4-41h px? 
^
%s completed successfully
29*	vivadotcl2 
report_power2default:defaultZ4-42h px? 
?
%s4*runtcl2q
]Executing : report_route_status -file hs_ad_da_route_status.rpt -pb hs_ad_da_route_status.pb
2default:defaulth px? 
?
%s4*runtcl2?
?Executing : report_timing_summary -max_paths 10 -file hs_ad_da_timing_summary_routed.rpt -pb hs_ad_da_timing_summary_routed.pb -rpx hs_ad_da_timing_summary_routed.rpx -warn_on_violation 
2default:defaulth px? 
r
UpdateTimingParams:%s.
91*timing29
% Speed grade: -1, Delay Type: min_max2default:defaultZ38-91h px? 
|
CMultithreading enabled for timing update using a maximum of %s CPUs155*timing2
22default:defaultZ38-191h px? 
?
rThe design failed to meet the timing requirements. Please see the %s report for details on the timing violations.
188*timing2"
timing summary2default:defaultZ38-282h px? 
?
}There are set_bus_skew constraint(s) in this design. Please run report_bus_skew to ensure that bus skew requirements are met.223*timingZ38-436h px? 
?
%s4*runtcl2e
QExecuting : report_incremental_reuse -file hs_ad_da_incremental_reuse_routed.rpt
2default:defaulth px? 
g
BIncremental flow is disabled. No incremental reuse Info to report.423*	vivadotclZ4-1062h px? 
?
%s4*runtcl2e
QExecuting : report_clock_utilization -file hs_ad_da_clock_utilization_routed.rpt
2default:defaulth px? 
?
%s4*runtcl2?
?Executing : report_bus_skew -warn_on_violation -file hs_ad_da_bus_skew_routed.rpt -pb hs_ad_da_bus_skew_routed.pb -rpx hs_ad_da_bus_skew_routed.rpx
2default:defaulth px? 
r
UpdateTimingParams:%s.
91*timing29
% Speed grade: -1, Delay Type: min_max2default:defaultZ38-91h px? 
|
CMultithreading enabled for timing update using a maximum of %s CPUs155*timing2
22default:defaultZ38-191h px? 


End Record