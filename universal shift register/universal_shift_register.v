module universal_shift_register (
    input clk,
    input reset,
    input [1:0] mode,
    input [3:0] parallel_in,
    input serial_left,
    input serial_right,
    output reg [3:0] q
);

    always @(posedge clk) begin

        if (reset) begin
            q <= 4'b0000;
        end

        else begin

            case (mode)

                // Hold
                2'b00:
                    q <= q;

                // Shift Right
                2'b01:
                    q <= {serial_right, q[3:1]};

                // Shift Left
                2'b10:
                    q <= {q[2:0], serial_left};

                // Parallel Load
                2'b11:
                    q <= parallel_in;

                default:
                    q <= q;

            endcase

        end

    end

endmodule