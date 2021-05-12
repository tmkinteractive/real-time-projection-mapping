import processing.serial.*;
Serial myPort;
int currentX = 900;
int currentY = 700;
int currentZ = 600;
float rotX = 3.14159f;
float rotY = 0;
float rotZ = 0;
int lightX = 80;
int lightY = 20;

int moveMult = 10;
PImage img;

PShape s;
String data;
public void setup() {
  size(1920, 1080, P3D);
  frameRate(30);
  s = loadShape("vase2.obj");
  myPort = new Serial(this, "/dev/tty.usbmodem1101", 9600);
}
    

public void draw() {
  background(0);
  pointLight(50, 200, 255, lightX+300, lightY+100, 1700);
  //spotLight(255, 255, 255, lightX, lightY, 40, -1, 0, 0, PI / 2, 2);
  translate(currentX, currentY, currentZ);
  scale(50);
  rotateX(rotX);
  rotateY(rotY);
  rotateZ(rotZ);
  ambient(51, 26, 0); 
  shape(s);
  while (myPort.available() > 0) {
    data = myPort.readStringUntil(10);
    if (data != null) {
      String[]splitData = split(data, ',');
      lightX = int(splitData[0]);
      lightY = int(splitData[1]);
    }
  }
}

   
void keyPressed() {
        if (key == 'w') {
            currentY -= moveMult;
        }
        if (key == 'a') {
            currentX -= moveMult;
        }
        if (key == 's') {
            currentY += moveMult;
        }
        if (key == 'd') {
            currentX += moveMult;
        }
        if (key == '1') {
            currentZ += moveMult;
        }
        if (key == '2') {
            currentZ -= moveMult;
        }
        if (key == '3') {
            rotX += moveMult / 57.29;
        }
        if (key == '4') {
            rotX -= moveMult / 57.29;
        }
        if (key == 'k') {
            moveMult = 10;
        }
        if (key == 'l') {
            moveMult = 1;
        }

    }
