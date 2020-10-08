library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity hdmi is
   port (
      fpga_clk1_50 : in  std_logic;
      sw           : in  std_logic_vector(3 downto 0);
      led          : out std_logic_vector(7 downto 0);
      hdmi_i2c_scl : out std_logic;
      hdmi_i2c_sda : in  std_logic;
      hdmi_i2s     : out std_logic;
      hdmi_lrclk   : out std_logic;
      hdmi_mclk    : out std_logic;
      hdmi_sclk    : out std_logic;
      hdmi_tx_clk  : out std_logic;
      hdmi_tx_de   : out std_logic;
      hdmi_tx_d    : out std_logic_vector(23 downto 0);
      hdmi_tx_hs   : out std_logic;
      hdmi_tx_int  : in  std_logic;
      hdmi_tx_vs   : out std_logic
   );
end entity hdmi;

architecture synthesis of hdmi is

   -- The following constants define a resolution of 640x480 @ 60 Hz.
   -- Requires a clock of 25.175 MHz.
   -- See page 17 in "VESA MONITOR TIMING STANDARD"
   -- http://caxapa.ru/thumbs/361638/DMTv1r11.pdf

   constant C_PIXEL_X_COUNT : integer := 800;
   constant C_PIXEL_Y_COUNT : integer := 525;

   -- Define visible screen size
   constant H_PIXELS        : integer := 640;
   constant V_PIXELS        : integer := 480;

   -- Define VGA timing constants
   constant HS_START        : integer := 656;
   constant HS_TIME         : integer := 96;
   constant VS_START        : integer := 490;
   constant VS_TIME         : integer := 2;

   signal hdmi_clk          : std_logic;

   signal pixel_x           : std_logic_vector(9 downto 0);
   signal pixel_y           : std_logic_vector(9 downto 0);

   component pll_25 is
      port (
         refclk   : in  std_logic;
         rst      : in  std_logic;
         outclk_0 : out std_logic;
         locked   : out std_logic
      );
   end component pll_25;

begin

   i_pll_25 : pll_25
      port map (
         refclk   => fpga_clk1_50,
         rst      => '0',
         outclk_0 => hdmi_clk,
         locked   => open
      );


   -------------------------------------
   -- Generate horizontal pixel counter
   -------------------------------------

   p_pixel_x : process (hdmi_clk)
   begin
      if rising_edge(hdmi_clk) then
         if unsigned(pixel_x) = C_PIXEL_X_COUNT-1 then
            pixel_x <= (others => '0');
         else
            pixel_x <= std_logic_vector(unsigned(pixel_x) + 1);
         end if;
      end if;
   end process p_pixel_x;


   -----------------------------------
   -- Generate vertical pixel counter
   -----------------------------------

   p_pixel_y : process (hdmi_clk)
   begin
      if rising_edge(hdmi_clk) then
         if unsigned(pixel_x) = C_PIXEL_X_COUNT-1 then
            if unsigned(pixel_y) = C_PIXEL_Y_COUNT-1 then
               pixel_y <= (others => '0');
            else
               pixel_y <= std_logic_vector(unsigned(pixel_y) + 1);
            end if;
         end if;
      end if;
   end process p_pixel_y;


   -----------------------------------
   -- Generate output
   -----------------------------------

   p_hdmi_tx : process (hdmi_clk)
   begin
      if rising_edge(hdmi_clk) then
         -- Generate horizontal sync signal
         if unsigned(pixel_x) >= HS_START and
            unsigned(pixel_x) < HS_START+HS_TIME then

            hdmi_tx_hs <= '0';
         else
            hdmi_tx_hs <= '1';
         end if;

         -- Generate vertical sync signal
         if unsigned(pixel_y) >= VS_START and
            unsigned(pixel_y) < VS_START+VS_TIME then

            hdmi_tx_vs <= '0';
         else
            hdmi_tx_vs <= '1';
         end if;

         -- Default is black
         hdmi_tx_d  <= (others => '0');
         hdmi_tx_de <= '0';

         -- Only show color when inside visible screen area
         if unsigned(pixel_x) >= 0 and
            unsigned(pixel_x) < H_PIXELS and
            unsigned(pixel_y) < V_PIXELS then

            hdmi_tx_d  <= pixel_x & pixel_y & "0000";
            hdmi_tx_de <= '1';
         end if;
      end if;
   end process p_hdmi_tx;



   led(7 downto 4) <= (others => '0');
   led(3 downto 0) <= sw;

end architecture synthesis;

