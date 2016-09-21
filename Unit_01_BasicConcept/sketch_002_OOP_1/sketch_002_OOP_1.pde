Ball myBalls;

void setup(){
  size(640,400);
  smooth();
  myBalls = new Ball();
}

void draw(){
  background(255);
  myBalls.update();
  myBalls.checkEdges();
  myBalls.display();
}
