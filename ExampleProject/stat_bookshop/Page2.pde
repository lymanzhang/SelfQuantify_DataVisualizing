void drawPage2(){
  image(img3,288,105);
  
  textFont(font1);
  textSize(33);
  fill(#43b68f);
  text("「书友消费」", 767, 310);
  
  stroke(#43b68f);
  fill(#43b68f);
  triangle(758,346,768,328,778,346);
  
  stroke(#43b68f);
  line(330,359,1180,359);
  
  hs1.update();
  hs1.display();
  hs1.displayMonth();
  
  drawBar(p1,p2,p3,p4,p5,p6,p7,p8,p9,p10,p11,p12,date);
  barInfo();
  
  
  
  
  
}

void judgePage2(){
  if(time <= 0 && mouseX >= 288 && mouseX <= 544 && mouseY >= 105 && mouseY <= 251){
    fill(#221815,70);
    noStroke();
    rect(288,105,256,146);
    

    if(mousePressed){
      b = 1;
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
  
  if(mouseX >= 980 && mouseX <= 1236 && mouseY >= 105 && mouseY <= 251){
    image(img5,980,105);
    
    fill(#221815,70);
    noStroke();
    rect(980,105,256,146);
    
    textFont(font1);
    textSize(33);
    fill(240);
    text("书友与咖啡", 1110, 190);
    
    if(mousePressed){
      b = 4;
      time = 0.3;
    }
      
  }
}






void drawBar(float[] p1,float[] p2, float[] p3, float[] p4, float[] p5, float[] p6, float[] p7, float[] p8, float[] p9, float[] p10, float[] p11, float[] p12, int date){
  stroke(200);
  line(446,411,446,717);
  line(446,717,1039,717);
  
  //xAxis
  for(int i = 0; i < 4; i++){            
    line(500 + 150* i, 712, 500+ 150* i, 722);
  }
  for(int i = 0; i < 3; i++){
    textFont(font2);
    textSize(14);
    fill(180);
    text((7+5*i)+" - "+(12+i*5), 580 + 150*i, 737);
  }
  
  //yAxis
  for(int i = 0; i < 5; i++){            
    line(442, 667 - 50 * i , 450 , 667 - 50 * i);
  }
  for(int i = 0; i < 5; i++){
    textFont(font2);
    textSize(14);
    fill(180);
    text( 50*(i+1), 421 , 673 - 50 * i);
  }
  
  textFont(font2);
  textSize(14);
  fill(180);
  text("时间段",  1010, 737);
  
  textFont(font2);
  textSize(14);
  fill(180);
  text("金额/元",  411, 428);
  
  
    noStroke();   //5-12
    fill(#e5f5f2);
    rect(525 + 150 * 0, 717-p10[date], 99, p10[date]);
    
    fill(#46b7a4);
    rect(525 + 150 * 0, 717-p2[date], 33, p2[date]);
    
    fill(#6ac6b7);
    rect(525 +33 + 150 * 0, 717-p3[date], 33, p3[date]);
    
    fill(#9bd9cf);
    rect(525 + 66 + 150 * 0, 717-p1[date], 33, p1[date]);
    
    noStroke(); //12-17
    fill(#e5f5f2);
    rect(525 + 150 * 1, 717-p11[date], 99, p11[date]);
    
    fill(#46b7a4);
    rect(525 + 150 * 1, 717-p5[date], 33, p5[date]);
    
    fill(#6ac6b7);  //17-22
    rect(525 +33 + 150 * 1, 717-p6[date], 33, p6[date]);
    
    fill(#9bd9cf);
    rect(525 + 66 + 150 * 1, 717-p4[date], 33, p4[date]);
    
    noStroke();
    fill(#e5f5f2);  //17-22
    rect(525 + 150 * 2, 717-p12[date], 99, p12[date]);
    
    fill(#46b7a4);
    rect(525 + 150 * 2, 717-p8[date], 33, p8[date]);
    
    fill(#6ac6b7);
    rect(525 +33 + 150 * 2, 717-p9[date], 33, p9[date]);
    
    fill(#9bd9cf);
    rect(525 + 66 + 150 * 2, 717-p6[date], 33, p6[date]);
  
}

void barInfo(){
  for(int i = 0; i < 4; i++){
    fill(barColor[i]);
    rect(1063,488 + i * 25,18,18);
    
    fill(180);
    textFont(font2);
    textSize(14);
    text(barText[i],1107,502+i * 25);
  }
  
}