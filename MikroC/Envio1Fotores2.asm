
_main:

;Envio1Fotores2.c,3 :: 		void main(){
;Envio1Fotores2.c,4 :: 		ANSEL=1;
	MOVLW      1
	MOVWF      ANSEL+0
;Envio1Fotores2.c,5 :: 		TRISA=1;
	MOVLW      1
	MOVWF      TRISA+0
;Envio1Fotores2.c,6 :: 		ANSELH=0;
	CLRF       ANSELH+0
;Envio1Fotores2.c,7 :: 		TRISB=0;
	CLRF       TRISB+0
;Envio1Fotores2.c,8 :: 		TRISC=0;
	CLRF       TRISC+0
;Envio1Fotores2.c,9 :: 		PORTB=0;
	CLRF       PORTB+0
;Envio1Fotores2.c,10 :: 		TRISD=0;
	CLRF       TRISD+0
;Envio1Fotores2.c,12 :: 		UART1_Init(19200);
	MOVLW      12
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;Envio1Fotores2.c,14 :: 		while(1){
L_main0:
;Envio1Fotores2.c,16 :: 		respuesta0 = ADC_Read(0);
	CLRF       FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _respuesta0+0
	MOVF       R0+1, 0
	MOVWF      _respuesta0+1
;Envio1Fotores2.c,17 :: 		UART1_Write(respuesta0);
	MOVF       R0+0, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;Envio1Fotores2.c,18 :: 		Delay_ms(100);
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_main2:
	DECFSZ     R13+0, 1
	GOTO       L_main2
	DECFSZ     R12+0, 1
	GOTO       L_main2
	NOP
	NOP
;Envio1Fotores2.c,19 :: 		respuesta1 = ADC_Read(1);
	MOVLW      1
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _respuesta1+0
	MOVF       R0+1, 0
	MOVWF      _respuesta1+1
;Envio1Fotores2.c,20 :: 		UART1_Write(respuesta1);
	MOVF       R0+0, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;Envio1Fotores2.c,21 :: 		Delay_ms(100);
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_main3:
	DECFSZ     R13+0, 1
	GOTO       L_main3
	DECFSZ     R12+0, 1
	GOTO       L_main3
	NOP
	NOP
;Envio1Fotores2.c,22 :: 		respuesta2 = ADC_Read(2);
	MOVLW      2
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+0, 0
	MOVWF      _respuesta2+0
	MOVF       R0+1, 0
	MOVWF      _respuesta2+1
;Envio1Fotores2.c,23 :: 		UART1_Write(respuesta2);
	MOVF       R0+0, 0
	MOVWF      FARG_UART1_Write_data_+0
	CALL       _UART1_Write+0
;Envio1Fotores2.c,24 :: 		Delay_ms(100);
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_main4:
	DECFSZ     R13+0, 1
	GOTO       L_main4
	DECFSZ     R12+0, 1
	GOTO       L_main4
	NOP
	NOP
;Envio1Fotores2.c,25 :: 		PORTB = respuesta0;
	MOVF       _respuesta0+0, 0
	MOVWF      PORTB+0
;Envio1Fotores2.c,26 :: 		PORTD = respuesta1;
	MOVF       _respuesta1+0, 0
	MOVWF      PORTD+0
;Envio1Fotores2.c,30 :: 		}
	GOTO       L_main0
;Envio1Fotores2.c,31 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
