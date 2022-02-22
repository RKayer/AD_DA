-makelib ies_lib/xil_defaultlib -sv \
  "D:/vivado2018/Vivado/2018.3/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
  "D:/vivado2018/Vivado/2018.3/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \
-endlib
-makelib ies_lib/xpm \
  "D:/vivado2018/Vivado/2018.3/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib ies_lib/blk_mem_gen_v8_4_2 \
  "../../../ipstatic/simulation/blk_mem_gen_v8_4.v" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../../hs_ad_da.srcs/sources_1/ip/rom_256x8b_1/sim/rom_256x8b.v" \
-endlib
-makelib ies_lib/xil_defaultlib \
  glbl.v
-endlib

