
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.All;


entity topLevel is
    Port ( instruction : inout  STD_LOGIC_VECTOR (31 downto 0);
           clk : in  STD_LOGIC;
           enable : in  STD_LOGIC);
end topLevel;

architecture Behavioral of topLevel is
signal pc : STD_LOGIC_VECTOR (31 downto 0);
signal pcNext : STD_LOGIC_VECTOR (31 downto 0);


begin


  
	INSTANCE_PC : entity work.programCounter
		port map (
			pcNext,
			pc,
			clk,
			enable);
			
	INSTANCE_PCINC : entity work.pcIncrementor
		port map (
			pc,
			pcNext);
	INSTANCE_PROMEM : entity work.programMemory
		port map (
			pc,
			instruction);
end Behavioral;

