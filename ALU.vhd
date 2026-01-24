library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.All;


entity ALU is
    Port ( Input1 : in  STD_LOGIC_VECTOR (31 downto 0);
           Input2 : in  STD_LOGIC_VECTOR (31 downto 0);
           Output : out  STD_LOGIC_VECTOR (31 downto 0);
			  branchTrue: out STD_LOGIC);
end ALU;

architecture Behavioral of ALU is

begin

Output <= STD_LOGIC_VECTOR(unsigned(Input1) + unsigned(Input2));


end Behavioral;

