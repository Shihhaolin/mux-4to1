module mux_4to1 #(WIDTH = 4)
                  (output logic [WIDTH-1:0] out,
                   input  logic [WIDTH-1:0] in_a,
                   input  logic [WIDTH-1:0] in_b,
                   input  logic [WIDTH-1:0] in_c,
                   input  logic [WIDTH-1:0] in_d,
                   input  logic [1:0] sel);

always@(*)
  unique case (sel)
    2'b00: out = in_a;
    2'b01: out = in_b;
    2'b10: out = in_c;
    2'b11: out = in_d;
    
     default: out = 'x;
  endcase

endmodule