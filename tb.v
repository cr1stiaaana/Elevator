`timescale 1ns / 1ps


module tb();

    reg clock;
    reg reset;
    reg stop;
    reg [1:0] in;
    wire [3:0] changes_count;
    wire [1:0] floor;
    
    
elevator elevator_DUT(
    .clock(clock),
    .reset(reset),
    .stop(stop),
    .in(in),
    .changes_count(changes_count),
    .floor(floor)
    );


initial
begin
clock=0;
forever #1 clock=~clock;
end

initial
begin
reset=1;
#2 reset=0;
#15 reset =1;
#2 reset=0;
end

initial
begin
stop =0;
#16 stop=1;
#6 stop=0;
#4 stop=1;
#6 stop =0;
#7 $stop;
end

initial
begin
in=0;
#4 in=3;
#8 in=1;
#4 in=2;
#10 in=3;
#4 in=1;

end




endmodule