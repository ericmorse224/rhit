library verilog;
use verilog.vl_types.all;
entity shift_reg is
    port(
        Q               : out    vl_logic_vector(3 downto 0);
        DIN             : in     vl_logic_vector(3 downto 0);
        LOAD            : in     vl_logic;
        SHIFT           : in     vl_logic;
        RSTN            : in     vl_logic;
        CLK             : in     vl_logic;
        PRN             : in     vl_logic;
        CLRN            : in     vl_logic
    );
end shift_reg;
