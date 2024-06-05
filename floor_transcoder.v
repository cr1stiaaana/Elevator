
module floor_transcoder(
    input [1:0] in,
    output reg [6:0] out
    );

always @(in)
    begin
    case(in)
    2'b00: out= 7'b000_1100;
    2'b01: out= 7'b111_1001;
    2'b10: out= 7'b010_0100;
    2'b11: out= 7'b011_0000;
    endcase
    end
    
endmodule
