

module fifo_rd(
    input               lcd_en,
    //system clock
    input               clk ,        // ʱ���ź�
    input               rst_n ,      // ��λ�ź�
    input        [7:0]  fifo_dout ,  // ��FIFO����������
    input               almost_full ,// FIFO�����ź�
    input               almost_empty,// FIFO�����ź�
    output  reg         fifo_rd_en   // FIFO��ʹ��
);

//reg define
reg  [1:0]  state           ;  // ����״̬
reg         almost_full_d0  ;  // fifo_full �ӳ�һ��
reg  		almost_full_syn ;  // fifo_full �ӳ�����
reg  [3:0]  dly_cnt         ;  //�ӳټ�����

//*****************************************************
//**                    main code
//*****************************************************

//��Ϊ fifo_full �ź�������FIFOдʱ�����
//����Ҫ����ͬ������ʱ������
always@( posedge clk ) begin
	if( !rst_n ) begin
		almost_full_d0  <= 1'b0 ;
		almost_full_syn <= 1'b0 ;
	end
	else begin
		almost_full_d0  <= almost_full ;
		almost_full_syn <= almost_full_d0 ;
	end
end

//����FIFO������
always @(posedge clk ) begin
    if(!rst_n) begin
        fifo_rd_en <= 1'b0;
		state      <= 2'd0;
		dly_cnt    <= 4'd0;
    end
    else begin
        case(state)
            2'd0: begin
                if(almost_full_syn)      //�����⵽FIFO����д��
                    state <= 2'd1;       //�ͽ�����ʱ״̬
                else
                    state <= state;
            end 
			2'd1: begin
                if(dly_cnt == 4'd10) begin  //��ʱ10��
											//ԭ����FIFO IP���ڲ�״̬�źŵĸ��´�����ʱ
											//�ӳ�10���Եȴ�״̬�źŸ������
                    dly_cnt <= 4'd0;
					state   <= 2'd2;        //��ʼ������
				end
				else
					dly_cnt <= dly_cnt + 4'd1;
            end
		    2'd2: begin
                if((lcd_en == 1) && (almost_empty == 0))
                   fifo_rd_en <= 1'b1;    //������򿪶�ʹ��
                else if(almost_empty && (lcd_en == 1)) begin     //�ȴ�FIFO��������
                    fifo_rd_en <= 1'b0;    //�رն�ʹ��
                    state      <= 2'd0;    //�ص���һ��״̬
                end   
                else                   
                    fifo_rd_en <= 1'b0;    
            end 
			default : state <= 2'd0;
        endcase
    end
end

endmodule