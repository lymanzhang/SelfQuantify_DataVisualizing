//PeasyCam lib

import peasy.*;
import controlP5.*;

PeasyCam myCam;
ControlP5 bar;

float boxWidth = 100;
float boxHeight = 100;
float boxDepth = 100;

void setup() {
  size(800, 600, P3D);
  myCam = new PeasyCam(this, 300);
  UI();
}

void draw() {
  background(51);
  fill(255);
  box(boxWidth, boxHeight, boxDepth);

  myCam.beginHUD();
  // now draw things that you want relative to the camera's position and orientation
  bar.draw();
  myCam.endHUD(); // always!
  
  if (mouseX<300 && mouseY< 150) {
      myCam.setActive(false);
    } else {
      myCam.setActive(true);
    }
}