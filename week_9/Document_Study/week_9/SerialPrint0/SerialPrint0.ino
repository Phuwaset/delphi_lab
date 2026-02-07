int pins[] = {2, 5, 18}; // รวมขาทุกตัวที่บอร์ดส่วนใหญ่นิยมใช้

void setup() {
  Serial.begin(9600);
  for(int i=0; i<3; i++) {
    pinMode(pins[i], OUTPUT);
  }
}

void loop() {
  if (Serial.available() > 0) {
    String Data = Serial.readStringUntil('\n');
    Data.trim();
    
    if (Data == "on") {
      for(int i=0; i<3; i++) digitalWrite(pins[i], HIGH);
      Serial.println("OK => ALL ON");
    } 
    else if (Data == "off") {
      for(int i=0; i<3; i++) digitalWrite(pins[i], LOW);
      Serial.println("OK => ALL OFF");
    }
  }
}