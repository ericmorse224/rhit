library verilog;
use verilog.vl_types.all;
entity fix_bcd_vlg_sample_tst is
    port(
        P               : in     vl_logic;
        T               : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end fix_bcd_vlg_sample_tst;
