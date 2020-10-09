	component spi_spi_slave_to_avalon_mm_master_bridge_0 is
		port (
			clk                                                                    : in    std_logic                     := 'X';             -- clk
			reset_n                                                                : in    std_logic                     := 'X';             -- reset_n
			mosi_to_the_spislave_inst_for_spichain                                 : in    std_logic                     := 'X';             -- mosi_to_the_spislave_inst_for_spichain
			nss_to_the_spislave_inst_for_spichain                                  : in    std_logic                     := 'X';             -- nss_to_the_spislave_inst_for_spichain
			sclk_to_the_spislave_inst_for_spichain                                 : in    std_logic                     := 'X';             -- sclk_to_the_spislave_inst_for_spichain
			miso_to_and_from_the_spislave_inst_for_spichain                        : inout std_logic                     := 'X';             -- miso_to_and_from_the_spislave_inst_for_spichain
			address_from_the_altera_avalon_packets_to_master_inst_for_spichain     : out   std_logic_vector(31 downto 0);                    -- address
			byteenable_from_the_altera_avalon_packets_to_master_inst_for_spichain  : out   std_logic_vector(3 downto 0);                     -- byteenable
			read_from_the_altera_avalon_packets_to_master_inst_for_spichain        : out   std_logic;                                        -- read
			readdata_to_the_altera_avalon_packets_to_master_inst_for_spichain      : in    std_logic_vector(31 downto 0) := (others => 'X'); -- readdata
			readdatavalid_to_the_altera_avalon_packets_to_master_inst_for_spichain : in    std_logic                     := 'X';             -- readdatavalid
			waitrequest_to_the_altera_avalon_packets_to_master_inst_for_spichain   : in    std_logic                     := 'X';             -- waitrequest
			write_from_the_altera_avalon_packets_to_master_inst_for_spichain       : out   std_logic;                                        -- write
			writedata_from_the_altera_avalon_packets_to_master_inst_for_spichain   : out   std_logic_vector(31 downto 0)                     -- writedata
		);
	end component spi_spi_slave_to_avalon_mm_master_bridge_0;

	u0 : component spi_spi_slave_to_avalon_mm_master_bridge_0
		port map (
			clk                                                                    => CONNECTED_TO_clk,                                                                    --           clk.clk
			reset_n                                                                => CONNECTED_TO_reset_n,                                                                --       reset_n.reset_n
			mosi_to_the_spislave_inst_for_spichain                                 => CONNECTED_TO_mosi_to_the_spislave_inst_for_spichain,                                 --      export_0.mosi_to_the_spislave_inst_for_spichain
			nss_to_the_spislave_inst_for_spichain                                  => CONNECTED_TO_nss_to_the_spislave_inst_for_spichain,                                  --              .nss_to_the_spislave_inst_for_spichain
			sclk_to_the_spislave_inst_for_spichain                                 => CONNECTED_TO_sclk_to_the_spislave_inst_for_spichain,                                 --              .sclk_to_the_spislave_inst_for_spichain
			miso_to_and_from_the_spislave_inst_for_spichain                        => CONNECTED_TO_miso_to_and_from_the_spislave_inst_for_spichain,                        --              .miso_to_and_from_the_spislave_inst_for_spichain
			address_from_the_altera_avalon_packets_to_master_inst_for_spichain     => CONNECTED_TO_address_from_the_altera_avalon_packets_to_master_inst_for_spichain,     -- avalon_master.address
			byteenable_from_the_altera_avalon_packets_to_master_inst_for_spichain  => CONNECTED_TO_byteenable_from_the_altera_avalon_packets_to_master_inst_for_spichain,  --              .byteenable
			read_from_the_altera_avalon_packets_to_master_inst_for_spichain        => CONNECTED_TO_read_from_the_altera_avalon_packets_to_master_inst_for_spichain,        --              .read
			readdata_to_the_altera_avalon_packets_to_master_inst_for_spichain      => CONNECTED_TO_readdata_to_the_altera_avalon_packets_to_master_inst_for_spichain,      --              .readdata
			readdatavalid_to_the_altera_avalon_packets_to_master_inst_for_spichain => CONNECTED_TO_readdatavalid_to_the_altera_avalon_packets_to_master_inst_for_spichain, --              .readdatavalid
			waitrequest_to_the_altera_avalon_packets_to_master_inst_for_spichain   => CONNECTED_TO_waitrequest_to_the_altera_avalon_packets_to_master_inst_for_spichain,   --              .waitrequest
			write_from_the_altera_avalon_packets_to_master_inst_for_spichain       => CONNECTED_TO_write_from_the_altera_avalon_packets_to_master_inst_for_spichain,       --              .write
			writedata_from_the_altera_avalon_packets_to_master_inst_for_spichain   => CONNECTED_TO_writedata_from_the_altera_avalon_packets_to_master_inst_for_spichain    --              .writedata
		);

