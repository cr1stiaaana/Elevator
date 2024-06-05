
module counter
#(parameter w=4)
(
    input clock,
    input reset,
    input en,
    output reg [3:0] change_count
    );

always@(posedge clock) begin

    if(reset==1)
        change_count<=0;
    else 
        begin
        if(en==1)
          change_count<= change_count+1;
        end
    
    
end
    
endmodule
