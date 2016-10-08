import controlP5.*;

//UI design
//based on ControlP5 lib
//ControlP5

ControlP5 bar;
float elliX = 300;
float elliY = 300;
float elliR = 50;

void setup() {
  size(600, 600);
  UI();
}

void draw() {
  background(51);

  ellipse(elliX, elliY, elliR*2, elliR*2);
}