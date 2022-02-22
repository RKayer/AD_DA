onbreak {quit -force}
onerror {quit -force}

asim -t 1ps +access +r +m+rom_256x8b -L xil_defaultlib -L xpm -L blk_mem_gen_v8_4_2 -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.rom_256x8b xil_defaultlib.glbl

do {wave.do}

view wave
view structure

do {rom_256x8b.udo}

run -all

endsim

quit -force
