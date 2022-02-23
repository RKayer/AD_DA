

module fifo_wr(
    //mudule clock
    input                  clk    ,           // ʱ���ź�
    input                  rst_n  ,           // ��λ�ź�
    //FIFO interface       
    input                  almost_empty,      // FIFO�����ź�
    input                  almost_full ,      // FIFO�����ź�
	output    reg          fifo_wr_en        // FIFOдʹ��
);

//reg define
reg  [1:0]  state            ; //����״̬
reg  		almost_empty_d0  ;  //almost_empty �ӳ�һ��
reg  		almost_empty_syn ;  //almost_empty �ӳ�����
reg  [3:0]  dly_cnt          ; //�ӳټ�����
//*****************************************************
//**                    main code
//*****************************************************

//��Ϊ almost_empty �ź�������FIFO��ʱ�����
//����Ҫ����ͬ����дʱ������
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

//��FIFO��д������
always @(posedge clk ) begin
    if(!rst_n) begin
        fifo_wr_en   <= 1'b0;
        state        <= 2'd0;
		dly_cnt      <= 4'd0;
    end
    else begin
        case(state)
            2'd0: begin 
                if(almost_empty_syn) begin  //�����⵽FIFO��������
                    state <= 2'd1;        //�ͽ�����ʱ״̬
                end 
                else
                    state <= state;
            end 
			2'd1: begin
                if(dly_cnt == 4'd10) begin  //��ʱ10��
											//ԭ����FIFO IP���ڲ�״̬�źŵĸ��´�����ʱ
											//�ӳ�10���Եȴ�״̬�źŸ������                   
                    dly_cnt    <= 4'd0;
					state      <= 2'd2;     //��ʼд����
					fifo_wr_en <= 1'b1;     //��дʹ��
				end
				else
					dly_cnt <= dly_cnt + 4'd1;
            end             
			2'd2: begin
                if(almost_full) begin        //�ȴ�FIFO����д��
                    fifo_wr_en   <= 1'b0;  //�ر�дʹ��
                    state        <= 2'd0;  //�ص���һ��״̬
                end
                else  begin                 //���FIFOû�б�д��
                    fifo_wr_en   <= 1'b1;  //�������дʹ��
                end
            end 
			default : state <= 2'd0;
        endcase
    end
end

endmodule