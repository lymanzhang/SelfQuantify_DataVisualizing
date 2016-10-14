//曦潮洞察_5132029014_孙怀玮

HScrollbar hs1;
Table reader, coffeeTrade;

PImage img1, img2, img3, img4, img5, img6, img7, img8, img9, img10,badge;
PFont font1, font2;
int a = 0;    // control whether we should go to the welocome page
int b = 1;    //control the switch between pages
int c = 0;   //control the swtich in pieChart in page1
int d = 0;  // control the swtich in peopleChart in page1
int readerMale = 0;
int readerFemale = 0;
int readerMale_ = 0;
int readerFemale_ = 0;
int readerMale_1 = 0;
int readerFemale_1 = 0;

int bachelor = 0;
int master = 0;
int phd = 0;
int bachelor_ = 0;
int master_ = 0;
int phd_ = 0;
int bachelor_1 = 0;
int master_1 = 0;
int phd_1 = 0;

int date = 0;
int readerCoffee = 0;
int studentCoffee = 0;
float readerSpeed = 0;
float studentSpeed = 0;
float studentSale = 0;
float readerSale = 0;

float time = 0;
float timeB = 0;
float intervalA = 11;
float intervalB = 11;
//float p1X,p1Y,p1Z,p1T,p2X,p2Y,p2Z,p2T,p3X,p3Y,p3Z,p3T;

//int[] angles = new int[3];
int[] angles = {60,150,150};
color[] pieColor = {#41AB99,#82D0C3,#C0E7E0};
color[] barColor = {#46b7a4,#6ac6b7,#9bd9cf,#e5f5f2};
String[] barText = {"本科","硕士","博士","总额"};
String[] readerId = new String[73];
String[] account;

float[] p1 = new float[31] ;
float[] p2 = new float[31];
float[] p3 = new float[31];
float[] p4 = new float[31];
float[] p5 = new float[31];
float[] p6 = new float[31];
float[] p7 = new float[31];
float[] p8 = new float[31];
float[] p9 = new float[31];
float[] p10 = new float[31];
float[] p11 = new float[31];
float[] p12 = new float[31];

int x0 = 770;
int y0 = 650;
float[] xPos = {470,555,786,1006,1073,472,905};
float[] yPos = {470,630,437,512,672,830,821};
float[] r = {90,150,110,120,100,60,70};
String[] name = {"一餐","二餐","三餐","四餐","五餐","六餐","哈乐"};
float[] lineWeight = {3,9,6,7,4,1,2};
String[] saleRank = {"5th","销售冠军","销售季军","销售亚军","4th","7th","6th"};


void setup(){ 
  size(1600,900);
  
  img1 = loadImage("welcome.jpg");
  img2 = loadImage("page1.jpg");
  img3 = loadImage("sale.png");
  img4 = loadImage("location.png");
  img5 = loadImage("coffee.png");
  img6 = loadImage("womanPink.png");
  img7 = loadImage("womanGray.png");
  img8 = loadImage("manBlue.png");
  img9 = loadImage("manGray.png");
  img10 = loadImage("bottle.png");
  badge = loadImage("badge.png");
  reader = loadTable("reader.csv","header");
  account = loadStrings("account.txt");
  coffeeTrade = loadTable("coffee_trade.csv","header");
  
  font1 = createFont("方正小标宋_GBK",20);
  font2 = createFont("微软雅黑",20);
  
  hs1 = new HScrollbar(446,796,600,16,1);
  
  for(int i = 0; i < 31; i ++){
    p1[i] = random(0,83);
    p2[i] = random(0,83);
    p3[i] = random(0,83);
    p4[i] = random(0,83);
    p5[i] = random(0,83);
    p6[i] = random(0,83);
    p7[i] = random(0,83);
    p8[i] = random(0,83);
    p9[i] = random(0,83);
    p10[i] = p1[i] + p2[i] + p3[i];
    p11[i] = p4[i] + p5[i] + p6[i];
    p12[i] = p7[i] + p8[i] + p9[i];
  }
  
  
  

  
  //get the readers' ID
  for(int i = 0; i < 73; i++){
    TableRow a = reader.getRow(i);   
    readerId[i] = a.getString(0);
  //  println(readerId[i]);
  }
  
  getSpeed();
  

  
  
    
}

void draw(){
  if (a == 0 ){
    welcome();  //welcome page
  }
  else {
    initialize();  //draw the basic structure
    judge();  //judge b and decide which page to go
  }
  if(time > 0){
    time = time - 1/frameRate;
  }
  if(intervalA > 0){
    intervalA = intervalA - 1/frameRate;
  }
  else{
    intervalA = 11;
  }
  if(intervalB > 0){
    intervalB = intervalB - 1/frameRate;
  }
  else{
    intervalB = 11;
  }
  if(timeB > 0){
    timeB = timeB - 1/frameRate;
  }

}

void welcome(){
  background(img1);
  noFill();
  stroke(#43b68f);
  rect(700,650,200,50,5);
  
  textFont(font1);
  textSize(24);
  textAlign(CENTER);
  fill(#43b68f);
  text("点 击 进 入",width/2,683);
  
  if(mouseX >= 700 && mouseX <= 900 && mouseY >= 650 && mouseY <= 700){
    fill(#43b68f);
    stroke(#43b68f);
    rect(700,650,200,50,5);
  
    textFont(font1);
    textSize(24);
    textAlign(CENTER);
    fill(255,255,255);
    text("点 击 进 入",width/2,683);
    
    if (mousePressed){
      a = 1;
    }
  }
}

void initialize(){
  background(img2);
  image(img3,288,105);
  image(img4,635,105);
  image(img5,980,105);
  
  fill(#221815,150);
  noStroke();
  rect(288,105,256,146);
  
  fill(#221815,150);
  noStroke();
  rect(635,105,256,146);
  
  fill(#221815,150);
  noStroke();
  rect(980,105,256,146);
  
  textFont(font1);
  textSize(33);
  fill(240);
  text("书友消费", 413, 190);
  
  textFont(font1);
  textSize(33);
  fill(240);
  text("书友饮食", 765, 190);
  
  textFont(font1);
  textSize(33);
  fill(240);
  text("书友与咖啡", 1110, 190);
  
}

void judge(){
  
  if(b == 1){
      page1();
  }
  else if(b == 2){  
      page2();
  }
  else if(b == 3){  
      page3();
  }
  else if(b == 4){
      page4();
  }
}

void page1(){
  drawPage1();
  judgePage1();
}

void page2(){
  drawPage2();
  judgePage2();  
}

void page3(){
  drawPage3();
  judgePage3();  
}

void page4(){
  drawPage4();
  judgePage4();  
}
