library verilog;
use verilog.vl_types.all;
entity bcd_count2 is
    port(
        Q0              : out    vl_logic;
        INC             : in     vl_logic;
        RSTN            : in     vl_logic;
        CLK             : in     vl_logic;
        CLRN            : in     vl_logic;
        Q1              : out    vl_logic;
        Q2              : out    vl_logic;
        Q3              : out    vl_logic;
        Q4              : out    vl_logic;
        Q5              : out    vl_logic;
        Q6              : out    vl_logic;
        Q7              : out    vl_logic
    );
end bcd_count2;
