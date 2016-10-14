void drawPage4(){
  image(img5,980,105);
  
  
  textFont(font1);
  textSize(33);
  fill(#43b68f);
  text("「书友与咖啡」", 767, 310);
  
  stroke(#43b68f);
  fill(#43b68f);
  triangle(758,346,768,328,778,346);
  
  stroke(#43b68f);
  line(330,359,1180,359);
  
  
  coffeeSpeed1(studentSpeed);
  coffeeSpeed2(readerSpeed);
  
  studentCoffee = 0;
  readerCoffee = 0;
  
  infoDisplay();
}

void judgePage4(){
  if(mouseX >= 288 && mouseX <= 544 && mouseY >= 105 && mouseY <= 251){
    image(img3,288,105);

    
    fill(#221815,70);
    noStroke();
    rect(288,105,256,146);
    
    textFont(font1);
    textSize(33);
    fill(240);
    text("书友消费", 413, 190);
  

    if(mousePressed){
      b = 2;
      time = 0.3;     
    }
   }
  
  
  if(mouseX >= 635 && mouseX <= 891 && mouseY >= 105 && mouseY <= 251){
    image(img4,635,105);
    
    fill(#221815,70);
    noStroke();
    rect(635,105,256,146);
    
    textFont(font1);
    textSize(33);
    fill(240);
    text("书友饮食", 765, 190);
    
    if(mousePressed){
      b = 3;
      time = 0.3;
    }    
  }
  
  if(time <=0 && mouseX >= 980 && mouseX <= 1236 && mouseY >= 105 && mouseY <= 251){
    
    fill(#221815,70);
    noStroke();
    rect(980,105,256,146);
    
    
    if(mousePressed){
      b = 1;
      time = 0.3;
    }
  }
}


void coffeeSpeed1(float a1){
  int aWidth = 80;
  int xBegin = 280;
  int yBegin = 400;
  
   
   if(intervalA <= 10){
     image(img10, xBegin + aWidth , yBegin);
   }
   
   if(intervalA <= 10-a1*1){
     image(img10, xBegin + aWidth*2 , yBegin);
   }
   
   if(intervalA <= 10-a1*2){
     image(img10, xBegin + aWidth*3 , yBegin);
   }
   
   if(intervalA <= 10-a1*3){
     image(img10, xBegin + aWidth*4 , yBegin);
   }
   
   if(intervalA <= 10-a1*4 ){
     image(img10, xBegin + aWidth*5 , yBegin);
   }
   
   if(intervalA <= 10-a1*5){
     image(img10, xBegin + aWidth*6 , yBegin);
   }
   
   if(intervalA <= 10-a1*6){
     image(img10, xBegin + aWidth*7 , yBegin);
   }
   
   if(intervalA <= 10-a1*7){
     image(img10, xBegin + aWidth*8 , yBegin);
   }
   
   if(intervalA <= 10-a1*8){
     image(img10, xBegin + aWidth*9 , yBegin);
   }
   
   if(intervalA <= 10-a1*9){
     image(img10, xBegin + aWidth*10 , yBegin);
   }
   if(intervalA <= 10-a1*10){
     intervalA = 10+a1;
   }
    
}

void coffeeSpeed2(float a2){
  int aWidth = 80;
  int xBegin = 280;
  int yBegin = 650;

   
   if(intervalB <= 10){
     image(img10, xBegin + aWidth , yBegin);
   }
   
   if(intervalB <= 10-a2*1){
     image(img10, xBegin + aWidth*2 , yBegin);
   }
   
   if(intervalB <= 10-a2*2){
     image(img10, xBegin + aWidth*3 , yBegin);
   }
   
   if(intervalB <= 10-a2*3){
     image(img10, xBegin + aWidth*4 , yBegin);
   }
   
   if(intervalB <= 10-a2*4 ){
     image(img10, xBegin + aWidth*5 , yBegin);
   }
   
   if(intervalB <= 10-a2*5){
     image(img10, xBegin + aWidth*6 , yBegin);
   }
   
   if(intervalB <= 10-a2*6){
     image(img10, xBegin + aWidth*7 , yBegin);
   }
   
   if(intervalB <= 10-a2*7){
     image(img10, xBegin + aWidth*8 , yBegin);
   }
   
   if(intervalB <= 10-a2*8){
     image(img10, xBegin + aWidth*9 , yBegin);
   }
   
   if(intervalB <= 10-a2*9){
     image(img10, xBegin + aWidth*10 , yBegin);
   }
   if(intervalB <= 10-a2*10){
     intervalB = 10+a2;
   }
}

void infoDisplay(){
  textFont(font1);
  textSize(30);
  fill(160);
  text("交大学生咖啡消耗平均速度", 774, 589);
  
  textFont(font1);
  textSize(30);
  fill(#ee807a);
  text("曦潮书友咖啡消耗平均速度", 774, 838);
  
  image(badge,985,771);
  
}

void getSpeed(){
  for(int i = 0; i < coffeeTrade.getRowCount() ; i ++){
   // println(coffeeTrade.getRowCount());
    TableRow row = coffeeTrade.getRow(i);
    int shopID = row.getInt(1);
    int consumption = row.getInt(4);
    String studentId = row.getString(0);
    //println(shopID);
   // println(studentID);
   if(shopID == 1000176){
     studentCoffee += consumption;
     for(int j = 0; j < 73; j ++){
       if(readerId[j].equals(studentId)){
         readerCoffee += consumption;
       }
     }
   }
   //println("s"+studentCoffee);
  // println("r"+readerCoffee);
  // max(studentCoffee,readerCoffee);
  // map(0,1,0,max(studentC));
      
  }
  studentSale = studentCoffee/coffeeTrade.getRowCount();
  readerSale = readerCoffee/73;
  //studentSpeed = studentCoffee/readerCoffee;
  studentSpeed = readerSale/studentSale*1.5;
 // println(studentSpeed);
  readerSpeed = 1;
  
  
}