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

INICIO:	    NOP ;Deja pasar un ciclo. Es necesario para dejar pasar el ciclo que toma la instruccion no nativa
	    BANKSEL	ANSEL ;se mueve al banco de ansel
	    CLRF	ANSEL ;pone ansel en 0's, es decir, todos los puertos son digitales
	    BANKSEL	TRISA ;se mueve al banco de trisa
	    MOVLW	B'00000000' ;carga en w el numero indicado
	    MOVWF	TRISA ;escribe el contenido de w en trisa, como todos son 0s, los hace salidas
	    BANKSEL	PORTA ;se mueve al banco de porta
REPETIR:    CLRF	PORTA ;pone todo porta en 0´s
	    NOP ;espera un ciclo de maquina
	    COMF	PORTA ;complemento a 1 de porta
	    NOP		;espera
	    GOTO	REPETIR ;va a repetir, esto se va a ciclar
	    END ;termina