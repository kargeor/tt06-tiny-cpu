/*
 * Copyright (c) 2024 KARGEOR
 * SPDX-License-Identifier: Apache-2.0
 */

`define default_netname none

module tt_um_kargeor_tiny_cpu (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // will go high when the design is enabled
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);

  reg [7:0] r;

  always @(posedge clk)
  begin
    r <= ui_in + uio_in;
  end

  // All output pins must be assigned. If not used, assign to 0.
  assign uo_out  = r;
  assign uio_out = 0;
  assign uio_oe  = 0;

endmodule
