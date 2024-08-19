module deserializer (
    input logic clk,           // Clock signal
    input logic reset_n,       // Active-low reset
    input logic sdata,         // Serial data input
    input logic start,         // Start signal to begin deserialization
    output logic [15:0] pdata, // Parallel data output (16 bits)
    output logic valid         // Valid signal to indicate data is ready
);

    // Internal registers
    logic [15:0] shift_reg;    // Shift register to hold deserialized data
    logic [4:0] bit_counter;   // Counter to track bit position

    // Deserialization processs
    always_ff @(posedge clk or negedge reset_n) begin
        if (!reset_n) begin
            shift_reg <= 16'd0;
            bit_counter <= 4'd0;
            pdata <= 16'd0;
            valid <= 1'b0;
        end else if (start) begin
            valid <= 1'b0;
            if (bit_counter < 17) begin
                shift_reg <= {shift_reg[14:0], sdata};
                bit_counter <= bit_counter + 1;
            end
            if (bit_counter == 16) begin
                pdata <= shift_reg;
                valid <= 1'b1; // Indicate that the parallel data is ready
                bit_counter <= 5'd0;
            end
        end
    end

endmodule
