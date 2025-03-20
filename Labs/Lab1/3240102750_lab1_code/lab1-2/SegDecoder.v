`timescale 1ns / 1ps

module SegDecoder (
    input wire [3:0] data,
    input wire point,
    input wire LE,

    output wire a,
    output wire b,
    output wire c,
    output wire d,
    output wire e,
    output wire f,
    output wire g,
    output wire p   //floating point
);

assign a = LE | (~data[3] & ~data[2] & ~data[1] & data[0]) | (~data[3] & data[2] & ~data[1] & ~data[0]) | (data[3] & ~data[2] & data[1] & data[0]) | (data[3] & data[2] & ~data[1] & data[0]);
assign b = LE | (~data[3] & data[2] & ~data[1] & data[0]) | (~data[3] & data[2] & data[1] & ~data[0]) | (data[3] & ~data[2] & data[1] & data[0]) | (data[3] & data[2] & ~data[1] & ~data[0]) | (data[3] & data[2] & data[1] & ~data[0]) | (data[3] & data[2] & data[1] & data[0]);
assign c = LE | (~data[3] & ~data[2] & data[1] & ~data[0]) | (data[3] & data[2] & ~data[1] & ~data[0]) | (data[3] & data[2] & data[1] & ~data[0]) | (data[3] & data[2] & data[1] & data[0]);
assign d = LE | (~data[3] & ~data[2] & ~data[1] & data[0]) | (~data[3] & data[2] & ~data[1] & ~data[0]) | (~data[3] & data[2] & data[1] & data[0]) | (data[3] & ~data[2] & data[1] & ~data[0]) | (data[3] & data[2] & data[1] & data[0]);
assign e = LE | (~data[3] & ~data[2] & ~data[1] & data[0]) | (~data[3] & ~data[2] & data[1] & data[0]) | (~data[3] & data[2] & ~data[1] & ~data[0]) | (~data[3] & data[2] & ~data[1] & data[0]) | (~data[3] & data[2] & data[1] & data[0]) | (data[3] & ~data[2] & ~data[1] & data[0]);
assign f = LE | (~data[3] & ~data[2] & ~data[1] & data[0]) | (~data[3] & ~data[2] & data[1] & ~data[0]) | (~data[3] & ~data[2] & data[1] & data[0]) | (~data[3] & data[2] & data[1] & data[0]) | (data[3] & data[2] & ~data[1] & data[0]);
assign g = LE | (~data[3] & ~data[2] & ~data[1] & ~data[0]) | (~data[3] & ~data[2] & ~data[1] & data[0]) | (~data[3] & data[2] & data[1] & data[0]) | (data[3] & data[2] & ~data[1] & ~data[0]);

assign p = ~point;

endmodule //SegDecoder