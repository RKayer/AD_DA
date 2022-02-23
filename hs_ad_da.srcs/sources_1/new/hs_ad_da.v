/********************************************************************************************

author: ף��
date: 2022/2/24

*********************************************************************************************/

module hs_ad_da(
    input                 sys_clk     ,  //ϵͳʱ��
    input                 sys_rst_n   ,  //ϵͳ��λ���͵�ƽ��Ч
    //DAоƬ�ӿ�
    output                da_clk      ,  //DA(AD9708)����ʱ��,���֧��125Mhzʱ��
    output    [7:0]       da_data     ,  //�����DA������
    //ADоƬ�ӿ�
    input     [7:0]       ad_data     ,  //AD��������
    //ģ�������ѹ�������̱�־(��������δ�õ�)
    input                 ad_otr      ,  //0:�����̷�Χ 1:��������
    output                ad_clk      ,  //AD(AD9280)����ʱ��,���֧��32Mhzʱ��
    
    //RGB LCD�ӿ�
    output               lcd_de,      //LCD ����ʹ���ź�
    output               lcd_hs,      //LCD ��ͬ���ź�
    output               lcd_vs,      //LCD ��ͬ���ź�
    output               lcd_bl,      //LCD ��������ź�
    output               lcd_clk,     //LCD ����ʱ��
    output               lcd_rst,     //LCD ��λ
    inout        [23:0]  lcd_rgb      //LCD RGB888��ɫ���� 
);

//wire define_ad_da 
wire      [7:0]    rd_addr;              //ROM����ַ
wire      [7:0]    rd_data;              //ROM����������

wire               lcd_en;
//wire define_FIFO
(*mark_debug = "true"*) wire         fifo_wr_en         ;  // FIFOдʹ���ź�//*****************************************************
(*mark_debug = "true"*) wire         fifo_rd_en         ;  // FIFO��ʹ���ź�//**                    main code
(*mark_debug = "true"*) wire  [7:0]  fifo_dout          ;  // ��FIFO����������
(*mark_debug = "true"*) wire         almost_full        ;  // FIFO�����ź�//DA���ݷ���
(*mark_debug = "true"*) wire         almost_empty       ;  // FIFO�����ź�da_wave_send u_da_wave_send(
(*mark_debug = "true"*) wire         fifo_full          ;  // FIFO���ź�    .clk         (sys_clk), 
(*mark_debug = "true"*) wire         fifo_empty         ;  // FIFO���ź�    .rst_n       (sys_rst_n),
(*mark_debug = "true"*) wire  [9:0]  fifo_wr_data_count ;  // FIFOдʱ��������ݼ���    .rd_data     (rd_data),
(*mark_debug = "true"*) wire  [9:0]  fifo_rd_data_count ;  // FIFO��ʱ��������ݼ���    .rd_addr     (rd_addr),



//*****************************************************
//**                    main code
//*****************************************************

//DA���ݷ���
da_wave_send u_da_wave_send(
    .clk         (sys_clk), 
    .rst_n       (sys_rst_n),
    .rd_data     (rd_data),
    .rd_addr     (rd_addr),
    .da_clk      (da_clk),  
    .da_data     (da_data)
    );

//ROM�洢����
rom_256x8b  u_rom_256x8b (
  .clka  (sys_clk),    // input wire clka
  .addra (rd_addr),    // input wire [7 : 0] addra
  .douta (rd_data)     // output wire [7 : 0] douta
);

//AD���ݽ���
ad_wave_rec u_ad_wave_rec(
    .clk         (sys_clk),
    .rst_n       (sys_rst_n),
    .ad_data     (ad_data),
    .ad_otr      (ad_otr),
    .ad_clk      (ad_clk)
    );    


//����FIFO IP��
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


//��AD����д�뵽FIFO��
fifo_wr  u_fifo_wr(
    .clk            (ad_clk),       
    .rst_n          (sys_rst_n),
    .almost_empty   (almost_empty),
    .almost_full    (almost_full),
    .fifo_wr_en        (fifo_wr_en)
);



//�����ݴ�FIFO����
fifo_rd  u_fifo_rd(
    .lcd_en       (lcd_en),
    .clk          (sys_clk),
    .rst_n        (sys_rst_n),
    .fifo_dout    (fifo_dout),
    .almost_full  (almost_full),
    .almost_empty (almost_empty),
    .fifo_rd_en   (fifo_rd_en)
);

//����LCD��ʾģ��
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
    .wave_data      (fifo_dout),     //fifo���ź�
    .fifo_wr_en     (fifo_wr_en)
);


//ILA�ɼ�AD����
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