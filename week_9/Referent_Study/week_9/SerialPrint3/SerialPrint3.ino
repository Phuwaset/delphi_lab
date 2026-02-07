
#include <Arduino.h>
//#include <avr/wdt.h>

#define LED_PIN 2  // onboard LED
#define LED_ON digitalWrite(LED_PIN, LOW)
#define LED_OFF digitalWrite(LED_PIN, HIGH)

String incomingByte;   // for incoming serial data

int AnalogPin = A0;
int AnalogVal = 0;

void setup() 
{ 
  pinMode(LED_PIN, OUTPUT);
  LED_ON;
  Serial.begin(9600);
  Serial.print("ok!");
  Serial.println("---");

  Serial.print(0x31);
  Serial.println("---");
}

void loop() 
{
 if (Serial.available() > 0) 
  {
   //incomingByte = Serial.read();
   incomingByte = Serial.readStringUntil('\r');
   if (incomingByte == "Lamp ON")
    {
      LED_ON;
      Serial.println("LED ON");
    }
   else if (incomingByte == "Lamp OFF")
    {
      LED_OFF;
      Serial.println("LED OFF");
    }
   else if (incomingByte == "Get A0")
   {
      AnalogVal = analogRead(AnalogPin);  // read the input pin
      Serial.print("A0 = ");          // debug value
      Serial.println(AnalogVal);          // debug value
   }
   else if (incomingByte == "Get TH")
   {
      AnalogVal = analogRead(AnalogPin);  // read the input pin
      Serial.print(AnalogVal);
      Serial.println(",60");          // debug value
   }
   else
    {
      Serial.println("Error!");
    }
  }
}
