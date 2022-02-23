

module lcd_display(
    input                lcd_vs,
    input [7:0]          wave_data,  //fifo的信号
    input                fifo_wr_en,
    
    input        [10:0]  ad_data,     //ad转换采集到的数据   
    input                lcd_pclk,    //时钟
    input                rst_n,       //复位，低电平有效
    input        [10:0]  pixel_xpos,  //当前像素点横坐标
    input        [10:0]  pixel_ypos,  //当前像素点纵坐标  
    input        [10:0]  h_disp,      //LCD屏水平分辨率
    input        [10:0]  v_disp,      //LCD屏垂直分辨率       
    output  reg  [23:0]  pixel_data,  //像素数据
    
    output  reg          lcd_en
    );

//parameter define  
parameter WHITE = 24'hFFFFFF;  //白色
parameter BLACK = 24'h000000;  //黑色
parameter RED   = 24'hFF0000;  //红色
parameter GREEN = 24'h00FF00;  //绿色
parameter BLUE  = 24'h0000FF;  //蓝色

reg [7:0]   lcd_data[1023:0];
reg [9:0]   i;
reg [9:0]   frame;
reg  [3:0]  dly_cnt          ; //延迟计数器

reg [47:0] char[15:0]; //字符数组

wire [10:0] x_cnt; //横坐标计数器
wire [10:0] y_cnt; //纵坐标计数器

//给字符赋值
always @(posedge lcd_pclk ) begin
    char[0] =  48'h000000000000; 
    char[1] =  48'h000000000000; 
    char[2] =  48'h000000000000; 
    char[3] =  48'h000000000000; 
    char[4] =  48'hFE1C3C3C0000; 
    char[5] =  48'h042042260000; 
    char[6] =  48'h044042420000; 
    char[7] =  48'h085C3C425C78; 
    char[8] =  48'h106242426240;
    char[9] =  48'h104242424230;
    char[10] = 48'h206242644208; 
    char[11] = 48'h203C3C3C4270; 
    char[12] = 48'h000000000000; 
    char[13] = 48'h000000000000; 
    char[14] = 48'h000000000000; 
    char[15] = 48'h000000000000; 
    
end

assign x_cnt = pixel_xpos - 240;
assign y_cnt = pixel_ypos - 80;
//根据当前像素点坐标指定当前像素点颜色数据，在屏幕上显示彩条
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
        //lcd_en == 1,fifo开始读
            if(dly_cnt == 4'd10) begin  //延时10拍
                                                //原因是FIFO IP核内部状态信号的更新存在延时
                                                //延迟10拍以等待状态信号更新完毕
                        dly_cnt <= 4'd0;
                    end
            else
                dly_cnt <= dly_cnt + 4'd1;
               
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
            pixel_data <= BLUE;  //左边框
        else if((pixel_xpos == 480) && (pixel_ypos < 356) && (pixel_ypos > 99))
            pixel_data <= BLUE;  //右边框
        else if((pixel_ypos == 355) && (pixel_xpos < 481) && (pixel_xpos > 0))
            pixel_data <= BLUE;  //上边框
        else if((pixel_ypos == 100) && (pixel_xpos < 481) && (pixel_xpos > 0))
            pixel_data <= BLUE;  //下边框
        else if(((pixel_xpos % 96) == 0 ) && (pixel_ypos < 356) && (pixel_ypos > 99) && (pixel_xpos < 500))
            pixel_data <= WHITE;
        else if ((pixel_xpos > 239 ) && (pixel_xpos < 288) && (pixel_ypos > 79) && (pixel_ypos < 96) )
            if(char[y_cnt][47 - x_cnt])
                pixel_data <= BLUE;
            else
                pixel_data <= BLACK;
        else if((pixel_xpos < 480) && (pixel_xpos > 0) && (pixel_ypos < 356) && (pixel_ypos > 99))
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
