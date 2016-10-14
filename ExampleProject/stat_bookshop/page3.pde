void drawPage3(){
  image(img4,635,105);
  
  textFont(font1);
  textSize(33);
  fill(#43b68f);
  text("「书友饮食」", 767, 310);
  
  stroke(#43b68f);
  fill(#43b68f);
  triangle(758,346,768,328,778,346);
  
  stroke(#43b68f);
  line(330,359,1180,359);
  
  drawLine();
  drawEllipse();
  showData();
  
  
  
}

void judgePage3(){
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
  if(time <= 0 && mouseX >= 635 && mouseX <= 891 && mouseY >= 105 && mouseY <= 251){
    
    fill(#221815,70);
    noStroke();
    rect(635,105,256,146);
        
    if(mousePressed){
      b = 1;
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


void drawEllipse(){
  
  
  stroke(#43b68f);
  fill(255);
  ellipse(x0,y0,96,96);
  
  noStroke();
  fill(#43b68f);
  ellipse(x0,y0,80,80);
  
  textFont(font1);
  textSize(26);
  fill(240);
  text("书友", 769, 658);
  
  for(int i = 0; i < 7; i++){
    stroke(#43b68f);
    fill(255);
    ellipse(xPos[i],yPos[i],r[i],r[i]);
    
    textFont(font1);
    textSize(26+(r[i]-100)/5);
    fill(#43b68f);
    text(name[i], xPos[i]-1,yPos[i]+8);
    
  }
 
}


void drawLine(){
  for(int i = 0; i < 7; i++){
    stroke(#43b68f);
    strokeWeight(lineWeight[i]);
    line(x0,y0,xPos[i],yPos[i]);
    strokeWeight(1);

    
  }
  
}

void showData(){
  for(int i = 0; i < 7; i++){
    if(mouseX >= xPos[i] - r[i]/2 && mouseX <= xPos[i] + r[i]/2 && mouseY >= yPos[i] - r[i]/2 && mouseY <= yPos[i] + r[i]/2){
      stroke(255);
      fill(255);
      ellipse(xPos[i],yPos[i],r[i],r[i]);
      
      stroke(122);
      fill(0,126);
      ellipse(xPos[i],yPos[i],r[i],r[i]);
      
      textFont(font1);
      textSize(26+(r[i]-100)/5);
      fill(230);
      text(name[i], xPos[i]-1,yPos[i]+8);
      
      stroke(#43b68f);
      fill(255);
      ellipse(x0,y0,96,96);
  
      textFont(font1);
      textSize(22);
      fill(#ee807a);
      text(saleRank[i], 769, 658);
    }
  }
}