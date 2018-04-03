module Top(input clock,input rev,output  [3:0]enable,output reg [7:0]sevenseg);
	integer onesec;
	integer bcd;
	reg clk;
	//reg [7:0]sevenseg;
	initial
	begin
	onesec=0;
	bcd=0;
	clk=1;
	end
	assign enable=3'b000;
	always @(posedge clock)
	begin 
		onesec<=onesec+1;
		if(onesec==50000000)
		begin
			clk=~clk;
			onesec<=1;
	end
	end
	
		always @(posedge clk)
		begin
		if(rev==1)begin
		bcd<=bcd+1;
		if(bcd==9)begin
		bcd<=0;
		end
				
		case(bcd)
		  0: sevenseg = 8'b00000010; // "0"     
        1: sevenseg = 8'b10011110; // "1" 
        2: sevenseg = 8'b00100100; // "2" 
        3: sevenseg = 8'b00001100; // "3" 
        4: sevenseg = 8'b10011000; // "4" 
        5: sevenseg = 8'b01001000; // "5" 
        6: sevenseg = 8'b01000000; // "6" 
        7: sevenseg = 8'b00011110; // "7" 
        8: sevenseg = 8'b00000000; // "8"     
        9: sevenseg = 8'b00011000; // "9" 
		endcase
		end
		else if(rev==0)
		begin
		bcd<=bcd-1;
		if(bcd==0)
		begin
		bcd<=9;
		end
		case(bcd)
		  0: sevenseg = 8'b00000010; // "0"     
        1: sevenseg = 8'b10011110; // "1" 
        2: sevenseg = 8'b00100100; // "2" 
        3: sevenseg = 8'b00001100; // "3" 
        4: sevenseg = 8'b10011000; // "4" 
        5: sevenseg = 8'b01001000; // "5" 
        6: sevenseg = 8'b01000000; // "6" 
        7: sevenseg = 8'b00011110; // "7" 
        8: sevenseg = 8'b00000000; // "8"     
        9: sevenseg = 8'b00011000; // "9" 
		endcase
		end
		end
	
endmodule