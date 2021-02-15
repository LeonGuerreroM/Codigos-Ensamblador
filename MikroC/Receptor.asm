
_main:

;Receptor.c,20 :: 		void main() {
;Receptor.c,21 :: 		TRISC = 1;
	MOVLW      1
	MOVWF      TRISC+0
;Receptor.c,22 :: 		ANSELH = 0;
	CLRF       ANSELH+0
;Receptor.c,23 :: 		TRISB = 0;
	CLRF       TRISB+0
;Receptor.c,24 :: 		ANSEL = 0;
	CLRF       ANSEL+0
;Receptor.c,25 :: 		PORTA = 0;
	CLRF       PORTA+0
;Receptor.c,27 :: 		Lcd_Init();                        // Initialize LCD
	CALL       _Lcd_Init+0
;Receptor.c,29 :: 		Lcd_Cmd(_LCD_CLEAR);               // Clear display
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Receptor.c,30 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);          // Cursor off
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;Receptor.c,32 :: 		UART1_Init(19200);
	MOVLW      12
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;Receptor.c,34 :: 		while (1) {
L_main0:
;Receptor.c,35 :: 		if (UART1_Data_Ready()==1) { // si se ha recibido un dato
	CALL       _UART1_Data_Ready+0
	MOVF       R0+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_main2
;Receptor.c,36 :: 		Delay_ms(100);
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
;Receptor.c,37 :: 		recibido0 = UART1_Read(); // leerlo
	CALL       _UART1_Read+0
	MOVF       R0+0, 0
	MOVWF      _recibido0+0
	CLRF       _recibido0+1
;Receptor.c,39 :: 		IntToStr(recibido0, text);
	MOVF       _recibido0+0, 0
	MOVWF      FARG_IntToStr_input+0
	MOVF       _recibido0+1, 0
	MOVWF      FARG_IntToStr_input+1
	MOVF       _text+0, 0
	MOVWF      FARG_IntToStr_output+0
	CALL       _IntToStr+0
;Receptor.c,40 :: 		Lcd_Out(1,1,text);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVF       _text+0, 0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Receptor.c,41 :: 		Delay_ms(100);
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
;Receptor.c,59 :: 		}
L_main2:
;Receptor.c,60 :: 		Delay_ms(100);
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_main5:
	DECFSZ     R13+0, 1
	GOTO       L_main5
	DECFSZ     R12+0, 1
	GOTO       L_main5
	NOP
	NOP
;Receptor.c,61 :: 		if (UART1_DATA_READY()==1){
	CALL       _UART1_Data_Ready+0
	MOVF       R0+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_main6
;Receptor.c,63 :: 		recibido1 = UART1_Read();
	CALL       _UART1_Read+0
	MOVF       R0+0, 0
	MOVWF      _recibido1+0
	CLRF       _recibido1+1
;Receptor.c,65 :: 		IntToStr(recibido1, text1);
	MOVF       _recibido1+0, 0
	MOVWF      FARG_IntToStr_input+0
	MOVF       _recibido1+1, 0
	MOVWF      FARG_IntToStr_input+1
	MOVF       _text1+0, 0
	MOVWF      FARG_IntToStr_output+0
	CALL       _IntToStr+0
;Receptor.c,66 :: 		Lcd_Out(1,9,text1);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      9
	MOVWF      FARG_Lcd_Out_column+0
	MOVF       _text1+0, 0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Receptor.c,67 :: 		Delay_ms(100);
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_main7:
	DECFSZ     R13+0, 1
	GOTO       L_main7
	DECFSZ     R12+0, 1
	GOTO       L_main7
	NOP
	NOP
;Receptor.c,68 :: 		}
L_main6:
;Receptor.c,70 :: 		if (UART1_DATA_READY()==1){
	CALL       _UART1_Data_Ready+0
	MOVF       R0+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_main8
;Receptor.c,71 :: 		recibido2 = UART1_Read();
	CALL       _UART1_Read+0
	MOVF       R0+0, 0
	MOVWF      _recibido2+0
	CLRF       _recibido2+1
;Receptor.c,73 :: 		IntToStr(recibido2, text2);
	MOVF       _recibido2+0, 0
	MOVWF      FARG_IntToStr_input+0
	MOVF       _recibido2+1, 0
	MOVWF      FARG_IntToStr_input+1
	MOVF       _text2+0, 0
	MOVWF      FARG_IntToStr_output+0
	CALL       _IntToStr+0
;Receptor.c,74 :: 		Lcd_Out(2,4,text2);
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      4
	MOVWF      FARG_Lcd_Out_column+0
	MOVF       _text2+0, 0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;Receptor.c,75 :: 		Delay_ms(100);
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_main9:
	DECFSZ     R13+0, 1
	GOTO       L_main9
	DECFSZ     R12+0, 1
	GOTO       L_main9
	NOP
	NOP
;Receptor.c,76 :: 		}
L_main8:
;Receptor.c,78 :: 		}
	GOTO       L_main0
;Receptor.c,79 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
