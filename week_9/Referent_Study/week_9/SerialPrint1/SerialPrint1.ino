
int incomingByte = 0;   // for incoming serial data

void setup() 
{ 
   Serial.begin(9600);
   //Serial.print("1");
   Serial.println("---");

   //Serial.print(0x31);
   //Serial.println("---");

}

void loop() 
{
 if (Serial.available() > 0) 
  {
    //Serial.println(Serial.read());
   incomingByte = Serial.read();
   //Serial.print("I received: ");
   //Serial.println(incomingByte);
   Serial.println(incomingByte, DEC);
  }
}
