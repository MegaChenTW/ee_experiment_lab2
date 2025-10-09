module DivNSel(sel, DivN);
input [1:0] sel;
output reg [31:0] DivN;

always @(sel)
    case(sel)
        2'b00: DivN <= 32'd512000;
        2'b01: DivN <= 32'd1024000;
        2'b10: DivN <= 32'd2048000;
        default: DivN <= 32'd4096000;
    endcase
endmodule