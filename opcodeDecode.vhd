library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity opcodeDecode is
    Port ( opcode : in  STD_LOGIC_VECTOR (6 downto 0);
	        func3 : in STD_LOGIC_VECTOR (2 downto 0);
			  func7 : in STD_LOGIC_VECTOR (11 downto 0);
           wr : out  STD_LOGIC;
           wd : out  STD_LOGIC;
			  rdInMult: out STD_LOGIC_VECTOR (1 downto 0);
			  aluFirstMult : out STD_LOGIC;
			  aluSecMult : out STD_LOGIC;
			  pcNextMult : out STD_LOGIC;
			  condBranch : out STD_LOGIC;
			  aluFunc3 : out STD_LOGIC_VECTOR (2 downto 0);
			  aluFunc7 : out STD_LOGIC);
end opcodeDecode;

architecture Behavioral of opcodeDecode is

begin
	decode : process (opcode, func3, func7) is -- No branch instructions
	begin
		if (opcode = "0110111") then -- LUI
			wr <= '1'; -- writing Upper Immediate to register
			wd <= '0';
			rdInMult <= "00"; -- imm
			aluFirstMult <= '0';
			aluSecMult <= '0';
			pcNextMult <= '0';
			condBranch  <= '0';
			aluFunc3 <= "000";
			aluFunc7 <= '0';
		elsif (opcode = "0010111") then --AUIPC
			wr <= '1'; 
			wd <= '0';
			rdInMult <= "01"; -- alu
			aluFirstMult <= '0'; -- pc
			aluSecMult <= '0'; -- imm
			pcNextMult <= '0';
			condBranch  <= '0';
			aluFunc3 <= "000";
			aluFunc7 <= '0';
		elsif (opcode = "1101111") then -- JAL
			wr <= '1'; -- writing next address
			wd <= '0';
			rdInMult <= "10"; -- pcinc
			aluFirstMult <= '0'; -- pc
			aluSecMult <= '0'; -- imm
			pcNextMult <= '1'; -- alu
			condBranch  <= '0';
			aluFunc3 <= "000";
			aluFunc7 <= '0';
		elsif (opcode = "1100111") then -- JALR
			wr <= '1'; 
			wd <= '0';
			rdInMult <= "10"; -- pc inc
			aluFirstMult <= '1'; -- rd1
			aluSecMult <= '0'; -- imm
			pcNextMult <= '1'; -- alu
			condBranch  <= '0';
			aluFunc3 <= "000";
			aluFunc7 <= '0';
		elsif (opcode = "1100011") then -- Conditional Branch Instructions
			wr <= '0'; --
			wd <= '0';
			rdInMult <= "10";
			aluFirstMult <= '1'; -- rd1
			aluSecMult <= '1'; -- rd2
			pcNextMult <= '0';
			condBranch  <= '1';
			aluFunc3 <= func3;
			aluFunc7 <= '0';
		elsif (opcode = "0000011") then -- Load Instructions
			wr <= '1';
			wd <= '0';
			rdInMult <= "11"; -- data mem
			aluFirstMult <= '1'; -- rd1 
			aluSecMult <= '0'; -- imm
			pcNextMult <= '0';
			condBranch  <= '0';
			aluFunc3 <= func3;
			aluFunc7 <= '0';
		elsif (opcode = "0100011") then -- Store instructions
			wr <= '0';
			wd <= '1';
			rdInMult <= "00";
			aluFirstMult <= '1'; -- rd1
			aluSecMult <= '0'; -- imm
			pcNextMult <= '0';
			condBranch  <= '0';
			aluFunc3 <= func3;
			aluFunc7 <= '0';
		elsif (opcode = "0010011") then -- Reg Immediate Operations
			wr <= '1';
			wd <= '0';
			rdInMult <= "01"; -- alu
			aluFirstMult <= '1'; -- rd1
			aluSecMult <= '0'; -- imm
			pcNextMult <= '0';
			condBranch  <= '0';
			aluFunc3 <= func3;
			if (func3 = "101") then
				aluFunc7 <= func7(10);
			else
				aluFunc7 <= '0';
			end if;
		elsif (opcode = "0110011") then  -- Reg Reg Operations
			wr <= '1';
			wd <= '0';
			rdInMult <= "01"; -- alu
			aluFirstMult <= '1'; -- rd1
			aluSecMult <= '1'; -- rd2
			pcNextMult <= '0';
			condBranch  <= '0';
			aluFunc3 <= func3;
			aluFunc7 <= func7(10);
		elsif (opcode = "0001111") then -- FENCE (NOT SURE)
			wr <= '0';
			wd <= '0';
			rdInMult <= "00";
			aluFirstMult <= '0';
			aluSecMult <= '0';
			pcNextMult <= '0';
			condBranch  <= '0';
			aluFunc3 <= "000";
			aluFunc7 <= '0';
		elsif (opcode = "1110011") then -- Environment or Break 
			wr <= '0';
			wd <= '0';
			rdInMult <= "00";
			aluFirstMult <= '0';
			aluSecMult <= '0';
			pcNextMult <= '0';
			condBranch  <= '0';
			aluFunc3 <= "000";
			aluFunc7 <= '0';
		else 
			wr <= '0';
			wd <= '0';
			rdInMult <= "00";
			aluFirstMult <= '0';
			aluSecMult <= '0';
			pcNextMult <= '0';
			condBranch  <= '0';
			aluFunc3 <= "000";
			aluFunc7 <= '0';
		end if;
	end process decode;

end Behavioral;

