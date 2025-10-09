module SMCtrl(clk,reset,dir,SMC);
input clk,reset,dir;
output reg[3:0] SMC;
reg[2:0] ns,cs;

always @(posedge clk) begin
    cs <= ns;
end

// Define state parameters at the top of the module
parameter S_RESET = 3'd0;
parameter S_1 = 3'd1;
parameter S_2 = 3'd2;
parameter S_3 = 3'd3;
parameter S_4 = 3'd4;
// ... then use them in the case statement
//S_1: ns <= (dir) ? S_2 : S_4;

always @(*) begin
    if(reset) ns <= 3'd0;
    else
        case(cs)
            S_RESET : ns <= S_1;
            S_1: ns <= (dir) ? S_2 : S_4;
            S_2: ns <= (dir) ? S_3 : S_1;
            S_3: ns <= (dir) ? S_4 : S_2;
            S_4: ns <= (dir) ? S_1 : S_3;
            default: ns<=S_RESET;
        endcase
end

always @(cs) begin
    case(cs)
        S_RESET: SMC <= 4'b0000;
        S_1: SMC <= 4'b1001;
        S_2: SMC <= 4'b0011;
        S_3: SMC <= 4'b0110;
        S_4: SMC <= 4'b1100;
        default: SMC <= 4'b0000;
    endcase
end

endmodule