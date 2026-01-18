library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity immExtender is
    Port ( imm : in  STD_LOGIC_VECTOR (11 downto 0);
           immExtend : out  STD_LOGIC_VECTOR (31 downto 0));
end immExtender;

architecture Behavioral of immExtender is

begin

immExtend (11 downto 0) <= imm;
immExtend(12) <= imm(11);
immExtend(13) <= imm(11);
immExtend(14) <= imm(11);
immExtend(15) <= imm(11);
immExtend(16) <= imm(11);
immExtend(17) <= imm(11);
immExtend(18) <= imm(11);
immExtend(19) <= imm(11);
immExtend(20) <= imm(11);
immExtend(21) <= imm(11);
immExtend(22) <= imm(11);
immExtend(23) <= imm(11);
immExtend(24) <= imm(11);
immExtend(25) <= imm(11);
immExtend(26) <= imm(11);
immExtend(27) <= imm(11);
immExtend(28) <= imm(11);
immExtend(29) <= imm(11);
immExtend(30) <= imm(11);
immExtend(31) <= imm(11);



end Behavioral;

