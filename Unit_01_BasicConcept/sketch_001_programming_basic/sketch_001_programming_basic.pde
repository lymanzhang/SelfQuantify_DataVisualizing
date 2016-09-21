PFont myFont;

float moveRate = 1;
float ellipseX = 200;

void setup(){
  size(720, 480);
  myFont = createFont("微软雅黑",16);
  //frameRate(10);
  //background(255);
}

void draw(){
  background(255);
  stroke(200);
  //noStroke();
  //strokeWeight(5);
  fill(200,200,0);
  //noFill();
  ellipse(100,200,50,50);
  
  fill(200,200,0,20);
  //noFill();
  ellipse(ellipseX,200,50,50);
  ellipseX = ellipseX + moveRate;
  moveRate = moveRate + 0.001;
  
  if(ellipseX > width){
    ellipseX = 0;
  }
  println(moveRate);
  
  fill(0);
  textFont(myFont, 24);
  text(moveRate, 50, 20);
}
