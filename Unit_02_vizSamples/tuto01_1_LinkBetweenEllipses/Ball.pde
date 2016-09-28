class Ball {
  float x, y, r;
  color elliFill;

  Ball(float x_, float y_, float r_, color elliFill_) {
    x=x_;
    y=y_;
    r=r_;
    elliFill = elliFill_;
  }

  void display() {
    stroke(0);
    strokeWeight(1);
    fill(elliFill);
    ellipse(x, y, r*2, r*2);
  }

  void drawLine() {
    Ball b;

    for (int i=0;i<balls.length;i++) {
      b=balls[i];
      if (b!=this) {
        float ballDiff=dist(x, y, b.x, b.y);
        if (ballDiff<100) {
          float lineStroke=11-map(ballDiff, 0, 100, 1, 10);
          stroke(100);
          strokeWeight(lineStroke);
          line(x, y, b.x, b.y);
        }
      }
    }
  }
}