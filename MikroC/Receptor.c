// LCD module connections
sbit LCD_RS at RB4_bit;
sbit LCD_EN at RB5_bit;
sbit LCD_D4 at RB0_bit;
sbit LCD_D5 at RB1_bit;
sbit LCD_D6 at RB2_bit;
sbit LCD_D7 at RB3_bit;

sbit LCD_RS_Direction at TRISB4_bit;
sbit LCD_EN_Direction at TRISB5_bit;
sbit LCD_D4_Direction at TRISB0_bit;
sbit LCD_D5_Direction at TRISB1_bit;
sbit LCD_D6_Direction at TRISB2_bit;
sbit LCD_D7_Direction at TRISB3_bit;
// End LCD module connections

unsigned int recibido0, recibido1, recibido2;
char *text, *text1, *text2;

void main() {
     TRISC = 1;
     ANSELH = 0;
     TRISB = 0;
     ANSEL = 0;
     PORTA = 0;
     
     Lcd_Init();                        // Initialize LCD

     Lcd_Cmd(_LCD_CLEAR);               // Clear display
     Lcd_Cmd(_LCD_CURSOR_OFF);          // Cursor off

     UART1_Init(19200);

     while (1) {
      if (UART1_Data_Ready()==1) { // si se ha recibido un dato
        Delay_ms(100);
        recibido0 = UART1_Read(); // leerlo
        //PORTA.F0 = 1;
        IntToStr(recibido0, text);
        Lcd_Out(1,1,text);
        Delay_ms(100);
        //recibido2 = UART1_Read();
        //IntToStr(recibido2, text);
        //Lcd_Out(2,4,text);
        //PORTD = recibido0;
        //PORTB = recibido1;
        //PORTA = recibido2;
        /*Delay_ms(100);
        recibido1 = UART1_Read();
        PORTA.F1 = 1;
        IntToStr(recibido1, text1);
        Lcd_Out(1,9,text1);
        Delay_ms(100);
        recibido2 = UART1_Read();
        PORTA.F2 = 1;
        IntToStr(recibido2, text2);
        Lcd_Out(2,4,text2);
        Delay_ms(100);    */
        }
      Delay_ms(100);
      if (UART1_DATA_READY()==1){
        //Delay_ms(100);
        recibido1 = UART1_Read();
        //PORTA.F1 = 1;
        IntToStr(recibido1, text1);
        Lcd_Out(1,9,text1);
        Delay_ms(100);
      }
      
      if (UART1_DATA_READY()==1){
        recibido2 = UART1_Read();
        //PORTA.F2 = 1;
        IntToStr(recibido2, text2);
        Lcd_Out(2,4,text2);
        Delay_ms(100);
      }

     }
}