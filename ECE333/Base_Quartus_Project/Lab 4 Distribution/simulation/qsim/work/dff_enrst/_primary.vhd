library verilog;
use verilog.vl_types.all;
entity dff_enrst is
    port(
        Q               : out    vl_logic;
        CLRN            : in     vl_logic;
        CLK             : in     vl_logic;
        EN              : in     vl_logic;
        RSTN            : in     vl_logic;
        D               : in     vl_logic;
        PRN             : in     vl_logic
    );
end dff_enrst;
