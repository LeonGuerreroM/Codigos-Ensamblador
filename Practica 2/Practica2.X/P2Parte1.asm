LIST	    p=16f887 ;indica con que pic se va a trabajar, asi el MPLAB busca sus bibliotecas en su bd
INCLUDE	    <P16f887.INC> ;incluye las bibliotecas para ese pic
	    __CONFIG _CONFIG1, _FOSC_INTRC_CLKOUT & _WDTE_OFF & _PWRTE_OFF & _MCLRE_ON & _CP_OFF & _CPD_OFF & _BOREN_OFF & _IESO_ON & _FCMEN_ON & _LVP_OFF
	    __CONFIG _CONFIG2, _WRT_OFF & _BOR40V

AUX	    EQU		0x20
	    ORG		0
	    GOTO	INICIO
	    ORG		4
;PRÁCTICA
;PARTE 1
;MESA D2, 17/SEPT/2019

INICIO:     NOP
            ;CONFIGURACION DE PORTB
            BANKSEL TRISB
            CLRF    TRISB
            BANKSEL ANSELH
            CLRF    ANSELH
            ;CONFIGURACION DE TMR0
            BANKSEL OPTION_REG
            MOVLW   B'00001000'
            MOVWF   OPTION_REG
            ;COMIENZA EL TIMER
            BANKSEL TMR0
            CLRF    TMR0

            ;LEE EL CONTENIDO DE TMR0 Y LO PONE EN PORTB
MOSTRAR:    MOVF   TMR0,0
            MOVWF  PORTB
            GOTO   MOSTRAR
            END

