library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity hdmi is
   port (
      fpga_clk1_50 : in    std_logic;
      key          : in    std_logic_vector(1 downto 0);
      gpio_0       : inout std_logic_vector(3 downto 0)
   );
end entity hdmi;

architecture synthesis of hdmi is

   signal address       : std_logic_vector(31 downto 0);
   signal byteenable    : std_logic_vector(3 downto 0);
   signal read          : std_logic;
   signal readdata      : std_logic_vector(31 downto 0);
   signal readdatavalid : std_logic;
   signal waitrequest   : std_logic;
   signal write         : std_logic;
   signal writedata     : std_logic_vector(31 downto 0);

   component spi_spi_slave_to_avalon_mm_master_bridge_0 is
      port (
         clk                                                                    : in    std_logic;
         reset_n                                                                : in    std_logic;
         mosi_to_the_spislave_inst_for_spichain                                 : in    std_logic;
         nss_to_the_spislave_inst_for_spichain                                  : in    std_logic;
         sclk_to_the_spislave_inst_for_spichain                                 : in    std_logic;
         miso_to_and_from_the_spislave_inst_for_spichain                        : inout std_logic;
         address_from_the_altera_avalon_packets_to_master_inst_for_spichain     : out   std_logic_vector(31 downto 0);
         byteenable_from_the_altera_avalon_packets_to_master_inst_for_spichain  : out   std_logic_vector(3 downto 0);
         read_from_the_altera_avalon_packets_to_master_inst_for_spichain        : out   std_logic;
         readdata_to_the_altera_avalon_packets_to_master_inst_for_spichain      : in    std_logic_vector(31 downto 0);
         readdatavalid_to_the_altera_avalon_packets_to_master_inst_for_spichain : in    std_logic;
         waitrequest_to_the_altera_avalon_packets_to_master_inst_for_spichain   : in    std_logic;
         write_from_the_altera_avalon_packets_to_master_inst_for_spichain       : out   std_logic;
         writedata_from_the_altera_avalon_packets_to_master_inst_for_spichain   : out   std_logic_vector(31 downto 0)
      );
   end component spi_spi_slave_to_avalon_mm_master_bridge_0;

	component mem_0 is
		port (
			data    : in  std_logic_vector(31 downto 0) := (others => 'X'); -- datain
			q       : out std_logic_vector(31 downto 0);                    -- dataout
			address : in  std_logic_vector(7 downto 0)  := (others => 'X'); -- address
			wren    : in  std_logic                     := 'X';             -- wren
			clock   : in  std_logic                     := 'X'              -- clk
		);
	end component mem_0;

begin

   i_spi_spi_slave_to_avalon_mm_master_bridge_0 : component spi_spi_slave_to_avalon_mm_master_bridge_0
      port map (
         clk                                                                    => fpga_clk1_50,
         reset_n                                                                => key(0),
         mosi_to_the_spislave_inst_for_spichain                                 => gpio_0(0),
         nss_to_the_spislave_inst_for_spichain                                  => gpio_0(1),
         sclk_to_the_spislave_inst_for_spichain                                 => gpio_0(2),
         miso_to_and_from_the_spislave_inst_for_spichain                        => gpio_0(3),
         address_from_the_altera_avalon_packets_to_master_inst_for_spichain     => address,
         byteenable_from_the_altera_avalon_packets_to_master_inst_for_spichain  => byteenable,
         read_from_the_altera_avalon_packets_to_master_inst_for_spichain        => read,
         readdata_to_the_altera_avalon_packets_to_master_inst_for_spichain      => readdata,
         readdatavalid_to_the_altera_avalon_packets_to_master_inst_for_spichain => readdatavalid,
         waitrequest_to_the_altera_avalon_packets_to_master_inst_for_spichain   => waitrequest,
         write_from_the_altera_avalon_packets_to_master_inst_for_spichain       => write,
         writedata_from_the_altera_avalon_packets_to_master_inst_for_spichain   => writedata
      ); -- i_spi_spi_slave_to_avalon_mm_master_bridge_0

	i_mem_0 : component mem_0
		port map (
			data    => writedata,
			q       => readdata,
			address => address(7 downto 0),
			wren    => write,
			clock   => fpga_clk1_50
		);

   waitrequest   <= '0';
   readdatavalid <= '1';

end architecture synthesis;

