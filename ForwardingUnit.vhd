library IEEE;
use IEEE.std_logic_1164.all;

entity ForwardingUnit is
    port(ID_RsReg, ID_RtReg, EX_RdReg, MEM_RdReg, WB_RdReg : in std_logic_vector(4 downto 0);
		EX_UpdatedVal, MEM_UpdatedVal, WB_UpdatedVal : in std_logic_vector(31 downto 0);
		iCLK : in std_logic;
		ID_ForwardedRsVal, ID_ForwardedRtVal : out std_logic_vector(31 downto 0);
		ID_UseForwardedRt, ID_UseForwardedRs : out std_logic);
end ForwardingUnit;

architecture d_ForwardingUnit of ForwardingUnit is
    begin
	
	forwardingProc : process (iCLK) begin
		if (ID_RsReg = EX_RdReg and ID_RsReg /= "00000") then
			ID_ForwardedRsVal <= EX_UpdatedVal;
			ID_UseForwardedRs <= '1';
		elsif (ID_RsReg = MEM_RdReg and ID_RsReg /= "00000") then
			ID_ForwardedRsVal <= MEM_UpdatedVal;
			ID_UseForwardedRs <= '1';
		elsif (ID_RsReg = WB_RdReg and ID_RsReg /= "00000") then
			ID_ForwardedRsVal <= WB_UpdatedVal;
			ID_UseForwardedRs <= '1';
		else
			ID_ForwardedRsVal <= x"00000000";
			ID_UseForwardedRs <= '0';
		end if;
		
		if (ID_RtReg = EX_RdReg and ID_RtReg /= "00000") then
			ID_ForwardedRtVal <= EX_UpdatedVal;
			ID_UseForwardedRt <= '1';
		elsif (ID_RtReg = MEM_RdReg and ID_RtReg /= "00000") then
			ID_ForwardedRtVal <= MEM_UpdatedVal;
			ID_UseForwardedRt <= '1';
		elsif (ID_RtReg = WB_RdReg and ID_RtReg /= "00000") then
			ID_ForwardedRtVal <= WB_UpdatedVal;
			ID_UseForwardedRt <= '1';
		else
			ID_ForwardedRtVal <= x"00000000";
			ID_UseForwardedRt <= '0';
		end if;
	end process;
end d_ForwardingUnit;