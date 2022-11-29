library IEEE;
use IEEE.std_logic_1164.all;
use std.env.finish;

entity receptor_remoto_tb is
end receptor_remoto_tb;

architecture tb of receptor_remoto_tb is
    -- Declaracion de componente a probar
    component receptor_remoto is
        port(
            rst        : in std_logic; 
            infrarrojo : in std_logic;
            hab        : in std_logic;
            clk        : in std_logic;
            valido     : out std_logic;
            dir        : out std_logic_vector (7 downto 0);
            cmd        : out std_logic_vector (7 downto 0));
    end component;
    -- Declaraciones
    constant T : time := 187.5 us;
    signal rst_in        : std_logic; 
    signal infrarrojo_in : std_logic;
    signal hab_in        : std_logic;
    signal clk_in        : std_logic;
    signal valido_out    : std_logic;
    signal dir_out       : std_logic_vector (7 downto 0);
    signal cmd_out       : std_logic_vector (7 downto 0);
----
begin
    DUT : receptor_remoto port map (
        rst        =>rst_in       ,
        infrarrojo =>infrarrojo_in,
        hab        =>hab_in       ,
        clk        =>clk_in       ,
        valido     =>valido_out   ,
        dir        =>dir_out      ,
        cmd        =>cmd_out      );
    reloj: process
    begin
        clk_in <= '0';
        wait for T;
        clk_in <= '1';
        wait for T;
    end process;
    estimulo_eval: process
        variable pass: boolean := true;
        ----
    begin
        ----
        if pass then
            report "Receptor remoto [PASS]";
        else
            report "Receptor remoto [FAIL]"
                severity failure;
        end if;
        finish;
    end process;
end tb;