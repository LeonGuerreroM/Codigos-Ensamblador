
_main:

;LCD1.c,79 :: 		void main(){
;LCD1.c,80 :: 		ANSELH = 0;                   // Los demás pines se configuran como digitales
	CLRF       ANSELH+0
;LCD1.c,81 :: 		TRISB = 0;                    //Configura TRISB como salidas
	CLRF       TRISB+0
;LCD1.c,82 :: 		TRISD=0;
	CLRF       TRISD+0
;LCD1.c,84 :: 		PORTD.F0=1;
	BSF        PORTD+0, 0
;LCD1.c,86 :: 		Lcd_Init();                        // Initialize LCD
	CALL       _Lcd_Init+0
;LCD1.c,88 :: 		Lcd_Cmd(_LCD_CLEAR);               // Clear display
	MOVLW      1
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;LCD1.c,89 :: 		Lcd_Cmd(_LCD_CURSOR_OFF);          // Cursor off
	MOVLW      12
	MOVWF      FARG_Lcd_Cmd_out_char+0
	CALL       _Lcd_Cmd+0
;LCD1.c,91 :: 		text = "Hola Mun";     // Definir el primer mensaje
	MOVLW      ?lstr1_LCD1+0
	MOVWF      _text+0
;LCD1.c,92 :: 		Lcd_Out(1,1,text);             // Escribir el primer mensaje en la primera línea
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      1
	MOVWF      FARG_Lcd_Out_column+0
	MOVF       _text+0, 0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;LCD1.c,94 :: 		text = "Uso del LCD";          // Definir el segundo mensaje
	MOVLW      ?lstr2_LCD1+0
	MOVWF      _text+0
;LCD1.c,95 :: 		Lcd_Out(2,7,text);             // Definir el primer mensaje
	MOVLW      2
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      7
	MOVWF      FARG_Lcd_Out_column+0
	MOVF       _text+0, 0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;LCD1.c,97 :: 		text = "Muestra22";
	MOVLW      ?lstr3_LCD1+0
	MOVWF      _text+0
;LCD1.c,98 :: 		Lcd_Out(1,9,text);
	MOVLW      1
	MOVWF      FARG_Lcd_Out_row+0
	MOVLW      9
	MOVWF      FARG_Lcd_Out_column+0
	MOVF       _text+0, 0
	MOVWF      FARG_Lcd_Out_text+0
	CALL       _Lcd_Out+0
;LCD1.c,100 :: 		PORTD.F1=1;
	BSF        PORTD+0, 1
;LCD1.c,131 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
