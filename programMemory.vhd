-- This will be some sort of flash controller in the future
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.All;


entity programMemory is
    Port ( pc : in  STD_LOGIC_VECTOR (31 downto 0);
           instruction : out  STD_LOGIC_VECTOR (31 downto 0));
end programMemory;



architecture Behavioral of programMemory is
-- lw x2 x1 
constant ins0 : std_logic_vector (31 downto 0) := "00000000010000001010000100000011";
-- lw x1 x2
constant ins1 : std_logic_vector (31 downto 0) := "00000000000000010010000010100011"; 
-- addi x3 x2 4
constant ins2 : std_logic_vector (31 downto 0) := "00000000010000010010000110010011"; 
-- 
constant ins3 : std_logic_vector (31 downto 0) := "00000000001000011010000000100011"; 
constant ins4 : std_logic_vector (31 downto 0) := "00000000000100000010000000100011";
constant ins5 : std_logic_vector (31 downto 0) := "00000000000000101000000000111111";
constant ins6 : std_logic_vector (31 downto 0) := "00000000000000110000000001111111";
constant ins7 : std_logic_vector (31 downto 0) := "00000000000000111000000011111111";
constant ins8 : std_logic_vector (31 downto 0) := "00000000000001000000000011111110";
constant ins9 : std_logic_vector (31 downto 0) := "00000000000001001000000011111100";
constant ins10 : std_logic_vector (31 downto 0) := "00000000000001010000000011111000";
constant ins11 : std_logic_vector (31 downto 0) := "00000000000001011000000011110000";
constant ins12 : std_logic_vector (31 downto 0) := "00000000000001100000000011100000";
constant ins13 : std_logic_vector (31 downto 0) := "00000000000001101000000011000000";
constant ins14 : std_logic_vector (31 downto 0) := "00000000000001110000000010000000";
constant ins15 : std_logic_vector (31 downto 0) := "00000000000001111000000000000000";

begin
	memoryLoad : process (pc) is
	begin
		if pc (31 downto 0) = "00000000000000000000000000000000" then
			instruction <= ins0;
		elsif pc (31 downto 0) = "00000000000000000000000000000100" then
			instruction <= ins1;
		elsif pc (31 downto 0) = "00000000000000000000000000001000" then
			instruction <= ins2;
		elsif pc (31 downto 0) = "00000000000000000000000000001100" then
			instruction <= ins3;
		elsif pc (31 downto 0) = "00000000000000000000000000010000" then
			instruction <= ins4;
		elsif pc (31 downto 0) = "00000000000000000000000000010100" then
			instruction <= ins5;
		elsif pc (31 downto 0) = "00000000000000000000000000011000" then
			instruction <= ins6;
		elsif pc (31 downto 0) = "00000000000000000000000000011100" then
			instruction <= ins7;
		elsif pc (31 downto 0) = "00000000000000000000000000100000" then
			instruction <= ins8;
		elsif pc (31 downto 0) = "00000000000000000000000000100100" then
			instruction <= ins9;
		elsif pc (31 downto 0) = "00000000000000000000000000101000" then
			instruction <= ins10;
		elsif pc (31 downto 0) = "00000000000000000000000000101100" then
			instruction <= ins11;
		elsif pc (31 downto 0) = "00000000000000000000000000110000" then
			instruction <= ins12;
		elsif pc (31 downto 0) = "00000000000000000000000000110100" then
			instruction <= ins13;
		elsif pc (31 downto 0) = "00000000000000000000000000111000" then
			instruction <= ins14;
		elsif pc (31 downto 0) = "00000000000000000000000000111100" then
			instruction <= ins15;
		else
			instruction <= "00000000000000000000000000000000";
		end if;
	end process memoryLoad;
	
end Behavioral;

