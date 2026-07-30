library verilog;
use verilog.vl_types.all;
entity edge_det is
    port(
        \OUT\           : out    vl_logic;
        CLRN            : in     vl_logic;
        CLK             : in     vl_logic;
        \IN\            : in     vl_logic
    );
end edge_det;
