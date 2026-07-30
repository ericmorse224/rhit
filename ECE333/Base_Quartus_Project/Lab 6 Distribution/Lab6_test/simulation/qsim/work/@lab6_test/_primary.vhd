library verilog;
use verilog.vl_types.all;
entity Lab6_test is
    port(
        LOAD_NOTE       : out    vl_logic;
        LEFT            : in     vl_logic;
        MID             : in     vl_logic;
        RIGHT           : in     vl_logic;
        START           : in     vl_logic;
        nOVER           : in     vl_logic;
        TIME            : in     vl_logic;
        END_LEFT        : in     vl_logic;
        END_MID         : in     vl_logic;
        END_RIGHT       : in     vl_logic;
        CLK             : in     vl_logic;
        RESET           : in     vl_logic;
        SHIFT           : out    vl_logic;
        INC_SCORE       : out    vl_logic;
        INC_MISS        : out    vl_logic;
        nCLRPT          : out    vl_logic;
        state_error     : out    vl_logic;
        output_error    : out    vl_logic;
        G_LOAD_NOTE     : out    vl_logic;
        G_SHIFT         : out    vl_logic;
        G_INC_SCORE     : out    vl_logic;
        G_INC_MISS      : out    vl_logic;
        G_nCLRPT        : out    vl_logic;
        G_STATE         : out    vl_logic_vector(6 downto 0);
        STATE           : out    vl_logic_vector(6 downto 0)
    );
end Lab6_test;
