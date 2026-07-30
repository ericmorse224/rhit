library verilog;
use verilog.vl_types.all;
entity segG_vlg_sample_tst is
    port(
        D0              : in     vl_logic;
        D1              : in     vl_logic;
        D2              : in     vl_logic;
        D3              : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end segG_vlg_sample_tst;
