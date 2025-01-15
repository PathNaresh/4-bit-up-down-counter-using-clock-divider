module up_down_counter(
  input clk,
  input rst,
  input mode,
  inout clk_d,
  output [2:0] counter
);

  reg [2:0] div_cnt;
  reg [2:0] count;

  // clock division logic
  always @(posedge clk) begin
    if(rst)
      div_cnt <= 3'b0;
    else
      div_cnt <= div_cnt + 1;
  end

  assign clk_d = div_cnt;

  // counter logic
  always @(posedge clk_d or posedge rst) begin
    if(rst)
      count <= 3'b0;
    else if(mode == 1)
      count <= count + 3'd1;
    else
      count <= count - 3'd1;
  end

  assign counter = count;
      
endmodule
