LIST        p=16F887
INCLUDE     <P16F887.INC>
            __CONFIG _CONFIG1, _FOSC_INTRC_CLKOUT & _WDTE_OFF & _PWRTE_OFF & _MCLRE_ON & _CP_OFF & _CPD_OFF & _BOREN_OFF & _IESO_ON & _FCMEN_ON & _LVP_OFF
	    __CONFIG _CONFIG2, _WRT_OFF & _BOR40V

    ORG     0
    GOTO    INICIO
    ORG     4

INICIO:     NOP
            BANKSEL     ANSELH
            CLRF        ANSELH
            BANKSEL     TRISB
            CLRF        TRISB
            BANKSEL     OPTION_REG
            MOVLW       B'00000111'
            MOVWF       OPTION_REG
            BANKSEL     TMR0
            CLRF        TMR0
            BANKSEL     PORTB
MOSTRAR:    MOVF        TMR0,0
            MOVWF       PORTB
            GOTO        MOSTRAR
            END




