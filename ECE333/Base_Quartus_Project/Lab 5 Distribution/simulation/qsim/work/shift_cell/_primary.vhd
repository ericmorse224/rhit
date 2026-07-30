library verilog;
use verilog.vl_types.all;
entity shift_cell is
    port(
        Q               : out    vl_logic;
        SHIFT_IN        : in     vl_logic;
        SHIFT           : in     vl_logic;
        DIN             : in     vl_logic;
        LOAD            : in     vl_logic;
        RSTN            : in     vl_logic;
        CLK             : in     vl_logic;
        PRN             : in     vl_logic;
        CLRN            : in     vl_logic
    );
end shift_cell;
