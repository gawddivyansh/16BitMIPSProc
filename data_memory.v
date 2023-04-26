module data_memory (
    input clk, addr[15:0], write_data[15:0], write_en_flag, read_flag;
    output read_data[15:0];
);
    reg [15:0] ram[255:0];
    wire[7:0] ram_addr = addr[8:1];
    integer i;
    initial begin
        for(i=0;i<256;i=i+1){
            ram[i] <= 16'd0;
        }
    end
    always @(posedge clk) begin
        if(write_en_flag)
            ram[ram_addr] <= write_data;
    end
    assign read_data = read_flag==1'b1 ? ram[ram_addr]:16'd0;

endmodule