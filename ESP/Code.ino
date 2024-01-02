#include <SPI.h>
#include <MFRC522.h>
#include <WiFi.h>
#include <HTTPClient.h>
#include <ArduinoJson.h> 
#include <ESP32_Servo.h> 

#define SSID "WiFiSSID" 
#define PASSWORD "WiFiPassword" 
#define SERVER_IP "ServerIP" 
#define SERVER_PORT 5000

#define SERVO_PIN 15
#define RST_PIN 22
#define SS_PIN 5

#define ID1 "Tag ID 1"
#define ID2 "Tag ID 2"

MFRC522 mfrc522(SS_PIN, RST_PIN);
Servo servoMotor;

bool state_emp1 = 0;
bool state_emp2 = 0;

void registerArrival(int employee_id) {
  WiFiClient client;
  HTTPClient http;

  const size_t capacity = JSON_OBJECT_SIZE(1);
  DynamicJsonDocument doc(capacity);
  doc["employee_id"] = employee_id;

  String jsonString;
  serializeJson(doc, jsonString);

  String endpoint = "http://" + String(SERVER_IP) + ":" + String(SERVER_PORT) + "/register_arrival";

  Serial.print("Sending POST request to: ");
  Serial.println(endpoint);

  http.begin(client, endpoint); 
  http.addHeader("Content-Type", "application/json"); 

  int httpResponseCode = http.POST(jsonString); 

  if (httpResponseCode > 0) {
    Serial.print("HTTP Response code: ");
    Serial.println(httpResponseCode);

    String payload = http.getString();
    Serial.println("Response payload: ");
    Serial.println(payload);
  } else {
    Serial.print("Error code: ");
    Serial.println(httpResponseCode);
  }

  http.end(); 
  for (int pos = 0; pos <= 180; pos += 1) {
    servoMotor.write(pos);
    delay(15); 
  }
  delay(500);
    for (int pos = 180; pos >= 0; pos -= 1) {
    servoMotor.write(pos);
    delay(15); 
  }
}

void registerDeparture(int employee_id) {
  WiFiClient client;
  HTTPClient http;

  const size_t capacity = JSON_OBJECT_SIZE(1);
  DynamicJsonDocument doc(capacity);
  doc["employee_id"] = employee_id;

  String jsonString;
  serializeJson(doc, jsonString);

  String endpoint = "http://" + String(SERVER_IP) + ":" + String(SERVER_PORT) + "/register_departure";

  Serial.print("Sending POST request to: ");
  Serial.println(endpoint);

  http.begin(client, endpoint); 
  http.addHeader("Content-Type", "application/json"); 

  int httpResponseCode = http.POST(jsonString);

  if (httpResponseCode > 0) {
    Serial.print("HTTP Response code: ");
    Serial.println(httpResponseCode);

    String payload = http.getString();
    Serial.println("Response payload: ");
    Serial.println(payload);
  } else {
    Serial.print("Error code: ");
    Serial.println(httpResponseCode);
  }

  http.end(); 
    for (int pos = 0; pos <= 180; pos += 1) {
    servoMotor.write(pos);
    delay(15); 
  }
  delay(500);
  for (int pos = 180; pos >= 0; pos -= 1) {
    servoMotor.write(pos);
    delay(15); 
  }
}

void setup() {
  Serial.begin(115200);
  while (!Serial);

  SPI.begin();
  mfrc522.PCD_Init();
  delay(4);
  mfrc522.PCD_DumpVersionToSerial();
  Serial.println(F("Scan PICC to see UID..."));

  WiFi.begin(SSID, PASSWORD);
  while (WiFi.status() != WL_CONNECTED) {
    delay(1000);
    Serial.println("Connecting to WiFi...");
  }
  Serial.println("Connected to WiFi");
  servoMotor.attach(SERVO_PIN);
}

void loop() {
  if (!mfrc522.PICC_IsNewCardPresent()) {
    delay(500);
    return;
  }

  if (!mfrc522.PICC_ReadCardSerial()) {
    delay(500);
    return;
  }

  Serial.print(F("UID tag :"));
  String content = "";
  for (byte i = 0; i < mfrc522.uid.size; i++) {
    Serial.print(mfrc522.uid.uidByte[i] < 0x10 ? " 0" : " ");
    Serial.print(mfrc522.uid.uidByte[i], HEX);
    content.concat(String(mfrc522.uid.uidByte[i] < 0x10 ? " 0" : " "));
    content.concat(String(mfrc522.uid.uidByte[i], HEX));
  }
  content.toUpperCase(); 
  Serial.println();
  Serial.print(F("Message :"));
  content.trim();
  Serial.println(content.substring(1));
  if (content.substring(1) == ID1){
    Serial.println("Employee 1");
    if(state_emp1 == 0)
    {
      registerArrival(1);
      state_emp1 = 1;
    }
    else
    {
      registerDeparture(1);
      state_emp1 = 0;
    }
  }
  else if (content.substring(1) == ID2) {
    Serial.println("Employee 2");
    if(state_emp2 == 0)
    {
      registerArrival(2);
      state_emp2 = 1;
    }
    else
    {
      registerDeparture(2);
      state_emp2 = 0;
    }
  }

  delay(2000);
  mfrc522.PICC_HaltA();
  mfrc522.PCD_StopCrypto1();

}




