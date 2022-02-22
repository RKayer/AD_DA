vlib work
vlib riviera

vlib riviera/xil_defaultlib
vlib riviera/xpm

vmap xil_defaultlib riviera/xil_defaultlib
vmap xpm riviera/xpm

vlog -work xil_defaultlib  -sv2k12 "+incdir+../../../../hs_ad_da.srcs/sources_1/ip/ila_1/hdl/verilog" \
"D:/vivado2018/Vivado/2018.3/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"D:/vivado2018/Vivado/2018.3/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -93 \
"D:/vivado2018/Vivado/2018.3/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work xil_defaultlib  -v2k5 "+incdir+../../../../hs_ad_da.srcs/sources_1/ip/ila_1/hdl/verilog" \
"../../../../hs_ad_da.srcs/sources_1/ip/ila_1/sim/ila_1.v" \

vlog -work xil_defaultlib \
"glbl.v"

