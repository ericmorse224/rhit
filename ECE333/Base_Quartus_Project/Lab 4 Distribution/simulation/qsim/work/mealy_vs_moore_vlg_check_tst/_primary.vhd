library verilog;
use verilog.vl_types.all;
entity mealy_vs_moore_vlg_check_tst is
    port(
        MEALY_OUT       : in     vl_logic;
        MOORE_OUT       : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end mealy_vs_moore_vlg_check_tst;
