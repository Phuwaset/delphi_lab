void setup() {
  Serial.begin(9600); // ต้องตรงกับฝั่งรับ (Delphi)
  Serial.println("System Ready: Type a number and press Enter");
}

void loop() {
  // ตรวจสอบว่ามีการพิมพ์ค่าเข้ามาในช่อง Message หรือไม่
  if (Serial.available() > 0) {
    // อ่านค่าที่พิมพ์เข้ามาจนจบบรรทัด
    String inputData = Serial.readStringUntil('\n');
    
    // ส่งค่านั้นออกไปทันที (เพื่อให้ Delphi ได้รับ)
    Serial.println(inputData);
    
    // แสดงสถานะยืนยันในหน้าจอตัวเอง (Optional)
    // Serial.print("Sent to Delphi: ");
    // Serial.println(inputData);
  }
}