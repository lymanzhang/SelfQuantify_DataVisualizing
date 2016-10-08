//this is a tutorial to demostrate how to design a scrollbar.
ScrollBar bar1;
ScrollBar bar2;

float ellR;
float ellC;

void setup(){
  size(480,800);
  smooth();  
  bar1 = new ScrollBar(50, 25, 380, 30, 0, 100);
  bar2 = new ScrollBar(50, 65, 380, 30, 0, 100);
}

void draw(){
  background(255);
  noStroke();
  bar1.update(mouseX, mouseY);
  bar1.display();
  ellR=norm(bar1.getPos(),0,100)*100;
  bar2.update(mouseX, mouseY);
  bar2.display();
  ellC=norm(bar2.getPos(),0,100)*255;
  fill(ellC);
  ellipse(width/2,height/2,ellR*2,ellR*2);
}

void mousePressed() {
  bar1.press(mouseX, mouseY);
  bar2.press(mouseX, mouseY);
}

void mouseReleased() {
  bar1.release();
  bar2.release();
}