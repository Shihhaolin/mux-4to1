`timescale 1ns/100ps

module mux_4to1_test;

 localparam WIDTH=4;

 logic [WIDTH-1:0] out;
 logic [WIDTH-1:0] in_a;
 logic [WIDTH-1:0] in_b;
 logic [WIDTH-1:0] in_c;
 logic [WIDTH-1:0] in_d;
 logic [1:0]       sel;
 
 mux_4to1 UUT(.out(out), .in_a(in_a), .in_b(in_b), .in_c(in_c), .in_d(in_d), .sel(sel));

 initial 
 begin
     $timeformat(-9,0,"ns");
     $monitor("%t sel=%0b  in_a=%0h in_b=%0h in_c=%0h in_d=%0h out=%0h",
      $time, sel, in_a, in_b, in_c, in_d,  out);
 end



task  outexpect(input logic [WIDTH-1:0] expectvalue);
   if(out !== expectvalue)
   begin
   $display("COUNTER TEST FAILED");
   $display("expect=%0h, actual=%0h", expectvalue, out);
   $finish;
   end
endtask

initial begin
in_a='hA; in_b='hB; in_c='hC; in_d='hD;
end


initial begin
  sel=2'b00; #5ns outexpect('hA);
  sel=2'b01; #5ns outexpect('hB);
  sel=2'b10; #5ns outexpect('hC);
  sel=2'b11; #5ns outexpect('hD);
$display("COUNTER TEST PASSED");

end

endmodule