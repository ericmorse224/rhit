library verilog;
use verilog.vl_types.all;
entity segB is
    port(
        segB            : out    vl_logic;
        D2              : in     vl_logic;
        D1              : in     vl_logic;
        D0              : in     vl_logic;
        D3              : in     vl_logic
    );
end segB;
