module tb_serializer;

    // Testbench signals
    logic clk;
    logic reset_n;
    logic [15:0] pdata;     // Parallel data input (16 bits)
    logic load;             // Load signal
    logic sdata;            // Serial data output

    // Instantiate the Serializer module
    serializer uut (
        .clk(clk),
        .reset_n(reset_n),
        .pdata(pdata),
        .load(load),
        .sdata(sdata)
    );

    // Clock generation
    always #5 clk = ~clk;  // 10ns clock period

    // Test sequence
    initial begin
        // Initialize signals
        clk = 0;
        reset_n = 0;
        pdata = 16'h0000;
        load = 0;

        // Reset the Serializer
        #10 reset_n = 1;

        // Apply test vectors
        #10 load = 1;
        pdata = 16'hA5A5;  // Example pattern: 1010 0101 1010 0101

        // Release load after data is latched
        #10 load = 0;

        // Wait for serialization to complete
        #200;

        // Test with another pattern
        #10 load = 1;
        pdata = 16'h3C3C;  // Example pattern: 0011 1100 0011 1100
        #10 load = 0;

        // Wait for serialization to complete
        #200;

        // End simulation
        #10 $stop;
    end

    // Monitor the output
    initial begin
        $monitor("Time: %0t | pdata: %h | load: %b | sdata: %b", $time, pdata, load, sdata);
    end

endmodule
