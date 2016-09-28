import processing.pdf.*;

Ball[] balls;

void setup() {
  size(800, 600);
  background(255);
  balls=new Ball[30];
  smooth();
  beginRecord(PDF, "filename.pdf");
  initiateSys();
}

void draw() {  
  background(255);
  for (int i=0; i<balls.length; i++) {
    balls[i].display();
    balls[i].drawLine();
  }
}

void initiateSys() {
  for (int i=0; i<balls.length; i++) {
    float ballX=random(20, width-20);
    float ballY=random(20, height-20);
    float ballR=random(10, 20);
    color c=color(random(255),random(255),random(255));
    balls[i]=new Ball(ballX, ballY, ballR, c);
  }
}

void keyPressed() {
  if (key == 'r') {
    initiateSys();
  }
  if(key == 's'){
   endRecord();
 }
}