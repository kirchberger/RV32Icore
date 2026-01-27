library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.numeric_std.All;


entity ALU is
    Port ( Input1 : in  STD_LOGIC_VECTOR (31 downto 0);
           Input2 : in  STD_LOGIC_VECTOR (31 downto 0);
           Output : out  STD_LOGIC_VECTOR (31 downto 0);
			  condBranch : in STD_LOGIC;
			  branchTrue: out STD_LOGIC;
			  func3 : in STD_LOGIC_VECTOR (2 downto 0);
			  func7 : in STD_LOGIC);
end ALU;

architecture Behavioral of ALU is

begin
			
	p_alu : process (Input1, Input2, condBranch, func3, func7) is
	begin
		if (condBranch = '1') then
			Output <= "00000000000000000000000000000000";
			if (func3 = "000") then --BEQ
				if (Input1 = Input2) then
					branchTrue <= '1';
				else 
					branchTrue <= '0';
				end if;
			elsif (func3 = "001") then -- BNE
				if (Input1 /= Input2) then
					branchTrue <= '1';
				else 
					branchTrue <= '0';
				end if;
			elsif (func3 = "100") then -- BLT
				if (signed(Input1) < signed(Input2)) then
					branchTrue <= '1';
				else 
					branchTrue <= '0';
				end if;
			elsif (func3 = "101") then -- BGT
				if (signed(Input1) >= signed(Input2)) then
					branchTrue <= '1';
				else 
					branchTrue <= '0';
				end if;
			elsif (func3 = "110") then -- BLTU
				if (unsigned(Input1) < unsigned(Input2)) then
					branchTrue <= '1';
				else 
					branchTrue <= '0';
				end if;
			elsif (func3 = "111") then -- BGTU
				if (unsigned(Input1) >= unsigned(Input2)) then
					branchTrue <= '1';
				else 
					branchTrue <= '0';
				end if;
			else
				branchTrue <= '0';
			end if;
		else
			branchTrue <= '0';
			if (func3 = "000") then -- ADD SUB
				if (func7 = '0') then
					Output <= STD_LOGIC_VECTOR(signed(Input1) + signed(Input2));
				else 
					Output <= STD_LOGIC_VECTOR(signed(Input1) - signed(Input2));
				end if;
			elsif (func3 = "001") then -- SLL
				Output <= STD_LOGIC_VECTOR(shift_left(unsigned(Input1), to_integer(unsigned(Input2(4 downto 0)))));
			elsif (func3 = "010") then -- SLT
				Output(31 downto 1) <= "0000000000000000000000000000000";
				if (signed(Input1) < signed(Input2)) then
					Output(0) <= '1'; 
				else
					Output(0) <= '0';
				end if;
			elsif (func3 = "011") then  -- SLTU
				Output(31 downto 1) <= "0000000000000000000000000000000";
				if (unsigned(Input1) < unsigned(Input2)) then
					Output(0) <= '1'; 
				else
					Output(0) <= '0';
				end if;
			elsif (func3 = "100") then -- XOR
				Output <= Input1 xor Input2;
			elsif (func3 = "101") then -- Right Shifts
				if (func7 = '0') then
					Output <= STD_LOGIC_VECTOR(shift_right(unsigned(Input1), to_integer(unsigned(Input2(4 downto 0)))));		
				else
					Output <= STD_LOGIC_VECTOR(shift_left(signed(Input1), to_integer(signed(Input2(4 downto 0)))));
				end if;
			elsif (func3 = "110") then -- OR
				Output <= Input1 or Input2;
			elsif (func3 = "111") then -- AND
				Output <= Input1 and Input2;
			else
				Output <= "00000000000000000000000000000000";
			end if;
		end if;
	end process p_alu;


end Behavioral;

