library verilog;
use verilog.vl_types.all;
entity control_vlg_check_tst is
    port(
        INC_MISS        : in     vl_logic;
        INC_SCORE       : in     vl_logic;
        LOAD_NOTE       : in     vl_logic;
        nCLRPT          : in     vl_logic;
        SHIFT           : in     vl_logic;
        STATE           : in     vl_logic_vector(6 downto 0);
        sampler_rx      : in     vl_logic
    );
end control_vlg_check_tst;
