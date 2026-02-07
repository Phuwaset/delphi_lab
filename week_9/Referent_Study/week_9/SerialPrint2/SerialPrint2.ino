#define LED_PIN 13  // onboard LED
#define LED_ON digitalWrite(LED_PIN, HIGH)
#define LED_OFF digitalWrite(LED_PIN, LOW)

byte incomingByte = 0;   // for incoming serial data

void setup() 
{ 
  pinMode(LED_PIN, OUTPUT);
  LED_OFF;
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
   incomingByte = Serial.read();
   //incomingByte = Serial.readStringUntil('#');
   if (incomingByte == '1')
    {
      LED_ON;
      Serial.println("green#");
    }
   else if (incomingByte == '0')
    {
      LED_OFF;
      Serial.println("red#");
    }
   else
    {
      Serial.println("Error!#");
    }
  }
}
