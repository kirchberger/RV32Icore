
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.All;


entity topLevel is
    Port ( test : inout STD_LOGIC_VECTOR (7 downto 0);
           clk : in  STD_LOGIC;
			  btn1 : in STD_LOGIC;
			  btn2 : in STD_LOGIC;
			  btn3 : in STD_LOGIC;
           enable : in  STD_LOGIC);
end topLevel;

architecture Behavioral of topLevel is
-- Program Counter Signals
signal pc : STD_LOGIC_VECTOR (31 downto 0);
signal pcNext : STD_LOGIC_VECTOR (31 downto 0);
signal instr : STD_LOGIC_VECTOR (31 downto 0);

-- Register Signals
signal rd1 : STD_LOGIC_VECTOR (31 downto 0);
signal rd2 : STD_LOGIC_VECTOR (31 downto 0);
signal wr : STD_LOGIC;

-- Data Memory Signals
signal dataOut : STD_LOGIC_VECTOR (31 downto 0);
signal wd : STD_LOGIC;

-- ALU Signals
signal aluResult : STD_LOGIC_VECTOR (31 downto 0);

-- Imm Signals
signal immExtend : STD_LOGIC_VECTOR (31 downto 0);

begin


  
	INSTANCE_PC : entity work.programCounter
		port map (
			pcNext,
			pc,
			clk,
			enable);
	
	-- Should change to raw logic to synthsise better
	INSTANCE_PCINC : entity work.pcIncrementor
		port map (
			pc,
			pcNext);
	
	-- Should be updated to a memory controller
	INSTANCE_PROGMEM : entity work.programMemory
		port map (
			pc,
			instr);
	
	INSTANCE_REGFILE : entity work.registerFile
		port map (
			instr(19 downto 15),
			instr(24 downto 20),
			rd1,
			rd2,
			dataOut,
			instr (11 downto 7),
			wr,
			clk);
	
	-- Should be updated to some sort of memory controller
	INSTANCE_DATAMEM : entity work.dataMemory
		port map (
			rd2,
         dataOut,
         aluResult,
         wd,
         clk);
	
	-- Extender now extends all instruction types
	-- Should cleanup
	INSTANCE_IMMEXT : entity work.immExtender
		port map (
			instr (31 downto 7),
			instr (6 downto 0),
			immExtend);
			
	-- Dumb ALU right now that just adds
	-- should change to raw logic that synthesises better
	INSTANCE_ALU : entity work.ALU
		port map (
			rd1,
			immExtend,
			aluResult);
			
	INSTANCE_DECODE : entity work. opcodeDecode
		port map (
			instr (6 downto 0),
			wr,
			wd);
			
			
	
	testSwitch : process (rd1,btn1,btn2,btn3) is
	begin
		if (btn1 = '0' and btn2 = '1' and btn3 = '1') then
			test <= rd1 (15 downto 8);
		elsif (btn1 = '1' and btn2 = '0' and btn3 = '1') then
			test <= rd1 (23 downto 16);
		elsif (btn1 = '1' and btn2 = '1' and btn3 = '0') then
			test <= rd1 (31 downto 24);
		else
			test <= rd1 (7 downto 0);
		end if;
	end process testSwitch;
	
end Behavioral;

