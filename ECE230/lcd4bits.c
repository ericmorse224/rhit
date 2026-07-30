#include	<xc.h>

#define CMD_MODE                0           //(0 for command mode)
#define DTA_MODE                1           //(1 for data mode)
#define LCD_RS                  RD2         //rename RD2 	-LCD command/data 
#define LCD_EN                  RD3         //rename RD3 	-LCD Enable (clocks data into LCD on falling edge) 
#define LCD_DATA                PORTD       //rename PORTD 	-LCD Data pins (D4 - D7)
#define LCDCMD_ClearDisplay     0x01    //clear display: clear, move cursor home
#define LCDCMD_EMS              0x06    //entry mode set: auto increment cursor after each char sent
#define LCDCMD_DisplaySettings  0x0C    //display ON/OFF control: display on, cursor off, blink off
#define LCDCMD_FunctionSet      0x28    //function set: 4-bit mode, 2 lines, 5x7 dots

void tmr0_init() {
    // T0CS = 0 -- Fosc/4 clock source
    // PSA = 0 -- prescalar set to TMR0
    // PS = 0 -- 1:2
    OPTION_REG &= 0xC0;
    // PS = 1 -- 1:8
    OPTION_REG |= 0x02;
}

/*
 * Delay for indicated number of milliseconds
 *  (256 - 9)*8 + 24 instruction cycles => 2000 instruction cycles (1ms)
 *  assumes PS 1:8, 8MHz clock
 */
void DelayMs(unsigned int millis) {
    while (millis != 0) {
        TMR0 = 9;
        T0IF = 0;
        while(T0IF == 0);
        millis--;
    }
}

/*
 * Provides delay of ~40 instruction cycles (20us)
 *  assumes 8MHz clock
 */
void Delay20us() {
    unsigned char next;
    for (next = 0; next < 3; next++);
}

/*
 * Pulses (strobes) the Enable line making it rise and then fall. This
 *  falling edge writes data on LCD Panel pins DB7:0 into the LCD Panel.
 */
void LCD_strobe() {
    LCD_EN = 1;
    Delay20us();
    LCD_EN = 0;
}

/*
 * lcd_write function ---writes a byte to the LCD in 8-bit mode.
 * Note that the "mode" argument is set to either CMD_MODE (=0) or DTA_MODE (=1), 
 * so that the LCD panel knows whether an instruction byte is being written to it 
 * or an ASCII code is being written to it that is to be displayed on the panel.
 */ 
void lcd_write(unsigned char mode, unsigned char CmdChar) {
    
    
    LCD_DATA = (CmdChar & 0xF0) | (PORTD & 0x0F);
    //LCD_DATA = CmdChar;
    LCD_RS = mode;
    LCD_strobe(); // Write upper 4 bits of data on D7-4
    Delay20us(); 
    
    LCD_DATA = (CmdChar << 4) | (PORTD & 0x0F);
    //Cmd_Char = (Cmd_Char << 4);
    //LCD_DATA = CmdChar;
    LCD_RS = mode;
    LCD_strobe();   // Write lower 4 bits of data on D7-4
    Delay20us();
    
    
    /*
    LCD_DATA = (CmdChar & 0xF0);
    LCD_RS = mode;
    LCD_strobe();
    LCD_DATA = (CmdChar & 0x0F) << 4;
    LCD_RS = mode;
    LCD_strobe();
    Delay20us();
    */
    
}

/*
 * Clear the LCD and go to home position
 */
void lcd_clear(void) {
    lcd_write(CMD_MODE, LCDCMD_ClearDisplay);
    DelayMs(2);
}

/* Write a string of chars to the LCD */
void lcd_puts(const char *string) {
    while (*string != 0) // Last character in a C-language string is alway "0" (ASCII NULL character)
        lcd_write(DTA_MODE, *string++);
}

/* Write one character to the LCD */
void lcd_putch(char character) {
    lcd_write(DTA_MODE, character);
}

/*
 * Moves cursor to desired position.  
 * For 16 x 2 LCD display panel, 
 *     the columns of Row 1 are 0x00....0x10
 *     the columns of Row 2 are 0x40....0x50
 */
void lcd_goto(unsigned char position) {
    lcd_write(CMD_MODE, 0x80 + position); // The "cursor move" command is indicated by MSB=1 (0x80)
    // followed by the panel position address (0x00- 0x7F)
    DelayMs(2);
}

/*
 * Initialize the LCD - put into 4 bit mode
 */
void lcd_init() //See Section 2.2.2.2 of the Optrex LCD DMCman User Manual
{
    unsigned char cmd;
    TRISD = 0b00000000; //Make PORTD (D7-0) all output
    //TRISD2 = 0; //Make RD2 (RS) output
    //TRISD3 = 0; //Make RD3 (EN) output
    tmr0_init();
    LCD_RS = CMD_MODE;
    LCD_EN = 0;
    DelayMs(15); // wait 15mSec after power applied,
    lcd_write(CMD_MODE, LCDCMD_FunctionSet); // function set: 8-bit mode, 2 lines, 5x7 dots
    lcd_write(CMD_MODE, LCDCMD_DisplaySettings); // display ON/OFF control: display on, cursor off, blink off
    lcd_clear(); // Clear screen
    lcd_write(CMD_MODE, LCDCMD_EMS); // Set entry Mode
}

/*
 * Displays voltage on LCD
 * volt - voltage in 100ths of V
 * valid range - 0 (0.00 V) -> 999 (9.99 Hz)
 * display: Volt: X.XX V
 */
void Display(unsigned int volt) {
    unsigned char digits[3];
    unsigned char i;
    lcd_clear();
    // convert volt value to an array of digits
    for (i = 0; i < 3; i++) {
        digits[2 - i] = (volt % 10);
        volt = volt / 10;
    }
//    lcd_goto(0); // select first line
    lcd_puts("Volt: ");
    
    // output space for any leading zeroes
    for (i = 0; ((digits[i] == 0) && (i < 1)); i++)
        lcd_putch('0');
    
    for ( ; i < 1; i++)
        lcd_putch(digits[i] + 0x30);
    lcd_putch('.');
    
    // output significant digits left of decimal point
    for ( ; i < 3; i++)
        lcd_putch(digits[i] + 0x30);
        // last digit is 10th of Hz - print after decimal point
    
    lcd_puts(" V");

}

void Display2(unsigned int angle1, unsigned int angle2) {
    unsigned char digits[3];
    unsigned char i;
    lcd_clear();
    // convert volt value to an array of digits
    //angle1 = angle1/3;
    for (i = 0; i < 3; i++) {
        digits[2 - i] = (angle1 % 10);
        angle1 = angle1 / 10;
    }
//    lcd_goto(0); // select first line
    lcd_puts("X Angle: ");
    
    // output space for any leading zeroes
    for (i = 0; ((digits[i] == 0) && (i < 1)); i++)
        lcd_putch('0');
    
    for ( ; i < 1; i++)
        lcd_putch(digits[i] + 0x30);
    
    // output significant digits left of decimal point
    for ( ; i < 3; i++)
        lcd_putch(digits[i] + 0x30);

    lcd_goto(0x40);
    for (i = 0; i < 3; i++) {
        digits[2 - i] = (angle2 % 10);
        angle2 = angle2 / 10;
    }
    
    lcd_puts("Y Angle: ");
    
    for (i = 0; ((digits[i] == 0) && (i < 1)); i++)
        lcd_putch('0');
    
    for ( ; i < 1; i++)
        lcd_putch(digits[i] + 0x30);
    
    for ( ; i < 3; i++)
        lcd_putch(digits[i] + 0x30);
    
}