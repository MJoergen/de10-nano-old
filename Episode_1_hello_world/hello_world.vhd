library ieee;
use ieee.std_logic_1164.all;

entity hello_world is
   port (
      sw_i  : in  std_logic_vector(3 downto 0);
      led_o : out std_logic_vector(3 downto 0)
   );
end entity hello_world;

architecture synthesis of hello_world is

begin

   led_o <= sw_i;

end architecture synthesis;

