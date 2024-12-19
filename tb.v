`timescale 1ns/1ns

module mips_tb;

  // Inputs
  reg clk;
  reg rst;
  reg Interrupt;

  // Outputs
  wire [31:0] out1;
  wire [31:0] out2;

  // Instantiate the MIPS module
  mips uut (
    .clk(clk),
    .rst(rst),
    .Interrupt(Interrupt),
    .out1(out1),
    .out2(out2)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #50 clk = ~clk; // 10ns clock period (100MHz)
  end

  // Test sequence
  initial begin
    // Initialize signals
    rst = 0;
    Interrupt = 0;

    // Apply reset for 1 clock cycle
    #0 rst = 1;  // Activate reset at clock 1
    #100 rst = 0;  // Deactivate reset at clock 2

    // Generate interrupt every 15 clock cycles
    forever begin
      #1500 Interrupt = 1; // Interrupt active for 1 clock cycle
      #100 Interrupt = 0;  // Interrupt inactive
    end
  end

  // Simulation time limit
//   initial begin
//     #20000 $finish; // Stop simulation after 1000ns
//   end

endmodule
