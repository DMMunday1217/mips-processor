library IEEE;
use IEEE.std_logic_1164.all;

entity HazardDetection is
    port(ID_OpCode : in std_logic_vector(5 downto 0);
	ID_Rd, IF_Rs, IF_Rt : in std_logic_vector(4 downto 0);
	CLK	: in std_logic;
	StallIFID, PCWrEnable : out std_logic);
end HazardDetection;

architecture d_HazardDetection of HazardDetection is
    begin
	
	hazardProc : process (CLK) begin
		if (ID_OpCode = "100011" and (ID_Rd = IF_Rt or ID_Rd = IF_Rs)) then
			StallIFID <= '1';
			PCWrEnable <= '0';
		else 
			StallIFID <= '0';
			PCWrEnable <= '1';
		end if;
	end process;
end d_HazardDetection;