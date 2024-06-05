
module elevator_FSM(
    input clock,
    input reset,
    input stop,
    input [1:0] in,
    output reg [1:0] floor
    );
    
    localparam FLOOR0 = 2'b00;
    localparam FLOOR1 = 2'b01;
    localparam FLOOR2 = 2'b10;
    localparam FLOOR3 = 2'b11;

reg [1:0] state, state_next;

always @(posedge clock)
begin
    if(reset==1)
     state <= FLOOR0;
    else 
       state<=state_next;
end   


always@(*)
begin
state_next=state;
case(state)
FLOOR0: begin
    if(stop==0 && in > 0)
        state_next=FLOOR1;
    end
FLOOR1: begin
    if(stop==0 && in > 1)
        state_next=FLOOR2;
    if(stop==0 && in <1)
        state_next=FLOOR0;
    end
FLOOR2: begin
    if(stop==0 && in > 2)
        state_next=FLOOR3;
    if(stop==0 && in < 2)
        state_next=FLOOR1;
    end
FLOOR3: begin
    if(stop==0 && in < 3)
        state_next=FLOOR2;
    end
endcase
end

always@(*) 
begin
case(state)
FLOOR0:
    floor = 0;
FLOOR1:
    floor= 1;
FLOOR2:
    floor = 2;
FLOOR3:
    floor =3;
endcase 
end


endmodule
