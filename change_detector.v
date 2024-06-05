
module change_detector(
    input clock,
    input reset,
    input [1:0] in,
    output reg change
    );
    
    reg [1:0] in_past;
    
    
    always@(posedge clock)
    begin
    if(reset)
        in_past<=0;
    else
        in_past<=in;
    end
    
    always@(*)
    begin
    if(in_past!=in)
        begin
        change<=1;
        end
    else 
        change=0;
    end
    
    
    
    
endmodule
