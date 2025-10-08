module fDiv (fin, DIVN, fout);
input fin;
output fout;
input [31:0] DIVN;
wire [31:0] _DIVN;
reg [31:0] count;
reg fout;

initial begin
    count <= 32'b1;
end

//assign DIVN = 32'd50000000;
assign _DIVN = {1'b0, DIVN[31:1]};
always @(posedge fin) begin
    count <= (count >= DIVN)? 32'd1:count+1;
    fout <= (count <= _DIVN)? 1'b0:1'b1;
end
endmodule