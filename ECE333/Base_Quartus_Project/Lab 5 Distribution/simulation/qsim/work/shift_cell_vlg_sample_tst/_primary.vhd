library verilog;
use verilog.vl_types.all;
entity shift_cell_vlg_sample_tst is
    port(
        CLK             : in     vl_logic;
        CLRN            : in     vl_logic;
        DIN             : in     vl_logic;
        LOAD            : in     vl_logic;
        PRN             : in     vl_logic;
        RSTN            : in     vl_logic;
        SHIFT           : in     vl_logic;
        SHIFT_IN        : in     vl_logic;
        sampler_tx      : out    vl_logic
    );
end shift_cell_vlg_sample_tst;
