//****************************************Copyright (c)***********************************//
//ԭ�Ӹ����߽�ѧƽ̨��www.yuanzige.com
//����֧�֣�www.openedv.com
//�Ա����̣�http://openedv.taobao.com 
//��ע΢�Ź���ƽ̨΢�źţ�"����ԭ��"����ѻ�ȡZYNQ & FPGA & STM32 & LINUX���ϡ�
//��Ȩ���У�����ؾ���
//Copyright(C) ����ԭ�� 2018-2028
//All rights reserved                               
//----------------------------------------------------------------------------------------
// File name:           lcd_display
// Last modified Date:  2019/8/07 10:41:06
// Last Version:        V1.0
// Descriptions:        LCD��ʾģ��
//----------------------------------------------------------------------------------------
// Created by:          ����ԭ��
// Created date:        2019/8/07 10:41:06
// Version:             V1.0
// Descriptions:        The original version
//
//----------------------------------------------------------------------------------------
//****************************************************************************************//

module lcd_display(
    input                lcd_vs,
    input [7:0]          wave_data,  //fifo���ź�
    input                fifo_wr_en,
    
    input        [10:0]  ad_data,     //adת���ɼ���������   
    input                lcd_pclk,    //ʱ��
    input                rst_n,       //��λ���͵�ƽ��Ч
    input        [10:0]  pixel_xpos,  //��ǰ���ص������
    input        [10:0]  pixel_ypos,  //��ǰ���ص�������  
    input        [10:0]  h_disp,      //LCD��ˮƽ�ֱ���
    input        [10:0]  v_disp,      //LCD����ֱ�ֱ���       
    output  reg  [23:0]  pixel_data,  //��������
    
    output  reg          lcd_en
    );

//parameter define  
parameter WHITE = 24'hFFFFFF;  //��ɫ
parameter BLACK = 24'h000000;  //��ɫ
parameter RED   = 24'hFF0000;  //��ɫ
parameter GREEN = 24'h00FF00;  //��ɫ
parameter BLUE  = 24'h0000FF;  //��ɫ

reg [7:0]   lcd_data[767:0];
reg [9:0]   i;
reg [9:0]   frame;
reg  [3:0]  dly_cnt          ; //�ӳټ�����
//���ݵ�ǰ���ص�����ָ����ǰ���ص���ɫ���ݣ�����Ļ����ʾ����
always @(posedge lcd_pclk or negedge rst_n) begin
    if(!rst_n)begin
        pixel_data <= BLACK;
        i <= 0;
        lcd_en <= 1;
        frame <= 0;
        lcd_data[0] <= 0;
        dly_cnt <= 0;
    end
    else if(lcd_en == 1)begin
        //lcd_en == 1,fifo��ʼ��
            if(dly_cnt == 4'd10) begin  //��ʱ10��
                                                //ԭ����FIFO IP���ڲ�״̬�źŵĸ��´�����ʱ
                                                //�ӳ�10���Եȴ�״̬�źŸ������
                        dly_cnt <= 4'd0;
                    end
            else
                dly_cnt <= dly_cnt + 4'd1;
               
            if(i < 768) 
                lcd_data[i] <= wave_data;
                
            i <= i +1;
            frame <= 0;
            pixel_data <= BLACK;
            if(i == 1023)
                lcd_en <= 0;
            else
                lcd_en <= 1;
        end
    else begin
        i <= 0;
        if((pixel_xpos == 1) && (pixel_ypos < 356) && (pixel_ypos > 99))
            pixel_data <= BLUE;  //��߿�
        else if((pixel_xpos == 768) && (pixel_ypos < 356) && (pixel_ypos > 99))
            pixel_data <= BLUE;  //�ұ߿�
        else if((pixel_ypos == 355) && (pixel_xpos < 768) && (pixel_xpos > 0))
            pixel_data <= BLUE;  //�ϱ߿�
        else if((pixel_ypos == 100) && (pixel_xpos < 768) && (pixel_xpos > 0))
            pixel_data <= BLUE;  //�±߿�
        else if((pixel_xpos < 511) && (pixel_xpos > 0) && (pixel_ypos < 356) && (pixel_ypos > 99))
        begin
            if(lcd_data[pixel_xpos] == (356 - pixel_ypos))
            begin
                pixel_data <= GREEN;
            end
            else
                pixel_data <= BLACK;
        end              
        else 
            pixel_data <= BLACK; 
        if((pixel_xpos == 799) && (pixel_ypos == 479))begin
            frame <= frame + 1;
            if(frame == 1000)
                lcd_en <= 1;
            else
                lcd_en <= 0;
        end
        else
            lcd_en <= 0;
    end 
end
  
ila_2  ila_2(
    .clk        (lcd_pclk),
    .probe0     (lcd_data[0]),
    .probe1     (lcd_en),
    .probe2     (pixel_data),
    .probe3     (lcd_vs)
);
endmodule
