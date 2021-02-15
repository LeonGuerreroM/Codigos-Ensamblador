unsigned int respuesta0,respuesta1, respuesta2;

void main(){
     ANSEL=1;
     TRISA=1;
     ANSELH=0;
     TRISB=0;
     TRISC=0;
     PORTB=0;
     TRISD=0;

     UART1_Init(19200);

     while(1){
              //Delay_ms(100);
              respuesta0 = ADC_Read(0);
              UART1_Write(respuesta0);
              Delay_ms(100);
              respuesta1 = ADC_Read(1);
              UART1_Write(respuesta1);
              Delay_ms(100);
              respuesta2 = ADC_Read(2);
              UART1_Write(respuesta2);
              Delay_ms(100);
              PORTB = respuesta0;
              PORTD = respuesta1;
              //UART1_Write(respuesta0);
              //UART1_Write(respuesta1);
              //UART1_Write(respuesta2);
     }
}