	spi_spi_slave_to_avalon_mm_master_bridge_0 u0 (
		.clk                                                                    (_connected_to_clk_),                                                                    //   input,   width = 1,           clk.clk
		.reset_n                                                                (_connected_to_reset_n_),                                                                //   input,   width = 1,       reset_n.reset_n
		.mosi_to_the_spislave_inst_for_spichain                                 (_connected_to_mosi_to_the_spislave_inst_for_spichain_),                                 //   input,   width = 1,      export_0.mosi_to_the_spislave_inst_for_spichain
		.nss_to_the_spislave_inst_for_spichain                                  (_connected_to_nss_to_the_spislave_inst_for_spichain_),                                  //   input,   width = 1,              .nss_to_the_spislave_inst_for_spichain
		.sclk_to_the_spislave_inst_for_spichain                                 (_connected_to_sclk_to_the_spislave_inst_for_spichain_),                                 //   input,   width = 1,              .sclk_to_the_spislave_inst_for_spichain
		.miso_to_and_from_the_spislave_inst_for_spichain                        (_connected_to_miso_to_and_from_the_spislave_inst_for_spichain_),                        //   inout,   width = 1,              .miso_to_and_from_the_spislave_inst_for_spichain
		.address_from_the_altera_avalon_packets_to_master_inst_for_spichain     (_connected_to_address_from_the_altera_avalon_packets_to_master_inst_for_spichain_),     //  output,  width = 32, avalon_master.address
		.byteenable_from_the_altera_avalon_packets_to_master_inst_for_spichain  (_connected_to_byteenable_from_the_altera_avalon_packets_to_master_inst_for_spichain_),  //  output,   width = 4,              .byteenable
		.read_from_the_altera_avalon_packets_to_master_inst_for_spichain        (_connected_to_read_from_the_altera_avalon_packets_to_master_inst_for_spichain_),        //  output,   width = 1,              .read
		.readdata_to_the_altera_avalon_packets_to_master_inst_for_spichain      (_connected_to_readdata_to_the_altera_avalon_packets_to_master_inst_for_spichain_),      //   input,  width = 32,              .readdata
		.readdatavalid_to_the_altera_avalon_packets_to_master_inst_for_spichain (_connected_to_readdatavalid_to_the_altera_avalon_packets_to_master_inst_for_spichain_), //   input,   width = 1,              .readdatavalid
		.waitrequest_to_the_altera_avalon_packets_to_master_inst_for_spichain   (_connected_to_waitrequest_to_the_altera_avalon_packets_to_master_inst_for_spichain_),   //   input,   width = 1,              .waitrequest
		.write_from_the_altera_avalon_packets_to_master_inst_for_spichain       (_connected_to_write_from_the_altera_avalon_packets_to_master_inst_for_spichain_),       //  output,   width = 1,              .write
		.writedata_from_the_altera_avalon_packets_to_master_inst_for_spichain   (_connected_to_writedata_from_the_altera_avalon_packets_to_master_inst_for_spichain_)    //  output,  width = 32,              .writedata
	);

