module uop_nxor_tb3;

//Internal wires
reg aa;
reg bb;
reg yy;

reg [1:0] mt; //Minterm mt is a 2-bit value

//structural
uop_nxor u1 (yy,aa,bb);

//Here we go!
initial
begin
   {aa,bb} = 2'b00;
   #50ps assert (yy==1'b1) $display("Passed %b", {aa,bb}); else $error("Failed for %b", {aa,bb});
   {aa,bb} = 2'b01;
   #50ps assert (yy==1'b0) $display("Passed %b", {aa,bb}); else $error("Failed for %b", {aa,bb});
   {aa,bb} = 2'b10;
   #50ps assert (yy==1'b0) $display("Passed %b", {aa,bb}); else $error("Failed for %b", {aa,bb});
   {aa,bb} = 2'b11;
   #50ps assert (yy==1'b1) $display("Passed %b", {aa,bb}); else $error("Failed for %b", {aa,bb});
   $display("DONE");
   #50ps;

   assign {aa,bb} = mt;
	
	mt = 0;
   #50ps assert (yy==1) $display("Passed %b", mt); else $error("Failed for %b", mt);

	#100ps;

end

endmodule