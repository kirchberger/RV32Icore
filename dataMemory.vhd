-- will be RAM/SPI controller in the future
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.All;

entity dataMemory is
    Port ( dataIn : in  STD_LOGIC_VECTOR (31 downto 0);
           dataOut : out  STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
           addr : in  STD_LOGIC_VECTOR (31 downto 0);
           wr : in  STD_LOGIC;
           clk : in  STD_LOGIC);
end dataMemory;

architecture Behavioral of dataMemory is

signal mem0 : std_logic_vector (31 downto 0) := "00000000000000000000000000001100";
signal mem1 : std_logic_vector (31 downto 0) := "00000000000000001000000000001011";
signal mem2 : std_logic_vector (31 downto 0) := "00000000000000010000000000001111";
signal mem3 : std_logic_vector (31 downto 0) := "00000000000000011000000000001101";
signal mem4 : std_logic_vector (31 downto 0) := "00000000000000100000000000011101";
signal mem5 : std_logic_vector (31 downto 0) := "00000000000000101000000000111111";
signal mem6 : std_logic_vector (31 downto 0) := "00000000000000110000000001111111";
signal mem7 : std_logic_vector (31 downto 0) := "00000000000000111000000011111111";
signal mem8 : std_logic_vector (31 downto 0) := "00000000000001000000000011110110";
signal mem9 : std_logic_vector (31 downto 0) := "00000000000001001000000011111101";
signal mem10 : std_logic_vector (31 downto 0) := "00000000000001010000000011111001";
signal mem11 : std_logic_vector (31 downto 0) := "00000000000001011000000011110001";
signal mem12 : std_logic_vector (31 downto 0) := "00000000000001100000000011100001";
signal mem13 : std_logic_vector (31 downto 0) := "00000000000001101000000011000001";
signal mem14 : std_logic_vector (31 downto 0) := "00000000000001110000000010000001";
signal mem15 : std_logic_vector (31 downto 0) := "00000000000001111000000000000001";

begin

  dataMemoryLoad : process (addr) is
	begin
		if addr (5 downto 0) = "000000" then
			dataOut <= mem0;
		elsif addr (5 downto 0) = "000100" then
			dataOut <= mem1;
		elsif addr (5 downto 0) = "001000" then
			dataOut <= mem2;
		elsif addr (5 downto 0) = "001100" then
			dataOut <= mem3;
		elsif addr (5 downto 0) = "010000" then
			dataOut <= mem4;
		elsif addr (5 downto 0) = "010100" then
			dataOut <= mem5;
		elsif addr (5 downto 0) = "011000" then
			dataOut <= mem6;
		elsif addr (5 downto 0) = "011100" then
			dataOut <= mem7;
		elsif addr (5 downto 0) = "100000" then
			dataOut <= mem8;
		elsif addr (5 downto 0) = "100100" then
			dataOut <= mem9;
		elsif addr (5 downto 0) = "101000" then
			dataOut <= mem10;
		elsif addr (5 downto 0) = "101100" then
			dataOut <= mem11;
		elsif addr (5 downto 0) = "110000" then
			dataOut <= mem12;
		elsif addr (5 downto 0) = "110100" then
			dataOut <= mem13;
		elsif addr (5 downto 0) = "111000" then
			dataOut <= mem14;
		elsif addr (5 downto 0) = "111100" then
			dataOut <= mem15;
		end if;
	
	
	end process dataMemoryLoad;

	dataMemoryStore : process (addr, wr, clk, dataIn) is
	begin
      if (rising_edge(clk) and wr = '1') then
			if addr (5 downto 0) = "000000" then
				 mem0 <= dataIn;
			elsif addr (5 downto 0) = "000100" then
				mem1 <= dataIn;
			elsif addr (5 downto 0) = "001000" then
				mem2 <= dataIn;
			elsif addr (5 downto 0) = "001100" then
				mem3 <= dataIn;
			elsif addr (5 downto 0) = "010000" then
				mem4 <= dataIn;
			elsif addr (5 downto 0) = "010100" then
				mem5 <= dataIn;
			elsif addr (5 downto 0) = "011000" then
				mem6 <= dataIn;
			elsif addr (5 downto 0) = "011100" then
				mem7 <= dataIn;
			elsif addr (5 downto 0) = "100000" then
				mem8 <= dataIn;
			elsif addr (5 downto 0) = "100100" then
				mem9 <= dataIn;
			elsif addr (5 downto 0) = "101000" then
				mem10 <= dataIn;
			elsif addr (5 downto 0) = "101100" then
				mem11 <= dataIn;
			elsif addr (5 downto 0) = "110000" then
				mem12 <= dataIn;
			elsif addr (5 downto 0) = "110100" then
				mem13 <= dataIn;
			elsif addr (5 downto 0) = "111000" then
				mem14 <= dataIn;
			elsif addr (5 downto 0) = "111100" then
				mem15 <= dataIn;
			end if;
		end if;
	end process dataMemoryStore;

end Behavioral;

