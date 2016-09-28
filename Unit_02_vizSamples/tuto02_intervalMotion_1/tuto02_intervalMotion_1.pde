//Liqun Zhang, Aug/12/2014.
//Design Management Institute, IntelliMattress Project. 
//this program is a text to explore a kind of motion effect

PFont font;

float recHeight; //new rect height value each time generating new values
float recWidth; //new rect width value each time generating new values
float recHeightPre = 100; //the previous rect height value
float recWidthPre = 100; //the previous rect width value
float rectH; //the rect height value to display, it's dynamics to get motion effects;
float rectW; //the rect width value to display, it's dynamics to get motion effects;
int interVal = 60; //how much times to get to the new value from previous value
int k; //the index

boolean ArrowsDisp = false; //by default, arrows and numbers are not visiable.

void setup() {
  size(600, 600);
  generateRect();
  font = createFont("Monaco", 16, true);
  smooth();
}

void draw() {
  background(0);
  interValDist();
  dispalyRect();
  if (ArrowsDisp) {
    displayArrows();
  }
}

void generateRect() {
  float randomIndex = random(1);
  if ( randomIndex < 0.5) {
    recHeight = random(100, 450);
    recWidth = recWidthPre;
  } else {
    recHeight = recHeightPre;
    recWidth = random(100, 450);
  }
  println(recHeight+" / "+recWidth);
}

void dispalyRect() {
  noStroke();
  fill(100, 0, 255);
  rect(100, 100, rectW, rectH);
}

void displayArrows() {
  //display verticle number and arrows
  textFont(font,16);
  stroke(255);
  line(100, 84, 106, 78);
  line(100, 84, 106, 90);
  line(100+rectW, 100-16, 100+rectW-6, 100-22);
  line(100+rectW, 100-16, 100+rectW-6, 100-10);

  //String sW = ""+rectW; //this method is easily turn digidata into string
  String sW = nf(rectW,3,1); //reduce the precision of rectW to 1 number after "."
  float textWidthW = textWidth(sW);
  fill(255);
  line(100, 84, 100+(rectW-textWidthW)/2-10, 84);
  line(100+rectW, 84, 100+rectW-(rectW-textWidthW)/2+10, 84);
  textAlign(CENTER, CENTER);
  text(sW, 100+rectW/2, 84);

  //display verticle number and arrows
  line(84, 100, 90, 106);
  line(84, 100, 78, 106);
  line(100-16, 100+rectH, 100-22, 100+rectH-6);
  line(100-16, 100+rectH, 100-10, 100+rectH-6);

  //String sH = ""+rectH; //this method is easily turn digidata into string
  String sH = nf(rectH,3,1);  //reduce the precision of rectW to 1 number after "."
  float textWidthH = textWidth(sH);
  fill(255);
  line(84, 100, 84, 100+(rectH-textWidthH)/2-10);
  line(84, 100+rectH, 84, 100+rectH-(rectH-textWidthH)/2+10);
  textAlign(CENTER, CENTER);
  pushMatrix();
  translate(84, 100+rectH/2);
  rotate(PI/2);
  text(sH, 0, 0);
  popMatrix();
}

void interValDist() {
  if (k < interVal ) {
    float hDiff = (recHeight - recHeightPre)/interVal;
    float wDiff = (recWidth - recWidthPre)/interVal;
    rectH = recHeightPre+hDiff*k;
    rectW = recWidthPre+wDiff*k;
  }
  k++;
  if (k == interVal) {
    recHeightPre = recHeight;
    recWidthPre = recWidth;
    k=0;
  }
}

void keyPressed() {
  if (key == 'r') {
    generateRect();
  }
  if (key == 'd') {
    if (!ArrowsDisp) {
      ArrowsDisp =true;
    } else if (ArrowsDisp) {
      ArrowsDisp =false;
    }
  }
}

