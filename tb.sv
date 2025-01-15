
`include "design.sv"

module up_down_counter_tb;

  reg clk;
  reg rst;
  reg mode;

  wire [2:0] clk_d;
  wire [2:0] counter;

  up_down_counter u_dut(.clk(clk),
                        .rst(rst),
                        .mode(mode),
                        .clk_d(clk_d),
                        .counter(counter)
                       );

  initial begin
    clk = 1;
    forever #1 clk = ~clk;
  end

  initial begin
    rst = 1;
    #2 rst = 0;
    mode = 1;
    #38;
    mode = 0;
    #40 $finish;
  end

endmodule
