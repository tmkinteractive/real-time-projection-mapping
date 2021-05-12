#define joyY A0
#define joyX A1

void setup() {
  // put your setup code here, to run once:
  Serial.begin(9600);
  pinMode(joyX, INPUT);
  pinMode(joyY, INPUT);
}

void loop() {
  // put your main code here, to run repeatedly:
  int xVal = analogRead(joyX);
  int yVal = analogRead(joyY);
  String data = String(xVal) + "," + String(yVal) + ",\n";
  Serial.print(data);
  delay(40);
}
