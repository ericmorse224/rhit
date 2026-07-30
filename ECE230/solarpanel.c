// PIC16F887 Configuration Bit Settings

// 'C' source line config statements

// CONFIG1
#pragma config FOSC = HS        // Oscillator Selection bits (HS oscillator: High-speed crystal/resonator on RA6/OSC2/CLKOUT and RA7/OSC1/CLKIN)
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
#include "lcd4bits.h"

unsigned int frequency = 0;
unsigned int old_value = 0;
unsigned int period;
unsigned int ticks = 750;
unsigned int clk = 0;

void Timer_CCP_init(void);   		//Function prototypes for the two functions.
void __interrupt () interrupt_handler(void);
void DelayMs(unsigned int millis);
unsigned int ADC_convert(unsigned char); // Function prototypes
void delay(void);
void autoMode(void);
void manualMode(void);

#include <xc.h>
unsigned int adval,highTime, highTime2;
#define period 40000

void main(void) {
    
    unsigned char char0, char1, char2, char3;
    TRISB0 = 1; TRISB1 = 1; TRISB2 = 1; TRISB3 = 1;
    ANS8 = 1; // Configure the RB4/AN11 pin as an analog input
    ANS9 = 1;
    ANS10 = 1;
    ANS12 = 1;
    nRBPU = 0;
    
    Timer_CCP_init();
    lcd_init();
    
    ADON = 1; // Turn on ADC Module
    ADFM = 1; // Right justify result in ADRES = ADRESH:ADRESL registers
    VCFG1 = 0;
    VCFG0 = 0; // Use VSS and VDD to set conversion range to 0V-5V
    ADCS1 = 0;
    ADCS0 = 1; // ADC clock freq set to Fosc/8 = 500 kH (assumes Fosc=4MHz)

    while (1) {
        delay();
        //manualMode();
        autoMode();
    }
}

void manualMode(){
    unsigned int angleDelay, angleDelay2, pot, pot2;

    
    pot = ADC_convert(12);
    angleDelay = (unsigned long)pot*500/1022;
    highTime = 1000 + angleDelay*8;

    pot2 = ADC_convert(10);
    angleDelay2 = (unsigned long)pot2*500/1022;
    highTime2 = 1000 + angleDelay2*8;

    Display2(angleDelay/3, angleDelay2/3, 0);
    DelayMs(200);
}

void autoMode(){
    unsigned int v, v2, v3, v4, angleDelay, angleDelay2;
    angleDelay = 100;
    angleDelay2 = 100;
    unsigned int correct_x;
    unsigned int correct_y;
    correct_x = 0;
    correct_y = 0;
    CCP1IE = 1; CCP2IE = 0;
    while(1){
        adval = ADC_convert(8);
        v = (unsigned long)adval*500/1022;
        adval = ADC_convert(10);
        v2 = (unsigned long)adval*500/1022;
        adval = ADC_convert(9);
        v3 = (unsigned long)adval*500/1022;
        adval = ADC_convert(12);
        v4 = (unsigned long) adval*500/1022;
        
        //correct_x = 1; CCP1IE = 0; CCP2IE = 1;
        
        if(correct_x == 0){ //v is east and v3 is west
            if(v <= (v3 + 30)){
                angleDelay -= 10;
            } else if(v >= (v3 - 30)){
                angleDelay += 10;
            } else {
                CCP1IE = 0;
                correct_x = 1;
                CCP2IE = 1;
            }
            Display2(v, v3, 1);
        } else if(correct_y == 0){ //v4 is west and v2 is east
            if(v2 <= (v4 + 30)){
                angleDelay2 -= 10;
            } else if(v2 >= (v4 - 30)){
                angleDelay2 += 10;
            }  else {
                CCP2IE = 0;
                correct_y = 1;
            }
            Display2(v2, v4, 2);
        } else {
            Display2(v, v2, 3);
        }
        highTime = 1000 + angleDelay*8;
        highTime2 = 1000 + angleDelay2*8;
        DelayMs(10);
         
        //Display3(v,v2,v3,v4);
        //Display2(angleDelay/3, angleDelay2/3);
        DelayMs(200);
    }

}

void delay() {
    unsigned int count;
    for (count = 0; count < 50000; count++); // imprecise delay period
}

unsigned int ADC_convert(unsigned char chan_nr) {
    //change this in your program to select the channel based on chan_nr

    switch(chan_nr) {		// select the channel based on chan_nr
        case 0: CHS3 = 0; CHS2 = 0; CHS1 = 0; CHS0 = 0; break;
        case 1: CHS3 = 0; CHS2 = 0; CHS1 = 0; CHS0 = 1; break;
        case 2: CHS3 = 0; CHS2 = 0; CHS1 = 1; CHS0 = 0; break;
        case 3: CHS3 = 0; CHS2 = 0; CHS1 = 1; CHS0 = 1; break;
        case 8: CHS3 = 1; CHS2 = 0; CHS1 = 0; CHS0 = 0; break;
        case 9: CHS3 = 1; CHS2 = 0; CHS1 = 0; CHS0 = 1; break;
        case 10: CHS3 = 1; CHS2 = 0; CHS1 = 1; CHS0 = 0; break;
        case 12: CHS3 = 1; CHS2 = 1; CHS1 = 0; CHS0 = 0; break;
        case 13: CHS3 = 1; CHS2 = 1; CHS1 = 0; CHS0 = 1; break;
        default: CHS3 = 1; CHS2 = 0; CHS1 = 1; CHS0 = 1; break;
    } 
    GO = 1; // Start conversion ("GO" is the GO/DONE* bit)
    while (GO == 1); // Wait here while converting
    return (unsigned int) ADRESH * 256 + ADRESL; // converted 10-bit value (0 -> 1023)
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
	TRISC1 = 0;					//Make CCP1 pin an output.
	CCPR1 = TMR1+100;				//Schedule first CCP1 interrupt in 100 microseconds
	CCP1IF = 0;
	CCP1IE = 1;					//Unmask (enable) Compare Interrupt from CCP1 (Interrupt when CCP1IF flag is set to 1)
    TRISC2 = 0;					//Set CCP2 Pin as an output.
 	CCP2M3 = 0;CCP2M2 = 0;CCP2M1 = 1;CCP2M0 = 0; 	//Set CCP2 mode for "Compare with toggle on CCP2 pin" 
								//See REGISTER 11-1 datasheet  
	CCPR2 = TMR2 + 200;
    CCP2IF = 0;					//Unmask (enable) Capture Interrupt from CCP2 (Interrupt on rising edge with value of 
	CCP2IE = 1;					//    TIMER 1 Captured in CCPR2.)
	PEIE = 1;					//Enable all peripheral interrupts 
	GIE = 1;					//Globally Enable all interrupts
}

void __interrupt () interrupt_handler(void)
{	
    
    if(CCP1IF == 1)
	{
		if(RC1 == 1)
        {
            CCPR1 = CCPR1 + highTime;
        }
        else
        {
            CCPR1 = CCPR1 + period - highTime;
        }
		CCP1IF = 0;			//Be sure to relax the CCP1 interrupt before returning.
	}

    if(CCP2IF == 1)
	{
		if(RC2 == 1)
        {
            CCPR2 = CCPR2 + highTime2;
        }
        else
        {
            CCPR2 = CCPR2 + period - highTime2;
        }
		CCP2IF = 0;			//Be sure to relax the CCP1 interrupt before returning.
	}
}


