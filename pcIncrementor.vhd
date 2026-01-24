library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.All;

entity pcIncrementor is
    Port ( Input : in  STD_LOGIC_VECTOR (31 downto 0);
           Output : out  STD_LOGIC_VECTOR (31 downto 0);
			  imm : in STD_LOGIC_VECTOR (31 downto 0);
			  condBranch : in STD_LOGIC;
			  branchTrue :in STD_LOGIC);
end pcIncrementor;

architecture Behavioral of pcIncrementor is

constant incrementValue : natural := 4;

begin
	
	p_pcInc : process (Input, imm, condBranch, BranchTrue) is 
	begin
		if (condBranch = '1' and branchTrue = '1') then
			Output <= std_logic_vector(signed(Input) + signed(imm));
		else 
			Output <= std_logic_vector(signed(Input) + incrementValue);
		end if;
	end process p_pcInc;

end Behavioral;

