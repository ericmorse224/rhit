library verilog;
use verilog.vl_types.all;
entity mealy_vs_moore_vlg_sample_tst is
    port(
        CLK             : in     vl_logic;
        CLRN            : in     vl_logic;
        \IN\            : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end mealy_vs_moore_vlg_sample_tst;
