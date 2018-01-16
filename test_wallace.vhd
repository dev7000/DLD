--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   16:22:56 01/16/2018
-- Design Name:   
-- Module Name:   /home/nikhilsamrat/vhdl_buffer/test_wallace.vhd
-- Project Name:  vhdl_buffer
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: wallace_multiplier
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY test_wallace IS
END test_wallace;
 
ARCHITECTURE behavior OF test_wallace IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT wallace_multiplier
    PORT(
         a : IN  std_logic_vector(2 downto 0);
         b : IN  std_logic_vector(2 downto 0);
         s : OUT  std_logic_vector(5 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal a : std_logic_vector(2 downto 0) := (others => '0');
   signal b : std_logic_vector(2 downto 0) := (others => '0');

 	--Outputs
   signal s : std_logic_vector(5 downto 0);
   -- No clocks detected in port list. Replace <clock> below with 
   -- appropriate port name 
 
  -- constant <clock>_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: wallace_multiplier PORT MAP (
          a => a,
          b => b,
          s => s
        );

   -- Clock process definitions
  -- <clock>_process :process
--   begin
--		<clock> <= '0';
--		wait for <clock>_period/2;
--		<clock> <= '1';
--		wait for <clock>_period/2;
--   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      --wait for 100 ns;	
		a <= "100";
		b <= "000";
		wait for 100 ns;	
		a <= "100";
		b <= "001";
		wait for 100 ns;	
		a <= "100";
		b <= "010";
		wait for 100 ns;	
		a <= "100";
		b <= "011";
		wait for 100 ns;	
		a <= "100";
		b <= "100";
		wait for 100 ns;	
		a <= "100";
		b <= "101";
		wait for 100 ns;	
		a <= "100";
		b <= "110";
		wait for 100 ns;	
		a <= "100";
		b <= "111";
     -- wait for <clock>_period*10;

      -- insert stimulus here 

      wait;
   end process;

END;
