library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity immExtender is
    Port ( 	imm : in  STD_LOGIC_VECTOR (31 downto 7);
				opcode : in STD_LOGIC_VECTOR (6 downto 0);
				immExtend : out  STD_LOGIC_VECTOR (31 downto 0));
end immExtender;

architecture Behavioral of immExtender is

begin

extendImm : process (opcode,imm) is
begin
	if ((opcode = "1100111") or (opcode = "0000011") or (opcode = "0010011")) then -- I type
		immExtend (11 downto 0) <= imm (31 downto 20);
		immExtend(12) <= imm(31);
		immExtend(13) <= imm(31);
		immExtend(14) <= imm(31);
		immExtend(15) <= imm(31);
		immExtend(16) <= imm(31);
		immExtend(17) <= imm(31);
		immExtend(18) <= imm(31);
		immExtend(19) <= imm(31);
		immExtend(20) <= imm(31);
		immExtend(21) <= imm(31);
		immExtend(22) <= imm(31);
		immExtend(23) <= imm(31);
		immExtend(24) <= imm(31);
		immExtend(25) <= imm(31);
		immExtend(26) <= imm(31);
		immExtend(27) <= imm(31);
		immExtend(28) <= imm(31);
		immExtend(29) <= imm(31);
		immExtend(30) <= imm(31);
		immExtend(31) <= imm(31);
	elsif (opcode = "0100011") then -- S type
		immExtend (4 downto 0) <= imm (11 downto 7);
		immExtend (11 downto 5) <= imm (31 downto 25);
		immExtend(12) <= imm(31);
		immExtend(13) <= imm(31);
		immExtend(14) <= imm(31);
		immExtend(15) <= imm(31);
		immExtend(16) <= imm(31);
		immExtend(17) <= imm(31);
		immExtend(18) <= imm(31);
		immExtend(19) <= imm(31);
		immExtend(20) <= imm(31);
		immExtend(21) <= imm(31);
		immExtend(22) <= imm(31);
		immExtend(23) <= imm(31);
		immExtend(24) <= imm(31);
		immExtend(25) <= imm(31);
		immExtend(26) <= imm(31);
		immExtend(27) <= imm(31);
		immExtend(28) <= imm(31);
		immExtend(29) <= imm(31);
		immExtend(30) <= imm(31);
		immExtend(31) <= imm(31);
	elsif (opcode = "1100011") then -- B type
		immExtend (4 downto 1) <= imm (11 downto 8);
		immExtend (10 downto 5) <= imm (30 downto 25);
		immExtend(0) <= '0';
		immExtend(11) <= imm(7);
		immExtend(12) <= imm(31);
		immExtend(13) <= imm(31);
		immExtend(14) <= imm(31);
		immExtend(15) <= imm(31);
		immExtend(16) <= imm(31);
		immExtend(17) <= imm(31);
		immExtend(18) <= imm(31);
		immExtend(19) <= imm(31);
		immExtend(20) <= imm(31);
		immExtend(21) <= imm(31);
		immExtend(22) <= imm(31);
		immExtend(23) <= imm(31);
		immExtend(24) <= imm(31);
		immExtend(25) <= imm(31);
		immExtend(26) <= imm(31);
		immExtend(27) <= imm(31);
		immExtend(28) <= imm(31);
		immExtend(29) <= imm(31);
		immExtend(30) <= imm(31);
		immExtend(31) <= imm(31);
	elsif (opcode = "0110111" or opcode = "0010111") then -- U type
		immExtend (31 downto 12) <= imm (31 downto 12);
		immExtend (11 downto 0) <= "000000000000";
	elsif (opcode = "1101111") then -- J type
		immExtend(0) <= '0';
		immExtend (10 downto 1) <= imm (30 downto 21);
		immExtend(11) <= imm(20);
		immExtend (19 downto 12) <= imm (19 downto 12);
		immExtend(20) <= imm(31);
		immExtend(21) <= imm(31);
		immExtend(22) <= imm(31);
		immExtend(23) <= imm(31);
		immExtend(24) <= imm(31);
		immExtend(25) <= imm(31);
		immExtend(26) <= imm(31);
		immExtend(27) <= imm(31);
		immExtend(28) <= imm(31);
		immExtend(29) <= imm(31);
		immExtend(30) <= imm(31);
		immExtend(31) <= imm(31);
	else
		immExtend <= "00000000000000000000000000000000";
	end if;
end process extendImm;

end Behavioral;

