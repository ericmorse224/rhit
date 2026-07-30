library verilog;
use verilog.vl_types.all;
entity edge_det_vlg_sample_tst is
    port(
        CLK             : in     vl_logic;
        CLRN            : in     vl_logic;
        \IN\            : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end edge_det_vlg_sample_tst;
