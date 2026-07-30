library verilog;
use verilog.vl_types.all;
entity fix_bcd is
    port(
        S               : out    vl_logic;
        P               : in     vl_logic;
        T               : in     vl_logic
    );
end fix_bcd;
