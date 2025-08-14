module tb_traffic_light;
reg clk = 0;
reg reset;
reg enb;
wire red;
wire yellow;
wire green;
wire [3:0] state_out;
  parameter [3:0] OFF =4'b0001,
    RED =4'b0010,
    YELLOW = 4'b0100,
    GREEN =4'b1000;
traffic_light trf1(
.clk(clk),
.reset(reset),
.enb(enb),
.red(red),
.yellow(yellow),
.green(green),
.state_out(state_out));
initial begin
forever begin
#5 clk=~clk;
end
end
initial
begin
$monitor ($time,"enb=%b,red=%b,yellow=%b,green=%b",enb,red,yellow,green);
reset=0; 
#5 reset=1;
enb=0;
repeat(10) @(posedge clk);
enb=1;
repeat(2) begin
wait(state_out == GREEN);
@(state_out);
end
wait(state_out == YELLOW);
@(posedge clk); enb=0;
repeat(10) @(posedge clk);
@(posedge clk); enb=1;
#40 $stop;
end
endmodule
