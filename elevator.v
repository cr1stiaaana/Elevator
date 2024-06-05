
module elevator(
    input clock,
    input reset,
    input stop,
    input [1:0] in,
    output [3:0] changes_count,
    output [1:0] floor
    );



elevator_FSM elevator_FSM0(
    .clock(clock),
    .reset(reset),
    .stop(stop),
    .in(in),
    .floor(floor)
    );

wire count_enable;

change_detector change_detector0(
   .clock(clock),
   .reset(reset),
   .in(in),
   .change(count_enable)
    );
    
    
counter #(.w(4)) counter0
(
    .clock(clock),
    .reset(reset),
    .en(count_enable),
    .change_count(changes_count)
    );   
    
    
    
endmodule
