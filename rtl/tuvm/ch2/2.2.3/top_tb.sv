`timescale 1ns/1ps
`include "uvm_macros.svh"
import uvm_pkg::*;
`include "my_driver.sv"

module top_tb;

reg         clk;
reg         rst_n;
reg  [7:0]  rxd;
reg         rx_dv;
wire [7:0]  txd;
wire        tx_en;

  dut my_dut(.clk(clk),
             .rst_n(rst_n),
             .rxd(rxd),
             .rx_dv(rx_dv),
             .txd(txd),
             .tx_en(tx_en));

  initial begin
     clk = 1;
     forever begin
        #100ns clk = ~clk;      // 相对源码改动的内容，加上了延迟时间单位
     end
  end

  initial begin
     rst_n = 1'b0;
     #1000ns;                  // 相对源码改动的内容，加上了延迟时间单位
     rst_n = 1'b1;
  end

  initial begin
     run_test("my_driver");
  end

endmodule
