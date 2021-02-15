
_main:

;Recibe1Fotores.c,4 :: 		void main() {
;Recibe1Fotores.c,5 :: 		TRISD = 0;
	CLRF       TRISD+0
;Recibe1Fotores.c,6 :: 		TRISC = 1;
	MOVLW      1
	MOVWF      TRISC+0
;Recibe1Fotores.c,7 :: 		ANSELH = 0;
	CLRF       ANSELH+0
;Recibe1Fotores.c,8 :: 		TRISB = 0;
	CLRF       TRISB+0
;Recibe1Fotores.c,9 :: 		ANSEL=0;
	CLRF       ANSEL+0
;Recibe1Fotores.c,10 :: 		TRISA=0;
	CLRF       TRISA+0
;Recibe1Fotores.c,12 :: 		UART1_Init(19200);
	MOVLW      12
	MOVWF      SPBRG+0
	BSF        TXSTA+0, 2
	CALL       _UART1_Init+0
;Recibe1Fotores.c,14 :: 		while (1) {
L_main0:
;Recibe1Fotores.c,15 :: 		if (UART1_Data_Ready()==1) { // si se ha recibido un dato
	CALL       _UART1_Data_Ready+0
	MOVF       R0+0, 0
	XORLW      1
	BTFSS      STATUS+0, 2
	GOTO       L_main2
;Recibe1Fotores.c,16 :: 		recibido0 = UART1_Read(); // leerlo
	CALL       _UART1_Read+0
	MOVF       R0+0, 0
	MOVWF      _recibido0+0
	CLRF       _recibido0+1
;Recibe1Fotores.c,17 :: 		recibido1 = UART1_Read();
	CALL       _UART1_Read+0
	MOVF       R0+0, 0
	MOVWF      _recibido1+0
	CLRF       _recibido1+1
;Recibe1Fotores.c,18 :: 		recibido2 = UART1_Read();
	CALL       _UART1_Read+0
	MOVF       R0+0, 0
	MOVWF      _recibido2+0
	CLRF       _recibido2+1
;Recibe1Fotores.c,19 :: 		PORTD = recibido0;
	MOVF       _recibido0+0, 0
	MOVWF      PORTD+0
;Recibe1Fotores.c,20 :: 		PORTB = recibido1;
	MOVF       _recibido1+0, 0
	MOVWF      PORTB+0
;Recibe1Fotores.c,21 :: 		PORTA = recibido2;
	MOVF       _recibido2+0, 0
	MOVWF      PORTA+0
;Recibe1Fotores.c,22 :: 		}
L_main2:
;Recibe1Fotores.c,24 :: 		}
	GOTO       L_main0
;Recibe1Fotores.c,25 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
