

module fifo_wr(
    //mudule clock
    input                  clk    ,           // 时钟信号
    input                  rst_n  ,           // 复位信号
    //FIFO interface       
    input                  almost_empty,      // FIFO将空信号
    input                  almost_full ,      // FIFO将满信号
	output    reg          fifo_wr_en        // FIFO写使能
);

//reg define
reg  [1:0]  state            ; //动作状态
reg  		almost_empty_d0  ;  //almost_empty 延迟一拍
reg  		almost_empty_syn ;  //almost_empty 延迟两拍
reg  [3:0]  dly_cnt          ; //延迟计数器
//*****************************************************
//**                    main code
//*****************************************************

//因为 almost_empty 信号是属于FIFO读时钟域的
//所以要将其同步到写时钟域中
always@( posedge clk ) begin
	if( !rst_n ) begin
		almost_empty_d0  <= 1'b0 ;
		almost_empty_syn <= 1'b0 ;
	end
	else begin
		almost_empty_d0  <= almost_empty ;
		almost_empty_syn <= almost_empty_d0 ;
	end
end

//向FIFO中写入数据
always @(posedge clk ) begin
    if(!rst_n) begin
        fifo_wr_en   <= 1'b0;
        state        <= 2'd0;
		dly_cnt      <= 4'd0;
    end
    else begin
        case(state)
            2'd0: begin 
                if(almost_empty_syn) begin  //如果检测到FIFO将被读空
                    state <= 2'd1;        //就进入延时状态
                end 
                else
                    state <= state;
            end 
			2'd1: begin
                if(dly_cnt == 4'd10) begin  //延时10拍
											//原因是FIFO IP核内部状态信号的更新存在延时
											//延迟10拍以等待状态信号更新完毕                   
                    dly_cnt    <= 4'd0;
					state      <= 2'd2;     //开始写操作
					fifo_wr_en <= 1'b1;     //打开写使能
				end
				else
					dly_cnt <= dly_cnt + 4'd1;
            end             
			2'd2: begin
                if(almost_full) begin        //等待FIFO将被写满
                    fifo_wr_en   <= 1'b0;  //关闭写使能
                    state        <= 2'd0;  //回到第一个状态
                end
                else  begin                 //如果FIFO没有被写满
                    fifo_wr_en   <= 1'b1;  //则持续打开写使能
                end
            end 
			default : state <= 2'd0;
        endcase
    end
end

endmodule