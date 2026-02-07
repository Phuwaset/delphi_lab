void setup() 
{ 
   Serial.begin(9600);
   Serial.println("---");
}

void loop() 
{
 if (Serial.available() > 0) 
  {
    Serial.print("OK => ");
    Serial.println(Serial.read());
  }
}
