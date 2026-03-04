// BusyWait.s
// Chinualumogu Nwosu - cmn2675
// Last modification date: 03/03/2026

// Note: these functions do not actually output to SPI or Port A.
// They are called by the grader to see if the functions would work

      .global   SPIOutCommand
      .global   SPIOutData
      .text
      .align 2

// ***********SPIOutCommand*****************
// Inputs: R0 = 32-bit command (number)
//         R1 = address of SPI1->STAT         (status register)
//         R2 = address of SPI1->TXDATA       (transmit data register)
//         R3 = address of GPIOA->DOUTCLR31_0 (writing 0x2000 clears PA13 = D/C LOW)
// Outputs: none
// Steps:
//   1) Read STAT [R1], check bit 4. If HIGH, loop (wait for busy to clear)
//   2) Clear D/C (PA13=0): write 0x2000 to DOUTCLR [R3]
//   3) Write command to TXDATA [R2]
//   4) Read STAT [R1], check bit 4. If HIGH, loop (wait for send to finish)
SPIOutCommand:
    PUSH {R4, R5, LR}

    MOVS R4, R0              // R4 = command byte (save before R0 gets used)
    MOVS R5, #0x10           // R5 = 0x10 = bit4 mask

    // Step 1: Wait while STAT bit4 is HIGH (busy transmitting)
SPICmd_wait1:
    LDR  R0, [R1]            // R0 = SPI1->STAT
    TST  R0, R5              // test bit4
    BNE  SPICmd_wait1        // bit4==1 → still busy, loop

    // Step 2: Clear D/C → PA13 = 0 (command mode)
    // Write 0x2000 to DOUTCLR31_0, friendly clear of just bit 13
    MOVS R0, #0x20
    LSLS R0, R0, #8         // R0 = 0x2000
    STR  R0, [R3]            // GPIOA->DOUTCLR31_0 = 0x2000

    // Step 3: Write command byte to SPI TXDATA
    STR  R4, [R2]            // SPI1->TXDATA = command

    // Step 4: Wait while STAT bit4 is HIGH (wait for this byte to finish sending)
SPICmd_wait2:
    LDR  R0, [R1]            // R0 = SPI1->STAT
    TST  R0, R5              // test bit4
    BNE  SPICmd_wait2        // bit4==1 → still busy, loop

    POP  {R4, R5, PC}        // return


// ***********SPIOutData*****************
// Inputs: R0 = 32-bit data (number)
//         R1 = address of SPI1->STAT         (status register)
//         R2 = address of SPI1->TXDATA       (transmit data register)
//         R3 = address of GPIOA->DOUTSET31_0 (writing 0x2000 sets PA13 = D/C HIGH)
// Outputs: none
// Steps:
//   1) Read STAT [R1], check bit 1. If LOW, loop (wait for TX FIFO not full)
//   2) Set D/C (PA13=1): write 0x2000 to DOUTSET [R3]
//   3) Write data to TXDATA [R2]
SPIOutData:
    PUSH {R4, R5, LR}

    MOVS R4, R0              // R4 = data byte
    MOVS R5, #0x02           // R5 = 0x02 = bit1 mask (TNF = TX FIFO Not Full)

    // Step 1: Wait while STAT bit1 is LOW (TX FIFO full, not ready)
SPIData_wait:
    LDR  R0, [R1]            // R0 = SPI1->STAT
    TST  R0, R5              // test bit1
    BEQ  SPIData_wait        // bit1==0 → FIFO full, loop

    // Step 2: Set D/C → PA13 = 1 (data mode)
    // Write 0x2000 to DOUTSET31_0, friendly set of just bit 13
    MOVS R0, #0x20
    LSLS R0, R0, #8         // R0 = 0x2000
    STR  R0, [R3]            // GPIOA->DOUTSET31_0 = 0x2000

    // Step 3: Write data byte to SPI TXDATA
    STR  R4, [R2]            // SPI1->TXDATA = data

    POP  {R4, R5, PC}        // return

// ****************************************************

    .end
