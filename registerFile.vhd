library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.All;

entity registerFile is
	port (
		--opcode : in STD_LOGIC_VECTOR (6 downto 0);
		rs1: in STD_LOGIC_VECTOR (4 downto 0); 
		rs2: in STD_LOGIC_VECTOR (4 downto 0);
		rd1: out STD_LOGIC_VECTOR (31 downto 0);
		rd2: out STD_LOGIC_VECTOR (31 downto 0);
		dataIn: in STD_LOGIC_VECTOR (31 downto 0);
		rd: in STD_LOGIC_VECTOR (4 downto 0); --register destination to write to registers
		wr: in STD_LOGIC;
		clk: in STD_LOGIC);
end registerFile;

architecture Behavioral of registerFile is

-- 32 x registers
type reg is array(0 to 31) of STD_LOGIC_VECTOR (31 downto 0);
signal x : reg;
begin
	
	rs1Load : process (rs1, x) is
	begin
		rd1 <= x(to_integer(unsigned(rs1)));
	end process rs1Load;
	
	rs2Load : process (rs2, x) is
	begin
		rd2 <= x(to_integer(unsigned(rs2)));
	end process rs2Load;
	
	rdWrite : process (dataIn, wr, clk, rd) is 
	begin
		if (wr = '1' and rising_edge(clk)) then
			x(to_integer(unsigned(rd))) <= dataIn;
		end if;
	end process rdWrite;

end Behavioral;

