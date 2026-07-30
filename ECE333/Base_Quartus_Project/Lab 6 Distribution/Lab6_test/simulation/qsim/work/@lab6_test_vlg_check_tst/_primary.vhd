library verilog;
use verilog.vl_types.all;
entity Lab6_test_vlg_check_tst is
    port(
        G_INC_MISS      : in     vl_logic;
        G_INC_SCORE     : in     vl_logic;
        G_LOAD_NOTE     : in     vl_logic;
        G_nCLRPT        : in     vl_logic;
        G_SHIFT         : in     vl_logic;
        G_STATE         : in     vl_logic_vector(6 downto 0);
        INC_MISS        : in     vl_logic;
        INC_SCORE       : in     vl_logic;
        LOAD_NOTE       : in     vl_logic;
        nCLRPT          : in     vl_logic;
        output_error    : in     vl_logic;
        SHIFT           : in     vl_logic;
        STATE           : in     vl_logic_vector(6 downto 0);
        state_error     : in     vl_logic;
        sampler_rx      : in     vl_logic
    );
end Lab6_test_vlg_check_tst;
