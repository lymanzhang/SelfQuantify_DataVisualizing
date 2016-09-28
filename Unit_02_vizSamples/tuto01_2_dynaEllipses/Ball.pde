class Ball {
  float r;
  PVector loc;
  PVector speed = new PVector(0, 0);
  PVector acc = new PVector(0, 0);
  PVector gravity = new PVector(0, 0.1);
  boolean touched = false;

  int index = 0;

  Ball(PVector loc_, float r_) {
    loc = loc_;
    r = r_;
  }

  void update() {
    //speed.add(gravity);
    loc.add(speed);
    display();
    collision();
    wallProcess();
    touchedProcess();    
  }

  void display() {
    fill(255);
    noStroke();
    ellipse(loc.x, loc.y, r*2, r*2);
  }

  void collision() {
    Ball b;
    for (int i = 0; i < balls.length; i ++) {
      b= balls[i];
      if (b!=this) {
        acc = PVector.sub(loc, b.loc);
        if (acc.mag()<1*(b.r+r)) {
          touched = true;
          acc.mult(0.01);
          speed.add(acc);
          loc.add(speed);
          acc = new PVector(0, 0);
          //speed = new PVector(0,0);
        }
        if (acc.mag()<200) {
          stroke(255);
          strokeWeight(map(acc.mag(), b.r+r, 200, 10, 1));
          line(loc.x, loc.y, b.loc.x, b.loc.y);
        }
      }
    }
  }

  void wallProcess() {
    if (loc.x+r>width) {
      touched = true;
      loc.x = width-r;
      speed.x = speed.x*-1;
    }
    if (loc.x-r<0) {
      touched = true;
      loc.x = r;
      speed.x = speed.x*-1;
    }
    if (loc.y+r>height) {
      touched = true;
      loc.y = height-r;
      speed.y = speed.y*-1;
    }
    if (loc.y-r<0) {
      touched = true;
      loc.y = r;
      speed.y = speed.y*-1;
    }
  }

  void touchedProcess() {
    if (touched) {
      stroke(255, 255, 0, 255-index%100*2.5);
      strokeWeight(8);
      noFill();
      ellipse(loc.x, loc.y, r*2 + index%100/2, r*2 + index%100/2);
      index ++;
    }
    if (index%99 == 0) {
      touched = false;
      index = 0;
    }
  }
}