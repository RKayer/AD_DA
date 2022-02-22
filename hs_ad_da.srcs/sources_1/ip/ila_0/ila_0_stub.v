// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
// Date        : Wed Nov 13 11:56:58 2019
// Host        : USER-20180123QP running 64-bit Service Pack 1  (build 7601)
// Command     : write_verilog -force -mode synth_stub -rename_top ila_0 -prefix
//               ila_0_ ila_0_stub.v
// Design      : ila_0
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg400-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* X_CORE_INFO = "ila,Vivado 2018.3" *)
module ila_0(clk, probe0, probe1)
/* synthesis syn_black_box black_box_pad_pin="clk,probe0[0:0],probe1[7:0]" */;
  input clk;
  input [0:0]probe0;
  input [7:0]probe1;
endmodule
