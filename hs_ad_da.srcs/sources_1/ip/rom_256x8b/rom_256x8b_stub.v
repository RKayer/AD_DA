// Copyright 1986-2018 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2018.3 (win64) Build 2405991 Thu Dec  6 23:38:27 MST 2018
// Date        : Wed Nov 13 10:26:03 2019
// Host        : USER-20180123QP running 64-bit Service Pack 1  (build 7601)
// Command     : write_verilog -force -mode synth_stub -rename_top rom_256x8b -prefix
//               rom_256x8b_ rom_256x8b_stub.v
// Design      : rom_256x8b
// Purpose     : Stub declaration of top-level module interface
// Device      : xc7z020clg400-2
// --------------------------------------------------------------------------------

// This empty module with port declaration file causes synthesis tools to infer a black box for IP.
// The synthesis directives are for Synopsys Synplify support to prevent IO buffer insertion.
// Please paste the declaration into a Verilog source file or add the file as an additional source.
(* x_core_info = "blk_mem_gen_v8_4_2,Vivado 2018.3" *)
module rom_256x8b(clka, addra, douta)
/* synthesis syn_black_box black_box_pad_pin="clka,addra[7:0],douta[7:0]" */;
  input clka;
  input [7:0]addra;
  output [7:0]douta;
endmodule
