/*   ECE230 Example Program #7 UART Communication, modified 10/1/2015 CWM
 *   This example program assumes Fosc=4MHz
 *   This program repeatedly outputs string Msg to hyperterminal
 */
//File Name: frequency_tuner.c
//Date: Jan 27 2019
//Purpose: Demonstrate LCD subroutines
//Author: Eric Morse and Luke Wampler
// 'C' source line config statements



// PIC16F887 Configuration Bit Settings

// 'C' source line config statements

// CONFIG1
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

// #pragma config statements should precede project file includes.
// Use project enums instead of #define for ON and OFF.

#include <xc.h>


void OutChar(unsigned char); //Function prototypes for the three functions
unsigned char InChar(void);
const unsigned char Msg[] = {"ECE230 Winter 2018-2019"};
int setTX9D(unsigned int);
unsigned int sumOfBits(unsigned char);

void main(void) {
    unsigned char inkey;

    SPEN = 1;
    SYNC = 0;
    TXEN = 1; // Enable transmit side of UART
    CREN = 1; // Enable receive side of UART
    BRG16 = 1;
    BRGH = 1;
    TX9 = 1;
    
    SPBRGH = 0;
    SPBRG = 25; // Configure UART for 38400 Baud
    while (1) {
        for (int i = 0; i < sizeof (Msg); i++)
        {
            OutChar(Msg[i]);
            int numOfBits = sumOfBits(Msg[i]);
            TX9D = setTX9D(numOfBits);   //odd parity
        }

        OutChar(0x0A); //send character return and line feed.
        OutChar(0x0D);
    }
}

void OutChar(unsigned char outchr) {
    while (TXIF == 0);
    TXREG = outchr;
}

unsigned char InChar(void) {
    while (RCIF == 0);
    return RCREG;
}

unsigned int sumOfBits(unsigned char outchr) {
    int count = 0;
    while (outchr)
    { 
    count += outchr & 1; 
    outchr >>= 1; 
    } 
    return count;
}
int setTX9D(unsigned int sumOfBits){
    if(sumOfBits%2) return 0;
    return 1;
}