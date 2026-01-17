library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.All;

entity pcIncrementor is
    Port ( Input : in  STD_LOGIC_VECTOR (31 downto 0);
           Output : out  STD_LOGIC_VECTOR (31 downto 0));
end pcIncrementor;

architecture Behavioral of pcIncrementor is

constant incrementValue : natural := 4;

begin

	Output <= std_logic_vector(unsigned(Input) + incrementValue);

end Behavioral;

