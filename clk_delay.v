
module clk_delay(
    input clock,
    input reset,
    input en,
    output clk_delay
    );
    
reg [31:0] count;

always@(posedge clock) begin
    if(reset == 1)
        count <= 0;
    else
        count <= count + 1;  
end

assign clk_delay = count[27];

endmodule
