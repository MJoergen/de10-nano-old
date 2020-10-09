module spi_spi_slave_to_avalon_mm_master_bridge_0 (
		input  wire        clk,                                                                    //           clk.clk
		input  wire        reset_n,                                                                //       reset_n.reset_n
		input  wire        mosi_to_the_spislave_inst_for_spichain,                                 //      export_0.mosi_to_the_spislave_inst_for_spichain
		input  wire        nss_to_the_spislave_inst_for_spichain,                                  //              .nss_to_the_spislave_inst_for_spichain
		input  wire        sclk_to_the_spislave_inst_for_spichain,                                 //              .sclk_to_the_spislave_inst_for_spichain
		inout  wire        miso_to_and_from_the_spislave_inst_for_spichain,                        //              .miso_to_and_from_the_spislave_inst_for_spichain
		output wire [31:0] address_from_the_altera_avalon_packets_to_master_inst_for_spichain,     // avalon_master.address
		output wire [3:0]  byteenable_from_the_altera_avalon_packets_to_master_inst_for_spichain,  //              .byteenable
		output wire        read_from_the_altera_avalon_packets_to_master_inst_for_spichain,        //              .read
		input  wire [31:0] readdata_to_the_altera_avalon_packets_to_master_inst_for_spichain,      //              .readdata
		input  wire        readdatavalid_to_the_altera_avalon_packets_to_master_inst_for_spichain, //              .readdatavalid
		input  wire        waitrequest_to_the_altera_avalon_packets_to_master_inst_for_spichain,   //              .waitrequest
		output wire        write_from_the_altera_avalon_packets_to_master_inst_for_spichain,       //              .write
		output wire [31:0] writedata_from_the_altera_avalon_packets_to_master_inst_for_spichain    //              .writedata
	);
endmodule

