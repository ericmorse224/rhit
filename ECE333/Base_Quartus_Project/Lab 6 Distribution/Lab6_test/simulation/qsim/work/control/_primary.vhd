library verilog;
use verilog.vl_types.all;
entity control is
    port(
        LOAD_NOTE       : out    vl_logic;
        SHIFT           : out    vl_logic;
        INC_SCORE       : out    vl_logic;
        INC_MISS        : out    vl_logic;
        nCLRPT          : out    vl_logic;
        STATE           : out    vl_logic_vector(6 downto 0);
        CLK             : in     vl_logic;
        RESET           : in     vl_logic;
        START           : in     vl_logic;
        nOVER           : in     vl_logic;
        MID             : in     vl_logic;
        TIME            : in     vl_logic;
        END_LEFT        : in     vl_logic;
        END_MID         : in     vl_logic;
        END_RIGHT       : in     vl_logic;
        RIGHT           : in     vl_logic;
        LEFT            : in     vl_logic
    );
end control;
