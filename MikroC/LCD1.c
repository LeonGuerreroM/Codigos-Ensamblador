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

char *text;

void main(){
  ANSELH = 0;                   // Los demás pines se configuran como digitales
  TRISB = 0;                    //Configura TRISB como salidas
  TRISD=0;

  PORTD.F0=1;

  Lcd_Init();                        // Initialize LCD

  Lcd_Cmd(_LCD_CLEAR);               // Clear display
  Lcd_Cmd(_LCD_CURSOR_OFF);          // Cursor off
  
  text = "Hola Mun";     // Definir el primer mensaje
  Lcd_Out(1,1,text);             // Escribir el primer mensaje en la primera línea

  text = "Uso del LCD";          // Definir el segundo mensaje
  Lcd_Out(2,7,text);             // Definir el primer mensaje
  
  text = "Muestra22";
  Lcd_Out(1,9,text);

  PORTD.F1=1;
}
