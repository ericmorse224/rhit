library verilog;
use verilog.vl_types.all;
entity bcd_inc is
    port(
        S0              : out    vl_logic;
        A0              : in     vl_logic;
        Cin             : in     vl_logic;
        A3              : in     vl_logic;
        A2              : in     vl_logic;
        A1              : in     vl_logic;
        S1              : out    vl_logic;
        S2              : out    vl_logic;
        S3              : out    vl_logic;
        Cout            : out    vl_logic
    );
end bcd_inc;
