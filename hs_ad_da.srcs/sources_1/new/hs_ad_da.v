/********************************************************************************************

author: 祝光
date: 2022/2/24

*********************************************************************************************/

module hs_ad_da(
    input                 sys_clk     ,  //系统时钟
    input                 sys_rst_n   ,  //系统复位，低电平有效
    //DA芯片接口
    output                da_clk      ,  //DA(AD9708)驱动时钟,最大支持125Mhz时钟
    output    [7:0]       da_data     ,  //输出给DA的数据
    //AD芯片接口
    input     [7:0]       ad_data     ,  //AD输入数据
    //模拟输入电压超出量程标志(本次试验未用到)
    input                 ad_otr      ,  //0:在量程范围 1:超出量程
    output                ad_clk      ,  //AD(AD9280)驱动时钟,最大支持32Mhz时钟
    
    //RGB LCD接口
    output               lcd_de,      //LCD 数据使能信号
    output               lcd_hs,      //LCD 行同步信号
    output               lcd_vs,      //LCD 场同步信号
    output               lcd_bl,      //LCD 背光控制信号
    output               lcd_clk,     //LCD 像素时钟
    output               lcd_rst,     //LCD 复位
    inout        [23:0]  lcd_rgb      //LCD RGB888颜色数据 
);

//wire define_ad_da 
wire      [7:0]    rd_addr;              //ROM读地址
wire      [7:0]    rd_data;              //ROM读出的数据

wire               lcd_en;
//wire define_FIFO
(*mark_debug = "true"*) wire         fifo_wr_en         ;  // FIFO写使能信号//*****************************************************
(*mark_debug = "true"*) wire         fifo_rd_en         ;  // FIFO读使能信号//**                    main code
(*mark_debug = "true"*) wire  [7:0]  fifo_dout          ;  // 从FIFO读出的数据
(*mark_debug = "true"*) wire         almost_full        ;  // FIFO将满信号//DA数据发送
(*mark_debug = "true"*) wire         almost_empty       ;  // FIFO将空信号da_wave_send u_da_wave_send(
(*mark_debug = "true"*) wire         fifo_full          ;  // FIFO满信号    .clk         (sys_clk), 
(*mark_debug = "true"*) wire         fifo_empty         ;  // FIFO空信号    .rst_n       (sys_rst_n),
(*mark_debug = "true"*) wire  [9:0]  fifo_wr_data_count ;  // FIFO写时钟域的数据计数    .rd_data     (rd_data),
(*mark_debug = "true"*) wire  [9:0]  fifo_rd_data_count ;  // FIFO读时钟域的数据计数    .rd_addr     (rd_addr),



//*****************************************************
//**                    main code
//*****************************************************

//DA数据发送
da_wave_send u_da_wave_send(
    .clk         (sys_clk), 
    .rst_n       (sys_rst_n),
    .rd_data     (rd_data),
    .rd_addr     (rd_addr),
    .da_clk      (da_clk),  
    .da_data     (da_data)
    );

//ROM存储波形
rom_256x8b  u_rom_256x8b (
  .clka  (sys_clk),    // input wire clka
  .addra (rd_addr),    // input wire [7 : 0] addra
  .douta (rd_data)     // output wire [7 : 0] douta
);

//AD数据接收
ad_wave_rec u_ad_wave_rec(
    .clk         (sys_clk),
    .rst_n       (sys_rst_n),
    .ad_data     (ad_data),
    .ad_otr      (ad_otr),
    .ad_clk      (ad_clk)
    );    


//例化FIFO IP核
fifo_generator_0  u_fifo_generator_0(
  .wr_clk(ad_clk),                // input wire wr_clk
  .rd_clk(sys_clk),                // input wire rd_clk
  .din(ad_data),                      // input wire [7 : 0] din
  .wr_en(fifo_wr_en),                  // input wire wr_en
  .rd_en(fifo_rd_en),                  // input wire rd_en
  .dout(fifo_dout),                    // output wire [7 : 0] dout
  .full(fifo_full),                    // output wire full
  .almost_full(almost_full),      // output wire almost_full
  .empty(fifo_empty),                  // output wire empty
  .almost_empty(almost_empty),    // output wire almost_empty
  .rd_data_count(fifo_rd_data_count),  // output wire [8: 0] rd_data_count
  .wr_data_count(fifo_wr_data_count)  // output wire [8: 0] wr_data_count
);


//将AD数据写入到FIFO中
fifo_wr  u_fifo_wr(
    .clk            (ad_clk),       
    .rst_n          (sys_rst_n),
    .almost_empty   (almost_empty),
    .almost_full    (almost_full),
    .fifo_wr_en        (fifo_wr_en)
);



//将数据从FIFO读出
fifo_rd  u_fifo_rd(
    .lcd_en       (lcd_en),
    .clk          (sys_clk),
    .rst_n        (sys_rst_n),
    .fifo_dout    (fifo_dout),
    .almost_full  (almost_full),
    .almost_empty (almost_empty),
    .fifo_rd_en   (fifo_rd_en)
);

//例化LCD显示模块
lcd_rgb_colorbar u_lcd_rgb_colorbar(
    .lcd_en         (lcd_en),
    .sys_clk        (sys_clk),
    .sys_rst_n      (sys_rst_n),
    .lcd_de         (lcd_de ),
    .lcd_hs         (lcd_hs ),
    .lcd_vs         (lcd_vs ),
    .lcd_bl         (lcd_bl ),
    .lcd_clk        (lcd_clk),
    .lcd_rst        (lcd_rst),
    .lcd_rgb        (lcd_rgb),
    .wave_data      (fifo_dout),     //fifo的信号
    .fifo_wr_en     (fifo_wr_en)
);


//ILA采集AD数据
ila_0  ila_0 (
    .clk         (ad_clk ), // input wire clk
    .probe0      (ad_clk ), // input wire [0:0]  probe0  
    .probe1      (ad_data),  // input wire [7:0]  probe0  
    .probe2      (lcd_vs)
);

ila_1 ila_1(
    .clk        (sys_clk),
    .probe0     (fifo_dout),
    .probe1     (sys_clk)
);
endmodule