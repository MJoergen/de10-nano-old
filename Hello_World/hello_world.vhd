library ieee;
use ieee.std_logic_1164.all;

entity hello_world is
   port (
      sw  : in  std_logic_vector(3 downto 0);
      led : out std_logic_vector(7 downto 0)
   );
end entity hello_world;

architecture synthesis of hello_world is

begin

   led(7 downto 4) <= (others => '0');
   led(3 downto 0) <= sw;

end architecture synthesis;

