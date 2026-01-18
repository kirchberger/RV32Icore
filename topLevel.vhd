
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.All;


entity topLevel is
    Port ( dataOut : inout STD_LOGIC_VECTOR (31 downto 0);
				wr : inout STD_LOGIC;
           clk : in  STD_LOGIC;
           enable : in  STD_LOGIC);
end topLevel;

architecture Behavioral of topLevel is
signal rd1 : STD_LOGIC_VECTOR (31 downto 0);
signal rd2 : STD_LOGIC_VECTOR (31 downto 0);
signal instruction : STD_LOGIC_VECTOR (31 downto 0);
--signal dataOut : STD_LOGIC_VECTOR (31 downto 0);
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
		
	-- stores rd2 value, rd1 will need the immediate added
	INSTANCE_DATAMEM : entity work.dataMemory
		port map (
			rd2,
         dataOut,
         rd1,
         wr,
         clk);
	
	wr <= instruction(0) and instruction(1) and (not instruction(2)) and (not instruction(3)) and (not instruction(4)) and instruction(5) and (not instruction(6));
	
end Behavioral;

