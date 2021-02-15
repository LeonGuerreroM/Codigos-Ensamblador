unsigned int recibido0, recibido1, recibido2;


void main() {
     TRISD = 0;
     TRISC = 1;
     ANSELH = 0;
     TRISB = 0;
     ANSEL=0;
     TRISA=0;
     
     UART1_Init(19200);
     
     while (1) {
      if (UART1_Data_Ready()==1) { // si se ha recibido un dato
        recibido0 = UART1_Read(); // leerlo
        recibido1 = UART1_Read();
        recibido2 = UART1_Read();
        PORTD = recibido0;
        PORTB = recibido1;
        PORTA = recibido2;
        }
     
     }
}