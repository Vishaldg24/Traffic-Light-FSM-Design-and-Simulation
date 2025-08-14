module traffic_light(
input clk,
input reset,
input enb,
output reg red,
output reg green,
output reg yellow,
output [3:0] state_out
    );
    parameter [3:0] OFF =4'b0001,
    RED =4'b0010,
    YELLOW = 4'b0100,
    GREEN =4'b1000;
   reg [3:0] next_state;
   reg [3:0] state;
   reg [5:0] timer;
   reg time_clear;
   
   always @(*) begin
   next_state = OFF;
   red =0;
   yellow =0;
   green =0;
   time_clear=0;
   case(state)
   OFF : begin 
   if(enb) next_state = RED;
   end 
   RED : begin
   red=1;
   if(timer == 6'd50)begin next_state = YELLOW;
   time_clear=1;
   end else begin
   next_state= RED;
   end
   end
   YELLOW : begin
   yellow=1;
   if(timer == 6'd10)begin next_state= GREEN;
   time_clear=1;
   end else begin
   next_state= YELLOW;
   end
   end
   GREEN : begin
   green=1;
   if(timer== 6'd30) begin 
   next_state= RED;
   time_clear=1;
   end else begin
   next_state= GREEN;
   end
   end
   default: next_state=OFF;
   endcase
   if(!enb) begin next_state=OFF;
   end
   end
   always @(posedge clk or negedge reset) begin
    if(!reset) 
    state <= OFF;
    else 
    state <= next_state;
    end
   assign state_out =state;
    always @(posedge clk or negedge reset) begin
    if(!reset)
    timer <= 6'd0;
    else if ((time_clear==1) || (!enb))
    timer<=6'd0;
    else if(state != OFF)
    timer<= timer + 1'b1;
    end  
endmodule
