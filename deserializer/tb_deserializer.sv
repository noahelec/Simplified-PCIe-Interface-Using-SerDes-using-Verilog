module tb_deserializer;

    // Testbench signals
    logic clk;
    logic reset_n;
    logic sdata;             // Serial data input
    logic start;             // Start signal
    logic [15:0] pdata;      // Parallel data output (16 bits)
    logic valid;             // Valid signal indicating pdata is ready

    // Instantiate the Deserializer module
    deserializer uut (
        .clk(clk),
        .reset_n(reset_n),
        .sdata(sdata),
        .start(start),
        .pdata(pdata),
        .valid(valid)
    );

    // Clock generation
    always #5 clk = ~clk;  // 10ns clock period

    // Test sequence
    initial begin
        // Initialize signals
        clk = 0;
        reset_n = 0;
        sdata = 0;
        start = 0;

        // Reset the Deserializer
        #10 reset_n = 1;

        // Start deserialization
        #10 start = 1;

        // Apply serial data: 1010 0101 1010 0101 (0xA5A5)
        sdata = 1'b1; #10;
        sdata = 1'b0; #10;
        sdata = 1'b1; #10;
        sdata = 1'b0; #10;
        sdata = 1'b0; #10;
        sdata = 1'b1; #10;
        sdata = 1'b0; #10;
        sdata = 1'b1; #10;
        sdata = 1'b1; #10;
        sdata = 1'b0; #10;
        sdata = 1'b1; #10;
        sdata = 1'b0; #10;
        sdata = 1'b0; #10;
        sdata = 1'b1; #10;
        sdata = 1'b0; #10;
        sdata = 1'b1; #10;

        // Wait for deserialization to complete
        #20 start = 0;

        #20;


        // Test with another pattern: 0011 1100 0011 1100 (0x3C3C)
        #10 start = 1;
        sdata = 1'b0; #10;
        sdata = 1'b0; #10;
        sdata = 1'b1; #10;
        sdata = 1'b1; #10;
        sdata = 1'b1; #10;
        sdata = 1'b1; #10;
        sdata = 1'b0; #10;
        sdata = 1'b0; #10;
        sdata = 1'b0; #10;
        sdata = 1'b0; #10;
        sdata = 1'b1; #10;
        sdata = 1'b1; #10;
        sdata = 1'b1; #10;
        sdata = 1'b1; #10;
        sdata = 1'b0; #10;
        sdata = 1'b0; #10;

        // Wait for deserialization to complete
        #20 start = 0;

        #20;


        // End simulation
        #10 $stop;
    end

    // Monitor the output
    initial begin
        $monitor("Time: %0t | sdata: %b | start: %b | pdata: %h | valid: %b", $time, sdata, start, pdata, valid);
    end

endmodule
