library IEEE;
use IEEE.std_logic_1164.all;

entity receptor_remoto is
    port(
        rst        : in std_logic; 
        infrarrojo : in std_logic;
        hab        : in std_logic;
        clk        : in std_logic;
        valido     : out std_logic;
        dir        : out std_logic_vector (7 downto 0);
        cmd        : out std_logic_vector (7 downto 0));
end receptor_remoto;

architecture solucion of  receptor_remoto is
begin
    process
    begin
        valido <= '0';
        dir <= "00000000";
        cmd <= "00000000";
        wait for 72 ms;
        wait until rising_edge(clk);
        valido <= '1';
        dir <= "00010000";
        cmd <= "01011010";
        wait;
    end process;
end solucion;