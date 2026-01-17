
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.All;


entity topLevel is
    Port ( rd1 : inout  STD_LOGIC_VECTOR (31 downto 0);
           clk : in  STD_LOGIC;
           enable : in  STD_LOGIC);
end topLevel;

architecture Behavioral of topLevel is
signal instruction : STD_LOGIC_VECTOR (31 downto 0);
signal rd2 : STD_LOGIC_VECTOR (31 downto 0);
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
			
	INSTANCE_PROGMEM : entity work.programMemory
		port map (
			pc,
			instruction);
			
	INSTANCE_REGFILE : entity work.registerFile
		port map (
			instruction(19 downto 15),
			instruction(24 downto 20),
			rd1,
			rd2);
end Behavioral;

