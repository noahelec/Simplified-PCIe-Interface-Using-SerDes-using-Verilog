module serializer (
    input logic clk,           // Clock signal
    input logic reset_n,       // Active-low reset
    input logic [15:0] pdata,  // Parallel data input (16 bits)
    input logic load,          // Load signal to latch parallel data
    output logic sdata         // Serial data output
);

    // Internal registers
    logic [15:0] shift_reg;    // Shift register to hold data
    logic [3:0] bit_counter;   // Counter to track bit position

    // Load the parallel data into the shift register
    always_ff @(posedge clk or negedge reset_n) begin
        if (!reset_n) begin
            shift_reg <= 16'd0;
            bit_counter <= 4'd0;
            sdata <= 1'b0;
        end else if (load) begin
            shift_reg <= pdata;
            bit_counter <= 4'd0;
        end else if (bit_counter < 16) begin
            sdata <= shift_reg[15];
            shift_reg <= shift_reg << 1;
            bit_counter <= bit_counter + 1;
        end
    end

endmodule
