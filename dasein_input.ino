void setup() {
  pinMode(2, INPUT);
  Serial.begin(9600);
}

void loop() {
  int reading= digitalRead(2);
  Serial.println(reading);
  delay (100);
}

