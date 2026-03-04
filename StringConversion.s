// StringConversion.s
// Student names: change this to your names or look very silly
// Last modification date: change this to the last modification date or look very silly
// Runs on any Cortex M0
// ECE319K lab 6 number to string conversion
//
// You write udivby10 and Dec2String
     .data
     .align 2
// no globals allowed for Lab 6
    .global OutChar    // virtual output device
    .global OutDec     // your Lab 6 function
    .global Test_udivby10

    .text
    .align 2
// **test of udivby10**
// since udivby10 is not AAPCS compliant, we must test it in assembly
Test_udivby10:
    PUSH {LR}

    MOVS R0,#123
    BL   udivby10
// put a breakpoint here
// R0 should equal 12 (0x0C)
// R1 should equal 3

    LDR R0,=12345
    BL   udivby10
// put a breakpoint here
// R0 should equal 1234 (0x4D2)
// R1 should equal 5

    MOVS R0,#0
    BL   udivby10
// put a breakpoint here
// R0 should equal 0
// R1 should equal 0
    POP {PC}

// ****************************************************
// divisor=10
// Inputs: R0 is 16-bit dividend
// quotient*10 + remainder = dividend
// Output: R0 is 16-bit quotient=dividend/10
//         R1 is 16-bit remainder=dividend%10 (modulus)
// not AAPCS compliant because it returns two values
udivby10:
   PUSH {LR}
// write this

   POP  {PC}

  
//-----------------------OutDec-----------------------
// Convert a 16-bit number into unsigned decimal format
// Call the function OutChar to output each character
// You will call OutChar 1 to 5 times
// OutChar does not do actual output, OutChar does virtual output used by the grader
// Input: R0 (call by value) 16-bit unsigned number
// Output: none
// Invariables: This function must not permanently modify registers R4 to R11
OutDec:
   PUSH {LR}
// write this

   POP  {PC}
// * * * * * * * * End of OutDec * * * * * * * *

// ECE319H recursive version
// Call the function OutChar to output each character
// You will call OutChar 1 to 5 times
// Input: R0 (call by value) 16-bit unsigned number
// Output: none
// Invariables: This function must not permanently modify registers R4 to R11

OutDec2:
   PUSH {LR}
// write this

   POP  {PC}



     .end
// Lab6Main.c
// Runs on MSPM0G3507
// Test the functions in ST7735.c
//    16-bit color, 128 wide by 160 high LCD
// Daniel Valvano
// Last Modified: January 12, 2026
// Ramesh Yerraballi modified 3/20/2017

#include "Lab6Grader.h"
#include <stdio.h>
#include <stdint.h>
#include "../inc/ST7735.h"
#include "../inc/Clock.h"
#include "../inc/LaunchPad.h"
#include "StringConversion.h"
#include "../inc/UART.h"
#include "images.h"
// Modify these two with your EIDs
char EID1[]="abc123";  // student's EID
char EID2[]="abc123";  // student's EID
void Dec2String(uint32_t n, char *p);
// use main0 to test udivby10
// does not need ST7735R connected
int main0(void){ // main0
  Clock_Init80MHz(0);
  LaunchPad_Init();
  Test_udivby10(); // defined in StringConversion.s
  while(1){
  }
}

// use main1 for testing
// does not need ST7735R connected
int main(void){ // main1
  Clock_Init80MHz(0);
  LaunchPad_Init();
// Lab6Grader(1) to test SPIOutCommand, no grading
// Lab6Grader(2) to test SPIOutData, no grading
// Lab6Grader(3) to test GradeDec2String, no grading
// Lab6Grader(4) to test all three with grading
  Lab6Grader(1);
  while(1){
  }
}
char test[20];

#define SIZE 12
uint32_t const TestData[SIZE] ={
  0,7,99,100,654,999,1000,5009,9999,10000,20806,65535
};
// using main2 for initial test of OutDec
// does not need ST7735R connected
int main2(void){
  uint32_t i;
  Clock_Init80MHz(0);
  LaunchPad_Init();
  UART_Init();
  UART_OutString("Test of OutDec");
  for(i=0; i<SIZE; i++){
    UART_OutString("\n\rYour: ");
    Dec2String(TestData[i],test); // your Lab 6
    UART_OutString(test);
    UART_OutString(" Correct: ");
    UART_OutUDec(TestData[i]);  // similar function
  }
  while(1){

  }
}
// using main3 for demonstration
// needs ST7735R connected
int main3(void){
  uint32_t i;
  Clock_Init80MHz(0);
  LaunchPad_Init();
  ST7735_InitPrintf(INITR_REDTAB); // INITR_REDTAB for AdaFruit, INITR_BLACKTAB for HiLetGo
  ST7735_OutString("Lab 6 Spring 2026\n\xADHola!\nBienvenida al EE319K");
  while(LaunchPad_InS2()==0x00040000){}; // wait for release
  while(LaunchPad_InS2()==0){};          // wait for touch
  ST7735_FillScreen(0xFFFF);   // set screen to white
  ST7735_DrawBitmap(44, 159, Logo, 40, 160);
  while(LaunchPad_InS2()==0x00040000){}; // wait for release
  while(LaunchPad_InS2()==0){};          // wait for touch
  ST7735_FillScreen(0);       // set screen to black
  for(i=0; i<SIZE; i++){
    ST7735_SetCursor(0,i);
    Dec2String(TestData[i],test); // your Lab 6
    ST7735_OutString(test);
    ST7735_SetCursor(10,i);
    printf("%u",TestData[i]);  // stdio of similar function
  }
  while(LaunchPad_InS2()==0x00040000){}; // wait for release
  while(LaunchPad_InS2()==0){};          // wait for touch
  ST7735_FillScreen(0);       // set screen to black
  for(i=0;i<9;i++){
    ST7735_SetCursor(0,i);
    printf("%u",TestData[i]);  // stdio of similar function
    ST7735_SetCursor(8,i);
    printf("d=%1u.%.3u cm",TestData[i]/1000,TestData[i]%1000);  // fixed point output
  }
  while(1){
  }
}

// using main4 for scope measurement
// connect PB9 and PB8 to a dual trace scope
// notice to draw one character, we output 40 pixels
// and each pixel is a 16bit (2byte) color
// needs ST7735R connected
int main4(void){ // main4
  Clock_Init80MHz(0);
  LaunchPad_Init();
  ST7735_InitR(INITR_REDTAB); // INITR_REDTAB for AdaFruit, INITR_BLACKTAB for HiLetGo
  while(1){
    ST7735_DrawChar(30,40,'a',ST7735_YELLOW,ST7735_BLACK,1);
    Clock_Delay1ms(10);
  }
}

// StringConversion.h
// This software has string conversion function
// Runs on any microcontroller
// Program written by: put your names here
// Date Created: 
// Last Modified:  12/11/2024
// Lab number: 6

#ifndef STRINGCONVERSION_H
#define STRINGCONVERSION_H
#include <stdint.h>

// test function for udivby10
void Test_udivby10(void);

//-----------------------OutDec-----------------------
// Convert a 16-bit number into unsigned decimal format
// Call the function OutChar to output each character
// You will call OutChar 1 to 5 times
// OutChar does not do actual output, OutChar does virtual output used by the grader
// Input: x (call by value) 16-bit unsigned number
// Output: none
void OutDec(uint16_t x);



#endif