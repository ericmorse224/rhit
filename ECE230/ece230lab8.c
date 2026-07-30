/*Jonathan Wampler and Eric Morse
 */

#pragma config FOSC = INTRC_NOCLKOUT// Oscillator Selection bits (INTOSCIO oscillator: I/O function on RA6/OSC2/CLKOUT pin, I/O function on RA7/OSC1/CLKIN)
#pragma config WDTE = OFF       // Watchdog Timer Enable bit (WDT disabled and can be enabled by SWDTEN bit of the WDTCON register)
#pragma config PWRTE = OFF      // Power-up Timer Enable bit (PWRT disabled)
#pragma config MCLRE = ON       // RE3/MCLR pin function select bit (RE3/MCLR pin function is MCLR)
#pragma config CP = OFF         // Code Protection bit (Program memory code protection is disabled)
#pragma config CPD = OFF        // Data Code Protection bit (Data memory code protection is disabled)
#pragma config BOREN = OFF      // Brown Out Reset Selection bits (BOR disabled)
#pragma config IESO = OFF       // Internal External Switchover bit (Internal/External Switchover mode is disabled)
#pragma config FCMEN = OFF      // Fail-Safe Clock Monitor Enabled bit (Fail-Safe Clock Monitor is disabled)
#pragma config LVP = OFF        // Low Voltage Programming Enable bit (RB3 pin has digital I/O, HV on MCLR must be used for programming)

// CONFIG2
#pragma config BOR4V = BOR21V   // Brown-out Reset Selection bit (Brown-out Reset set to 2.1V)
#pragma config WRT = OFF        // Flash Program Memory Self Write Enable bits (Write protection off)

#include <xc.h>

#include "i2c.h"
#include "lcd4bits.h"

void stepcw(void);
void stepccw(void);
void Timer_CCP_init(void);   		//Function prototypes for the two functions.
void __interrupt () interrupt_handler(void);
void display_temp(char, char);
signed char step_index = 0;
const unsigned char step_tbl[8] = {0b0001, 0b0011, 0b0010, 0b0110, 0b0100, 0b1100, 0b1000, 0b1001}; // High-Torque Stepping Sequence (See Table)
unsigned int hightime = 32525;
unsigned int ticks = 1000;
unsigned int temp2;
void get_temperature(unsigned char TMP101_address, char *temp, char *temp_rem) {
    I2C_Start();        // Generate start condition
    while (i2c_WriteTo(TMP101_address)); // Send "Write to Address" byte to all slaves on I2C bus
                        // This routine returns a nonzero value if the addressed
                        // TMP101 fails to acknowledge after the master sends out
                        // the "Write to address" byte, so the program will hang up in
                        // this loop if there is no response from the TMP101,
                        // repeating this step until an acknowledge is received.

    I2C_SendByte(0x00); // Sets pointer register to 00 (Temperature register) for
                        //the addressed TMP101.  (See Table 2 TMP101 Datasheet)
    I2C_Restart();      // Generate restart condition between write and read operations
    i2c_ReadFrom(TMP101_address);   // Sends "Read from Address" byte to TMP101
                        // Next two frames from TMP101 contain temperature as
                        // signed 12-bit value
    *temp = I2C_ReadByte(I2C_MORE);     //get upper 8 bits of temperature (integer portion)
    *temp_rem = I2C_ReadByte(I2C_LAST); //get lower 4 bits temperature (fractional portion)
    I2C_Stop();         // Generate stop condition
}

void main(void) {
    unsigned long int j;
    TRISA = 0b11110000;
    TRISB0 = 1;
    lcd_init();
    I2C_Initialize();
    Timer_CCP_init();
    RD2 =1;
    
    
    char temp, temp_rem;


    while (1) {
        if(step_index >= 80){
            get_temperature(0x90, &temp, &temp_rem); // TMP101 with address 1001000
            display_temp(temp, temp_rem);
            step_index = 0;
        }
        CCP1IE = 1;
        if(temp <= 24){
            hightime = 25025;
            CCP1IE = 0;
        } else if(temp <= 25){
            hightime = 25025;    //60 rpm  used to be 32525 perfect is 25025
        } else if(temp <= 26) {
            hightime = 12100;   //124 rpm 
        } else if(temp <= 27) {
            hightime = 7955;   //188 rpm  
        } else if(temp <= 28) {
            hightime = 5950;  //252 rpm
        } else if(temp <= 29) {
            hightime = 4745;  //316 rpm
        } else {
            hightime = 3950;   //380 rpm
        }
        stepcw();
    }
}

void stepcw() {
    PORTA = step_tbl[step_index%8];           // Send out the next step code from table
}

void stepccw() {
    if (step_index == -1) step_index = 7;   // Wrap when index gets down to -1

    PORTA = step_tbl[step_index];           // Send out the next step code from table.
}

void Timer_CCP_init(void)
{
	TMR1GE=0;   TMR1ON = 1; 			//Enable TIMER1 (See Fig. 6-1 TIMER1 Block Diagram in PIC16F887 Data Sheet)
	TMR1CS = 0;  					//Select internal clock whose frequency is Fosc/4, where Fosc = 4 MHz
	T1CKPS1 = 0; T1CKPS0 = 0; 		 	//Set prescale to divide by 1 yielding a clock tick period of 1 microseconds

							/*	From Section 6.12 of PIC16F887 Datasheet:
									bit 5-4 T1CKPS<1:0>: Timer1 Input Clock Prescale Select bits
									11 = 1:8 Prescale Value
									10 = 1:4 Prescale Value
									01 = 1:2 Prescale Value
									00 = 1:1 Prescale Value
							*/
	CCP1M3 = 0;CCP1M2 = 0;CCP1M1 = 1;CCP1M0 = 0; 	//Set CCP1 mode for "Compare with toggle on CCP1 pin" 
								//See REGISTER 11-1 datasheet
	TRISC2 = 0;					//Make CCP1 pin an output.
	CCPR1 = TMR1+100;				//Schedule first CCP1 interrupt in 100 microseconds
	CCP1IF = 0;
	CCP1IE = 1;					//Unmask (enable) Compare Interrupt from CCP1 (Interrupt when CCP1IF flag is set to 1)
	PEIE = 1;					//Enable all peripheral interrupts 
	GIE = 1;					//Globally Enable all interrupts
}

void __interrupt () interrupt_handler(void)
{	
    
    if(CCP1IF == 1)
	{
		CCPR1 = CCPR1 + hightime;    //32525 for 60rpm and 6250 for 380
        step_index++;

        CCP1IF = 0;			//Be sure to relax the CCP1 interrupt before returning.
	}
}

void display_temp(char temp, char temp_rem)
{
    char sign_char, dig0_char, dig1_char, dig2_char, dig1_char2, dig2_char2;
    if (temp & 0x80)            // If temp is negative make sign character "-"
    {                           // and negate temp to make it positive.
        temp = -temp;
        sign_char = '-';
    } else sign_char = '+';     // Otherwise temp is positive and make sign character ?+?
    dig0_char = temp % 10;      // Extract temperature as 3 decimal digits
    temp /= 10;
    dig1_char = temp % 10;
    temp /= 10;
    dig2_char = temp % 10;
    dig1_char2 = temp_rem % 10;
    temp_rem /= 10;
    dig2_char2 = temp % 10;
    lcd_goto(0);
    lcd_puts("Temp = ");
    lcd_putch(sign_char);
    lcd_putch(dig2_char + 0x30); // Turn decimal digits into ASCII characters before
    lcd_putch(dig1_char + 0x30); // sending out to the LCD panel.
    lcd_putch(dig0_char + 0x30);
    lcd_putch(0x2e);
    lcd_putch(dig2_char2 + 0x30);
    lcd_putch(dig1_char2 + 0x30);
    //lcd_puts(" Deg C");
}