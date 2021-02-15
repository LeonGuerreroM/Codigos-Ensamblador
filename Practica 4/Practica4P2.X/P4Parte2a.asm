    LIST        p=16F887
            INCLUDE     <P16F887.INC>
            __CONFIG _CONFIG1, _FOSC_INTRC_CLKOUT & _WDTE_OFF & _PWRTE_OFF & _MCLRE_ON & _CP_OFF & _CPD_OFF & _BOREN_OFF & _IESO_ON & _FCMEN_ON & _LVP_OFF
	    __CONFIG _CONFIG2, _WRT_OFF & _BOR40V

            REGISTRO1   EQU         0x11
            REGISTRO2   EQU         0x12
            REGISTRO3   EQU         0x13
    
            ORG 0
            GOTO INICIO
            ORG 4


ISR:        NOP
            BANKSEL     ADRESH
            MOVF        ADRESH,0
            BANKSEL     PORTC
            MOVWF       PORTC
            BANKSEL     ADRESL
            MOVF        ADRESL,0
            BANKSEL     PORTB
            MOVWF       PORTB

            BANKSEL     PIR1
            CLRF        PIR1
            BANKSEL     ADCON0
            BSF         ADCON0,1
            RETFIE


RETARDO:    MOVLW	0X0F
	    MOVWF	REGISTRO3
DEC3:	    MOVLW	0X95
	    MOVWF	REGISTRO2
DEC2:	    MOVLW	0XFF
	    MOVWF	REGISTRO1
DEC1:	    DECFSZ	REGISTRO1,1
	    GOTO	DEC1
	    DECFSZ	REGISTRO2,1
	    GOTO	DEC2
	    DECFSZ	REGISTRO3,1
	    GOTO	DEC3
	    RETURN


INICIO:     NOP
            BANKSEL     ADCON1
            MOVLW       B'10000000' ;JUSTIFICADO A LA DRECHA O ASRESIL LLENO CON LOS BITS MAS BAJOS
            MOVWF       ADCON1
            BANKSEL     TRISB
            CLRF        TRISB
            BANKSEL     TRISC
            CLRF        TRISC
            BANKSEL     ANSELH
            CLRF        ANSELH
            BANKSEL     ANSEL
            CLRF        ANSEL
            COMF        ANSEL
            BANKSEL     TRISA
            CLRF        TRISA
            BSF         TRISA,0
            BANKSEL     INTCON
            MOVLW       B'11000000' ;ACTIVAR EN EL INTCON INTERRUPCIONES PERIFERICAS
            MOVWF       INTCON
            BANKSEL     PIR1 ;PARA PONER NE 0 LA BANDERA DE INTERRUPCION QUE INDICA LA FINALIZACION DE UNA ADC
            CLRF        PIR1
            BANKSEL     PIE1
            MOVLW       B'01000000' ;ACTIVAR INTERRUPCION POR ADC
            MOVWF       PIE1

            BANKSEL     ADCON0
            MOVLW       B'01000001'
            MOVWF       ADCON0
            CALL        RETARDO
            BSF         ADCON0,1
            BTFSC       ADCON0,1
            ;GOTO        $-1 ;REGRESA UNA INSTRUCCION
COMPRUEBA:  GOTO        COMPRUEBA
            END




