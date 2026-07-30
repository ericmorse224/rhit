library verilog;
use verilog.vl_types.all;
entity segG is
    port(
        segG            : out    vl_logic;
        D2              : in     vl_logic;
        D1              : in     vl_logic;
        D0              : in     vl_logic;
        D3              : in     vl_logic
    );
end segG;
