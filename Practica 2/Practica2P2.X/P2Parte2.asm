LIST	    p=16f887 ;indica con que pic se va a trabajar, asi el MPLAB busca sus bibliotecas en su bd
            INCLUDE	    <P16f887.INC> ;incluye las bibliotecas para ese pic
	    __CONFIG _CONFIG1, _FOSC_INTRC_CLKOUT & _WDTE_OFF & _PWRTE_OFF & _MCLRE_ON & _CP_OFF & _CPD_OFF & _BOREN_OFF & _IESO_ON & _FCMEN_ON & _LVP_OFF
	    __CONFIG _CONFIG2, _WRT_OFF & _BOR40V

REGISTRO1   EQU		0x11
            ORG		0
	    GOTO	INICIO
	    ORG		4

INICIO: NOP
        BANKSEL     ANSELH
        CLRF        ANSELH
        BANKSEL     TRISB
        CLRF        TRISB
        BANKSEL     OPTION_REG
        MOVLW       B'00101000'
        MOVWF       OPTION_REG
        BANKSEL     TMR0
        CLRF        TMR0
MOSTRAR: MOVF        TMR0,0
        BANKSEL     PORTB
        MOVWF       PORTB
        GOTO        MOSTRAR
        END

