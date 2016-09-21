Ball[] myBalls;

void setup() {
  size(640, 400);
  smooth();
  myBalls = new Ball[10];
  
  for (int i = 0; i < myBalls.length; i ++) {
    myBalls[i] = new Ball(random(50, width-20), random(50, height-50));
  }
}

void draw() {
  background(255);
  for (int i = 0; i < myBalls.length; i ++) {
    myBalls[i].update();
    myBalls[i].checkEdges();
    myBalls[i].display();
  }
}

