
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
signal immExtend : STD_LOGIC_VECTOR (31 downto 0);
signal aluResult : STD_LOGIC_VECTOR (31 downto 0);

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
	
	-- Should be updated to a memory controller
	INSTANCE_PROGMEM : entity work.programMemory
		port map (
			pc,
			instruction);
	
	-- Cannot write to registers yet
	INSTANCE_REGFILE : entity work.registerFile
		port map (
			instruction(19 downto 15),
			instruction(24 downto 20),
			rd1,
			rd2);
	
	-- Should be updated to some sort of memory controller
	INSTANCE_DATAMEM : entity work.dataMemory
		port map (
			rd2,
         dataOut,
         aluResult,
         wr,
         clk);
	
	-- Dumb extender that just extends for the store instruction
	INSTANCE_IMMEXT : entity work.immExtender
		port map (
			instruction (31 downto 25) & instruction (11 downto 7),
			immExtend);
			
	-- Dumb ALU right now that just adds
	INSTANCE_ALU : entity work.ALU
		port map (
			rd1,
			immExtend,
			aluResult);
			
			
	-- Signal to write to the data memory, signals like such will be added to a seperate file later
	wr <= instruction(0) and instruction(1) and (not instruction(2)) and (not instruction(3)) and (not instruction(4)) and instruction(5) and (not instruction(6));
	
end Behavioral;

