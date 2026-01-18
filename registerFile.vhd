library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.All;

entity registerFile is
	port (
		--opcode : in STD_LOGIC_VECTOR (6 downto 0);
		rs1: in STD_LOGIC_VECTOR (4 downto 0);
		rs2: in STD_LOGIC_VECTOR (4 downto 0);
		rd1: out STD_LOGIC_VECTOR (31 downto 0);
		rd2: out STD_LOGIC_VECTOR (31 downto 0));
end registerFile;

architecture Behavioral of registerFile is

signal x0 : std_logic_vector (31 downto 0) := "00000000000000000000000000000000";
signal x1 : std_logic_vector (31 downto 0) := "00000000000000000000000000000010";
signal x2 : std_logic_vector (31 downto 0) := "00000000000000000000000000000011";
signal x3 : std_logic_vector (31 downto 0) := "00000000000000000000000000000100";
signal x4 : std_logic_vector (31 downto 0) := "00000000000000000000000000000101";
signal x5 : std_logic_vector (31 downto 0) := "00000000000000000000000000000110";
signal x6 : std_logic_vector (31 downto 0) := "00000000000000000000000000000111";
signal x7 : std_logic_vector (31 downto 0) := "00000000000000000000000000001000";
signal x8 : std_logic_vector (31 downto 0) := "00000000000000000000000000001001";
signal x9 : std_logic_vector (31 downto 0) := "00000000000000000000000000001010";
signal x10 : std_logic_vector (31 downto 0) := "00000000000000000000000000001011";
signal x11 : std_logic_vector (31 downto 0) := "00000000000000000000000000001100";
signal x12 : std_logic_vector (31 downto 0) := "00000000000000000000000000001101";
signal x13 : std_logic_vector (31 downto 0) := "00000000000000000000000000001110";
signal x14 : std_logic_vector (31 downto 0) := "00000000000000000000000000001111";
signal x15 : std_logic_vector (31 downto 0) := "00000000000000000000000000000000";
signal x16 : std_logic_vector (31 downto 0) := "00000000000000000000000000000000";
signal x17 : std_logic_vector (31 downto 0) := "00000000000000000000000000000000";
signal x18 : std_logic_vector (31 downto 0) := "00000000000000000000000000000000";
signal x19 : std_logic_vector (31 downto 0) := "00000000000000000000000000000000";
signal x20 : std_logic_vector (31 downto 0) := "00000000000000000000000000000000";
signal x21 : std_logic_vector (31 downto 0) := "00000000000000000000000000000000";
signal x22 : std_logic_vector (31 downto 0) := "00000000000000000000000000000000";
signal x23 : std_logic_vector (31 downto 0) := "00000000000000000000000000000000";
signal x24 : std_logic_vector (31 downto 0) := "00000000000000000000000000000000";
signal x25 : std_logic_vector (31 downto 0) := "00000000000000000000000000000000";
signal x26 : std_logic_vector (31 downto 0) := "00000000000000000000000000000000";
signal x27 : std_logic_vector (31 downto 0) := "00000000000000000000000000000000";
signal x28 : std_logic_vector (31 downto 0) := "00000000000000000000000000000000";
signal x29 : std_logic_vector (31 downto 0) := "00000000000000000000000000000000";
signal x30 : std_logic_vector (31 downto 0) := "00000000000000000000000000000000";
signal x31 : std_logic_vector (31 downto 0) := "00000000000000000000000000000000";


begin

	rs1Load : process (rs1) is
	begin
		if rs1 (4 downto 0) = "00000" then
			rd1 <= x0;
		elsif rs1 (4 downto 0) = "00001" then
			rd1 <= x1;
		elsif rs1 (4 downto 0) = "00010" then
			rd1 <= x2;
		elsif rs1 (4 downto 0) = "00011" then
			rd1 <= x3;
		elsif rs1 (4 downto 0) = "00100" then
			rd1 <= x4;
		elsif rs1 (4 downto 0) = "00101" then
			rd1 <= x5;
		elsif rs1 (4 downto 0) = "00110" then
			rd1 <= x6;		
		elsif rs1 (4 downto 0) = "00111" then
			rd1 <= x7;
		elsif rs1 (4 downto 0) = "01000" then
			rd1 <= x8;
		elsif rs1 (4 downto 0) = "01001" then
			rd1 <= x9;
		elsif rs1 (4 downto 0) = "01010" then
			rd1 <= x10;
		elsif rs1 (4 downto 0) = "01011" then
			rd1 <= x11;
		elsif rs1 (4 downto 0) = "01100" then
			rd1 <= x12;	
		elsif rs1 (4 downto 0) = "01101" then
			rd1 <= x13;
		elsif rs1 (4 downto 0) = "01110" then
			rd1 <= x14;
		elsif rs1 (4 downto 0) = "01111" then
			rd1 <= x15;
		elsif rs1 (4 downto 0) = "10000" then
			rd1 <= x16;
		elsif rs1 (4 downto 0) = "10001" then
			rd1 <= x17;
		elsif rs1 (4 downto 0) = "10010" then
			rd1 <= x18;		
		elsif rs1 (4 downto 0) = "10011" then
			rd1 <= x19;
		elsif rs1 (4 downto 0) = "10100" then
			rd1 <= x20;
		elsif rs1 (4 downto 0) = "10101" then
			rd1 <= x21;
		elsif rs1 (4 downto 0) = "10110" then
			rd1 <= x22;
		elsif rs1 (4 downto 0) = "10111" then
			rd1 <= x23;
		elsif rs1 (4 downto 0) = "11000" then
			rd1 <= x24;
		elsif rs1 (4 downto 0) = "11001" then
			rd1 <= x25;
		elsif rs1 (4 downto 0) = "11010" then
			rd1 <= x26;
		elsif rs1 (4 downto 0) = "11011" then
			rd1 <= x27;
		elsif rs1 (4 downto 0) = "11100" then
			rd1 <= x28;
		elsif rs1 (4 downto 0) = "11101" then
			rd1 <= x29;
		elsif rs1 (4 downto 0) = "11110" then
			rd1 <= x30;		
		elsif rs1 (4 downto 0) = "11111" then
			rd1 <= x31;
		end if;
	end process rs1Load;


	rs2Load : process (rs2) is
	begin
		if rs2 = "000000" then
			rd2 <= x0;
		elsif rs2 (4 downto 0) = "00001" then
			rd2 <= x1;
		elsif rs2 (4 downto 0) = "00010" then
			rd2 <= x2;
		elsif rs2 (4 downto 0) = "00011" then
			rd2 <= x3;
		elsif rs2 (4 downto 0) = "00100" then
			rd2 <= x4;
		elsif rs2 (4 downto 0) = "00101" then
			rd2 <= x5;
		elsif rs2 (4 downto 0) = "00110" then
			rd2 <= x6;		
		elsif rs2 (4 downto 0) = "00111" then
			rd2 <= x7;
		elsif rs2 (4 downto 0) = "01000" then
			rd2 <= x8;
		elsif rs2 (4 downto 0) = "01001" then
			rd2 <= x9;
		elsif rs2 (4 downto 0) = "01010" then
			rd2 <= x10;
		elsif rs2 (4 downto 0) = "01011" then
			rd2 <= x11;
		elsif rs2 (4 downto 0) = "01100" then
			rd2 <= x12;	
		elsif rs2 (4 downto 0) = "01101" then
			rd2 <= x13;
		elsif rs2 (4 downto 0) = "01110" then
			rd2 <= x14;
		elsif rs2 (4 downto 0) = "01111" then
			rd2 <= x15;
		elsif rs2 (4 downto 0) = "10000" then
			rd2 <= x16;
		elsif rs2 (4 downto 0) = "10001" then
			rd2 <= x17;
		elsif rs2 (4 downto 0) = "10010" then
			rd2 <= x18;		
		elsif rs2 (4 downto 0) = "10011" then
			rd2 <= x19;
		elsif rs2 (4 downto 0) = "10100" then
			rd2 <= x20;
		elsif rs2 (4 downto 0) = "10101" then
			rd2 <= x21;
		elsif rs2 (4 downto 0) = "10110" then
			rd2 <= x22;
		elsif rs2 (4 downto 0) = "10111" then
			rd2 <= x23;
		elsif rs2 (4 downto 0) = "11000" then
			rd2 <= x24;
		elsif rs2 (4 downto 0) = "11001" then
			rd2 <= x25;
		elsif rs2 (4 downto 0) = "11010" then
			rd2 <= x26;
		elsif rs2 (4 downto 0) = "11011" then
			rd2 <= x27;
		elsif rs2 (4 downto 0) = "11100" then
			rd2 <= x28;
		elsif rs2 (4 downto 0) = "11101" then
			rd2 <= x29;
		elsif rs2 (4 downto 0) = "11110" then
			rd2 <= x30;		
		elsif rs2 (4 downto 0) = "11111" then
			rd2 <= x31;
		end if;
	end process rs2Load;

end Behavioral;

