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

RETARDO:    MOVLW	0X02
	    MOVWF	REGISTRO3
DEC3:	    MOVLW	0X82
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

INICIO: 


