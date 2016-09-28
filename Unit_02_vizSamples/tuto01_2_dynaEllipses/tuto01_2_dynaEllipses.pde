Ball[] balls = new Ball[10];

void setup() {
  size(1280, 720);
  //fullScreen(2);
  initiateSys();
}

void initiateSys() {
  for (int i = 0; i < balls.length; i ++) {
    float marginValue = 100;
    PVector ballLoc = new PVector(random(marginValue, width-marginValue), random(marginValue, height-marginValue));
    balls[i] = new Ball(ballLoc, random(20, 50));
  }
}

void draw() {
  background(0);
  for (int i = 0; i < balls.length; i ++) {
    balls[i].update();
  }
}

void keyPressed() {
  if (key == 'r') {
    initiateSys();
  }
}