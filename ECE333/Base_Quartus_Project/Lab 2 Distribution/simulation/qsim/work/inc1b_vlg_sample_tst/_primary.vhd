library verilog;
use verilog.vl_types.all;
entity inc1b_vlg_sample_tst is
    port(
        A               : in     vl_logic;
        Cin             : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end inc1b_vlg_sample_tst;
