library verilog;
use verilog.vl_types.all;
entity bcd_7seg is
    port(
        segB            : out    vl_logic;
        ENbar           : in     vl_logic;
        D3              : in     vl_logic;
        D2              : in     vl_logic;
        D1              : in     vl_logic;
        D0              : in     vl_logic;
        segD            : out    vl_logic;
        segE            : out    vl_logic;
        segF            : out    vl_logic;
        segG            : out    vl_logic;
        segA            : out    vl_logic;
        segC            : out    vl_logic
    );
end bcd_7seg;
