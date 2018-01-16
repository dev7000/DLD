----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:44:54 01/16/2018 
-- Design Name: 
-- Module Name:    wallace_multiplier - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity wallace_multiplier is
    Port ( a : in  STD_LOGIC_VECTOR (2 downto 0);
           b : in  STD_LOGIC_VECTOR (2 downto 0);
           s : out  STD_LOGIC_VECTOR (5 downto 0));
end wallace_multiplier;

architecture Behavioral of wallace_multiplier is

component full_adder Port ( 
			  x : in  STD_LOGIC;
           y : in  STD_LOGIC;
           c1 : in  STD_LOGIC;
           c : out  STD_LOGIC;
           s : out  STD_LOGIC);
end component;

component five_bit_fulladder  Port ( 
			  a : in  STD_LOGIC_VECTOR (4 downto 0);
           b : in  STD_LOGIC_VECTOR (4 downto 0);
           s : out  STD_LOGIC_VECTOR (4 downto 0);
           c : out  STD_LOGIC);
end component;	
		  
signal carry,sum : std_logic_vector (2 downto 0);
signal S1,S2,S3 : std_logic_vector (4 downto 0);
signal C : std_logic ;
 			  			  
begin

u0 : full_adder port map(
				x => a(0) and b(1),
				y => b(0) and a(1),
				c1 => '0',
				s => sum(0),
				c => carry(0));
u1 : full_adder port map(
				x => a(0) and b(2),
				y => b(1) and a(1),
				c1 => a(2) and b(0),
				s => sum(1),
				c => carry(1));
u2 : full_adder port map(
				x => a(1) and b(2),
				y => b(1) and a(2),
				c1 => '0',
				s => sum(2),
				c => carry(2));

u3 : five_bit_fulladder port map(
				a => S1,
				b => S2,
				s => S3,
				c => C);
process(sum,a,b,C,S3)
begin
S1(0) <= '0' ;
S1(1) <= sum(0);
S1(2) <= sum(1);
S1(3) <= sum(2);
S1(4) <= '0';

S2(0) <= a(0) and b(0);
S2(1) <= carry(0); 
S2(2) <= carry(1); 
S2(3) <= carry(2); 
S2(4) <= a(2) and b(2);

s(0) <= S3(0);
s(1) <= S3(1);
s(2) <= S3(2);
s(3) <= S3(3);
s(4) <= S3(4);
s(5) <=  C;
end process;
				


end Behavioral;

