
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.All;

entity programCounter is
    Port ( Input : in  STD_LOGIC_VECTOR (31 downto 0);
           Output : out  STD_LOGIC_VECTOR (31 downto 0) := x"00000000";
			  clk : in std_logic;
			  enable : in std_logic);
end programCounter;

architecture Behavioral of programCounter is

begin
	programCounterLoad : process (clk,enable,Input) is
	begin
		if enable = '1' then
			if rising_edge(clk) then
				Output <= Input;
			end if;
		end if;
	end process programCounterLoad;
	
end Behavioral;

