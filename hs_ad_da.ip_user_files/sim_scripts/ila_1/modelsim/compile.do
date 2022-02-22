vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xil_defaultlib
vlib modelsim_lib/msim/xpm

vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib
vmap xpm modelsim_lib/msim/xpm

vlog -work xil_defaultlib -64 -incr -sv "+incdir+../../../../hs_ad_da.srcs/sources_1/ip/ila_1/hdl/verilog" \
"D:/vivado2018/Vivado/2018.3/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"D:/vivado2018/Vivado/2018.3/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -64 -93 \
"D:/vivado2018/Vivado/2018.3/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work xil_defaultlib -64 -incr "+incdir+../../../../hs_ad_da.srcs/sources_1/ip/ila_1/hdl/verilog" \
"../../../../hs_ad_da.srcs/sources_1/ip/ila_1/sim/ila_1.v" \

vlog -work xil_defaultlib \
"glbl.v"

