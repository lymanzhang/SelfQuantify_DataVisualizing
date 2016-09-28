PFont font;
Bar[] dataBars;

int barNums = 10;
int firstBarStartPointX = 50;
int firstBarStartPointY = 550;
float[] barHeight;
float[] barHeightPrevious;
float[] hDiff;
float[] rectH;

int rectInterval = 10; //interval value between bars
int rectWidth; //width value of bars

int interVal = 60; //how much times to get to the new value from previous value
int k; //the index

boolean BarDisp = true; //by default, bars are visiable.
boolean CurveDisp = false; //by default, curve is not visiable.
boolean PointsDisp = false; //by default, points are not visiable.

void setup() {
  size(1280, 600);
  font = createFont("Monaco", 16, true);
  dataBars = new Bar[barNums];
  barHeight = new float[barNums];
  barHeightPrevious = new float[barNums];
  hDiff = new float[barNums];
  rectH = new float[barNums];
/*
  for (int i = 0; i < dataBars.length; i++) {
    barHeightPrevious[i] = 0;
  }
*/
  generateRect();
  smooth();
}

void draw() {
  background(0);
  rectWidth = (width-firstBarStartPointX*2-rectInterval*(barNums-1))/barNums; //calculate the mean value of bar width.

  for (int i = 0; i < dataBars.length; i++) { 
    dataBars[i] = new Bar(firstBarStartPointX+(rectWidth+rectInterval)*i, firstBarStartPointY, rectWidth, rectH[i]);
  }

  interValDist();
  if (BarDisp) { //diaplay bars
    displayRect();
  }
  if (CurveDisp) { //display curve
    drawCurve();
  }
  if (PointsDisp) { //display points
    drawPoints();
  }
}

//draw bars
void displayRect() {
  for (int i = 0; i < dataBars.length; i++) {
    dataBars[i].drawRect();
  }
}

//generate bar heigth value
void generateRect() {
  for (int i = 0; i < dataBars.length; i++) {
    barHeight[i] = random(50, 450);
  }
}

//calculate steps of the change of bars heigth from previous value to now.
void interValDist() {
  if (k < interVal ) {
    for (int i = 0; i < dataBars.length; i++) {
      hDiff[i] = (barHeight[i] - barHeightPrevious[i])/interVal;
      rectH[i] = barHeightPrevious[i]+hDiff[i]*k;
    }
  }
  k++;
  if (k == interVal) {
    for (int i = 0; i < dataBars.length; i++) {
      barHeightPrevious[i] = barHeight[i];
    }
    k=0;
  }
}

//draw curve
void drawCurve() {

  beginShape(); //begin draw curve

    curveVertex(firstBarStartPointX+rectWidth/2, firstBarStartPointY-rectH[0]); //begin draw first curve point

  for (int i = 0; i < dataBars.length; i++) { //draw inner points between start and end points.
    stroke(#42E32E);
    strokeWeight(5);
    noFill();

    //float x[i] = firstBarStartPointX+(rectWidth+rectInterval)*i+rectWidth/2, 
    //float y[i] = 500-rectH[i];

    curveVertex(firstBarStartPointX+(rectWidth+rectInterval)*i+rectWidth/2, firstBarStartPointY-rectH[i]);
  }
  curveVertex(firstBarStartPointX+(rectWidth+rectInterval)*(dataBars.length-1)+rectWidth/2, firstBarStartPointY-rectH[dataBars.length-1]); //draw last curve point

  endShape(); //end draw curve
}

//draw points
void drawPoints() {
  for (int i = 0; i < dataBars.length; i++) { //draw inner points between start and end points.
    stroke(#42E32E);
    fill(0);
    strokeWeight(5);
    ellipse(firstBarStartPointX+(rectWidth+rectInterval)*i+rectWidth/2, firstBarStartPointY-rectH[i],10,10);
  }
}

//interactions
void keyPressed() {
  if (key == 'r') { //re-generate heigth values of bars
    generateRect();
  }
  if (key == 'b') { //display bars
    if (!BarDisp) {
      BarDisp =true;
    } else if (BarDisp) {
      BarDisp =false;
    }
  }
  if (key == 'c') { //display curve
    if (!CurveDisp) {
      CurveDisp =true;
    } else if (CurveDisp) {
      CurveDisp =false;
    }
  }
  if (key == 'p') { //display points
    if (!PointsDisp) {
      PointsDisp =true;
    } else if (PointsDisp) {
      PointsDisp =false;
    }
  }
}

