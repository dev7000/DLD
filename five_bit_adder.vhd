----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    15:10:59 01/16/2018 
-- Design Name: 
-- Module Name:    five_bit_fulladder - Behavioral 
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

entity five_bit_fulladder is
    Port ( a : in  STD_LOGIC_VECTOR (4 downto 0);
           b : in  STD_LOGIC_VECTOR (4 downto 0);
           s : out  STD_LOGIC_VECTOR (4 downto 0);
           c : out  STD_LOGIC);
end five_bit_fulladder;

architecture Behavioral of five_bit_fulladder is

component full_adder Port ( 
			  x : in  STD_LOGIC;
           y : in  STD_LOGIC;
           c1 : in  STD_LOGIC;
           c : out  STD_LOGIC;
           s : out  STD_LOGIC);
end component;			  
signal carry,sum : std_logic_vector (4 downto 0);		
				
begin

u0: full_adder port map(
				x => a(0),
				y => b(0),
				c1 => '0',
				s => sum(0),
				c => carry(0));				
u1: full_adder port map(
				x => a(1),
				y => b(1),
				c1 => carry(0),
				s => sum(1),
				c => carry(1));				
u2: full_adder port map(
				x => a(2),
				y => b(2),
				c1 => carry(1),
				s => sum(2),
				c => carry(2));
u3: full_adder port map(
				x => a(3),
				y => b(3),
				s => sum(3),
				c1 => carry(2),
				c => carry(3));
u4: full_adder port map(
				x => a(4),
				y => b(4),
				s => sum(4),
				c1 => carry(3),
				c => carry(4));

process(sum,carry(4))

begin
c<= carry(4);
s<=sum;
end process;
				
end Behavioral;

 