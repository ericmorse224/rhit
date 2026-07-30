library verilog;
use verilog.vl_types.all;
entity Lab6_test_vlg_sample_tst is
    port(
        CLK             : in     vl_logic;
        END_LEFT        : in     vl_logic;
        END_MID         : in     vl_logic;
        END_RIGHT       : in     vl_logic;
        LEFT            : in     vl_logic;
        MID             : in     vl_logic;
        nOVER           : in     vl_logic;
        RESET           : in     vl_logic;
        RIGHT           : in     vl_logic;
        START           : in     vl_logic;
        TIME            : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end Lab6_test_vlg_sample_tst;
