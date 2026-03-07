# Worked on Python 3.10.6

import requests
import json

API_KEY = "5wsMXl4m9KS2Pld08CVnq7YRt6GffTc4"
URL = "https://console.sms-kub.com/api/messages"

headers = {
    "Content-Type": "application/json",
    "key": API_KEY
}

data = {
    "to": ["0955134781"],          # เบอร์ปลายทาง
    "from": "SMS-DEMO",            # ต้องเป็น Sender ที่มีอยู่จริงในระบบของคุณ
    "message": "ทดสอบส่ง SMS จาก Python"
}

r = requests.post(URL, headers=headers, json=data, timeout=20)

print("STATUS =", r.status_code)
print("RESPONSE TEXT =", r.text)

try:
    print(json.dumps(r.json(), indent=4, ensure_ascii=False))
except:
    pass