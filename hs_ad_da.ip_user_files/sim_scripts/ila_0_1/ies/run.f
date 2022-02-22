-makelib ies_lib/xil_defaultlib -sv \
  "D:/vivado2018/Vivado/2018.3/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
  "D:/vivado2018/Vivado/2018.3/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \
-endlib
-makelib ies_lib/xpm \
  "D:/vivado2018/Vivado/2018.3/data/ip/xpm/xpm_VCOMP.vhd" \
-endlib
-makelib ies_lib/xil_defaultlib \
  "../../../../hs_ad_da.srcs/sources_1/ip/ila_0_1/sim/ila_0.v" \
-endlib
-makelib ies_lib/xil_defaultlib \
  glbl.v
-endlib

