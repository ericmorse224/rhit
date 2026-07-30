library verilog;
use verilog.vl_types.all;
entity inc1b is
    port(
        S               : out    vl_logic;
        A               : in     vl_logic;
        Cin             : in     vl_logic;
        Cout            : out    vl_logic
    );
end inc1b;
