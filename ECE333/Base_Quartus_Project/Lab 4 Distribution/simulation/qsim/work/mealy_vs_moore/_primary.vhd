library verilog;
use verilog.vl_types.all;
entity mealy_vs_moore is
    port(
        MOORE_OUT       : out    vl_logic;
        \IN\            : in     vl_logic;
        CLK             : in     vl_logic;
        CLRN            : in     vl_logic;
        MEALY_OUT       : out    vl_logic
    );
end mealy_vs_moore;
