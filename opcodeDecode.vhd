library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity opcodeDecode is
    Port ( opcode : in  STD_LOGIC_VECTOR (6 downto 0);
           wr : out  STD_LOGIC;
           wd : out  STD_LOGIC);
end opcodeDecode;

architecture Behavioral of opcodeDecode is

begin
	decode : process (opcode) is -- No branch instructions
	begin
		if (opcode = "0000011" or opcode = "0010011" or opcode = "0110011") then
			wr <= '1';
			wd <= '0';
		elsif (opcode = "0100011") then
			wr <= '0';
			wd <= '1';
		else 
			wr <= '0';
			wd <= '1';
		end if;
	end process decode;

end Behavioral;

