-- This will be some sort of flash controller in the future
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.All;


entity programMemory is
    Port ( pc : in  STD_LOGIC_VECTOR (31 downto 0);
           instruction : out  STD_LOGIC_VECTOR (31 downto 0));
end programMemory;



architecture Behavioral of programMemory is

constant ins0 : std_logic_vector (31 downto 0) := "00000000000000000000000000000001";
constant ins1 : std_logic_vector (31 downto 0) := "00000000000000000000000000000011";
constant ins2 : std_logic_vector (31 downto 0) := "00000000000000000000000000000111";
constant ins3 : std_logic_vector (31 downto 0) := "00000000000000000000000000001111";
constant ins4 : std_logic_vector (31 downto 0) := "00000000000000000000000000011111";
constant ins5 : std_logic_vector (31 downto 0) := "00000000000000000000000000111111";
constant ins6 : std_logic_vector (31 downto 0) := "00000000000000000000000001111111";
constant ins7 : std_logic_vector (31 downto 0) := "00000000000000000000000011111111";
constant ins8 : std_logic_vector (31 downto 0) := "00000000000000000000000011111110";
constant ins9 : std_logic_vector (31 downto 0) := "00000000000000000000000011111100";
constant ins10 : std_logic_vector (31 downto 0) := "00000000000000000000000011111000";
constant ins11 : std_logic_vector (31 downto 0) := "00000000000000000000000011110000";
constant ins12 : std_logic_vector (31 downto 0) := "00000000000000000000000011100000";
constant ins13 : std_logic_vector (31 downto 0) := "00000000000000000000000011000000";
constant ins14 : std_logic_vector (31 downto 0) := "00000000000000000000000010000000";
constant ins15 : std_logic_vector (31 downto 0) := "00000000000000000000000000000000";

begin
	memoryLoad : process (pc) is
	begin
		if pc (5 downto 0) = "000000" then
			instruction <= ins0;
		elsif pc (5 downto 0) = "000100" then
			instruction <= ins1;
		elsif pc (5 downto 0) = "001000" then
			instruction <= ins2;
		elsif pc (5 downto 0) = "001100" then
			instruction <= ins3;
		elsif pc (5 downto 0) = "010000" then
			instruction <= ins4;
		elsif pc (5 downto 0) = "010100" then
			instruction <= ins5;
		elsif pc (5 downto 0) = "011000" then
			instruction <= ins6;
		elsif pc (5 downto 0) = "011100" then
			instruction <= ins7;
		elsif pc (5 downto 0) = "100000" then
			instruction <= ins8;
		elsif pc (5 downto 0) = "100100" then
			instruction <= ins9;
		elsif pc (5 downto 0) = "101000" then
			instruction <= ins10;
		elsif pc (5 downto 0) = "101100" then
			instruction <= ins11;
		elsif pc (5 downto 0) = "110000" then
			instruction <= ins12;
		elsif pc (5 downto 0) = "110100" then
			instruction <= ins13;
		elsif pc (5 downto 0) = "111000" then
			instruction <= ins14;
		elsif pc (5 downto 0) = "111100" then
			instruction <= ins15;
		end if;
	end process memoryLoad;
	
end Behavioral;

