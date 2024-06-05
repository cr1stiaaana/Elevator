

module top(
    input clock,
    input reset,
    input en,
    input stop,
    input [1:0] in,
    output clk_delay,
    output [6:0] floor_display,
    output wire [3:0] changes_count
    );
    
    wire clk_delay_out;

clk_delay clk_delay0(
    .clock(clock),
    .reset(reset),
    .en(en),
    .clk_delay(clk_delay_out)
    );
    
wire [1:0] out_floor;
elevator elevator_dut(
    .clock(clk_delay_out),
    .reset(reset),
    .stop(stop),
    .in(in),
    .changes_count (changes_count),
    .floor(out_floor)
    );
    
floor_transcoder transcoder0(
    .in(out_floor),
    .out(floor_display)
    );   

assign clk_delay= clk_delay_out;
endmodule
