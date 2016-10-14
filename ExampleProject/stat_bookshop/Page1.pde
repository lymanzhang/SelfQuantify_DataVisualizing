void drawPage1(){
  getPeopleData1();
  getPieChartData1();
  
  pieChartMode();
  peopleChartMode();
  
  textFont(font1);
  textSize(28);
  fill(#43b68f);
  text("「书友基本数据」", 767, 314);
  
 // stroke(#43b68f);
  //fill(#43b68f);
 // triangle(758,346,768,328,778,346);
  
  stroke(#43b68f);
  line(330,348,1180,348);
  
  textFont(font1);
  textSize(25);
  fill(#898989);
  text("就读分布", 487, 404);
  
  textFont(font1);
  textSize(25);
  fill(#898989);
  text("性别比例", 973, 404);
  
  float total = bachelor + master + phd;
  angles[0] = round(bachelor*360/total) ;
  angles[1] = round(master*360/total);
  angles[2] = 360-round(bachelor*360/total)-round(master*360/total);
  
  pieChart(195, angles);
  
  bachelor = 0;
  master = 0;
  phd = 0;
  
  bachelor_ = 0;
  master_ = 0;
  phd_ = 0;
  
  bachelor_1 = 0;
  master_1 = 0;
  phd_1 = 0;
  
  peopleChart(readerMale,readerFemale);
  
  readerMale = 0;
  readerFemale = 0;
  
  readerMale_ = 0;
  readerFemale_ = 0;
  
  readerMale_1 = 0;
  readerFemale_1 = 0;
   
  
  
  stroke(#43b68f);
  line(330,780,1180,780);
  
  textFont(font1);
  textSize(22);
  fill(#43b68f);
  text("点击上方栏目查看更多数据", 767, 818);
  
  stroke(#43b68f);
  fill(#43b68f);
  triangle(761,844,768,831,775,844);
  
  noStroke();
  fill(#41AB99);
  ellipse(401,674,12,12);
  
  noStroke();
  fill(#82D0C3);
  ellipse(465,674,12,12);
  
  noStroke();
  fill(#C0E7E0);
  ellipse(529,675,12,12);
  
  textFont(font2);
  textSize(14);
  fill(120);
  text("本科", 427,679);
  
  textFont(font2);
  textSize(14);
  fill(120);
  text("硕士", 494, 679);
  
  textFont(font2);
  textSize(14);
  fill(120);
  text("博士", 557, 679);
}

void pieChart(float diameter, int[] data) {
  float lastAngle = 0;
  for (int i = 0; i < data.length; i++) {
    noStroke();
    fill(pieColor[i]);
    arc(482, 541, diameter, diameter, lastAngle, lastAngle+radians(angles[i]));
    lastAngle += radians(angles[i]);
  }
}

void peopleChart(float manData, float womanData){
  for(int i = 0; i < 10; i++){
    if(i+1 <= round(10*womanData/(manData+womanData))){
      image(img6, 800+i*37, 454);
    }
    else{
      image(img7, 800+i*37, 450);
    }
  }
  
  for(int i = 0; i < 10; i++){
    if(i+1 <= round(10*manData/(manData+womanData))){
      //print(manData/(manData+womanData));
      image(img8, 800+i*37, 578);
    }
    else{
      image(img9, 800+i*37, 576);
    }
  }
  
  textFont(font1);
  textSize(33);
  fill(#ee807a);
  text(round(100*womanData/(manData+womanData))+"%", 980, 548);
  
  textFont(font1);
  textSize(33);
  fill(#70b6e1);
  text(round(100*manData/(manData+womanData))+"%", 980, 683);
}
  
  
void judgePage1(){
  if(time <=0 && mouseX >= 288 && mouseX <= 544 && mouseY >= 105 && mouseY <= 251){
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
  
  if(time <= 0 && mouseX >= 980 && mouseX <= 1236 && mouseY >= 105 && mouseY <= 251){
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

void getPeopleData1(){
  for(int i = 0; i < account.length ; i ++){
  //  println(account[i]);
    String[] line = splitTokens(account[i]);
    String gender = line[2];
    String Id = line[0];
   // println(line.length);
   
   if(gender.equals("男")){
      readerMale_ ++;
      }
      else if(gender.equals("女") ){
      readerFemale_ ++;
      }
    
    for(int j = 0; j < 73; j ++){
      if(gender.equals("男") && Id.equals(readerId[j])){
      readerMale_1 ++;
      }
      else if(gender.equals("女") && Id.equals(readerId[j])){
      readerFemale_1 ++;
      }
    }
   
  }
 // println(readerMale);
}

void getPieChartData1(){
  for(int i = 0; i < account.length ; i ++){
  //  println(account[i]);
    String[] line = splitTokens(account[i]);
    String program = line[5];
    String Id = line[0];
   // println(line.length);
   
   if(program.equals("本科")){
      bachelor_ ++;
      }
      else if(program.equals("硕士") ){
      master_ ++;
      }
      else if(program.equals("博士") ){
      phd_ ++;
      }
   
    for(int j = 0; j < 73; j ++){
      if(program.equals("本科") && Id.equals(readerId[j])){
      bachelor_1 ++;
      }
      else if(program.equals("硕士") && Id.equals(readerId[j])){
      master_1 ++;
      }
      else if(program.equals("博士") && Id.equals(readerId[j])){
      phd_1 ++;
      }
    }
   
  }
  //println(bachelor_);
  //println(bachelor);
}

void pieChartMode(){
  
  
  if(c == 0 ){
  noStroke();
  fill(200);
  rect(420,711,123,29,5);
    
  noStroke();
  fill(199);
  rect(420,711,79,29,5);
  
  noStroke();
  fill(#43b68f);
  rect(499,711,45,29,5);
  
  textFont(font2);
  textSize(14);
  fill(251);
  text("在校学生", 461, 729);
  
  textFont(font2);
  textSize(14);
  fill(251);
  text("书友", 521, 729);
  
  textFont(font2);
  textSize(14);
  fill(251);
  text("在校学生", 461, 729);
  
  textFont(font2);
  textSize(14);
  fill(251);
  text("书友", 521, 729);
  
  bachelor = bachelor_1;
    master = master_1;
    phd = phd_1;
  
  
  }
  else if( c == 1 ){
    noStroke();
  fill(200);
  rect(420,711,123,29,5);
  
  noStroke();
  fill(#43b68f);
  rect(420,711,79,29,5);
  
  noStroke();
  fill(199);
  rect(499,711,45,29,5);
  
  textFont(font2);
  textSize(14);
  fill(251);
  text("在校学生", 461, 729);
  
  textFont(font2);
  textSize(14);
  fill(251);
  text("书友", 521, 729);
  
  textFont(font2);
  textSize(14);
  fill(251);
  text("在校学生", 461, 729);
  
  textFont(font2);
  textSize(14);
  fill(251);
  text("书友", 521, 729);
  
  bachelor = bachelor_;
    master = master_;
    phd = phd_;
  
  
  }
 
  if(c==0 &&  mousePressed && mouseX >= 420 && mouseX <= 499 && mouseY >= 711 && mouseY <= 740){
    

    c = 1 ;
  }
  
  if(c==1 && mousePressed && mouseX >= 499 && mouseX <= 544 && mouseY >= 711 && mouseY <= 740){
    
    c = 0 ;
  }
}

void peopleChartMode(){
  
  
  if(d == 0 ){
  noStroke();
  fill(200);
  rect(916,711,123,29,5);
    
  noStroke();
  fill(199);
  rect(916,711,79,29,5);
  
  noStroke();
  fill(#43b68f);
  rect(993,711,45,29,5);
  
  textFont(font2);
  textSize(14);
  fill(251);
  text("在校学生", 956, 729);
  
  textFont(font2);
  textSize(14);
  fill(251);
  text("书友", 1016, 729);
  
  textFont(font2);
  textSize(14);
  fill(251);
  text("在校学生", 956, 729);
  
  textFont(font2);
  textSize(14);
  fill(251);
  text("书友", 1016, 729);
  
  readerMale = readerMale_1;
  readerFemale = readerFemale_1;
  
  
  }
  else if( d == 1 ){
    noStroke();
  fill(200);
  rect(916,711,123,29,5);
  
  noStroke();
  fill(#43b68f);
  rect(916,711,79,29,5);
  
  noStroke();
  fill(199);
  rect(993,711,45,29,5);
  
  textFont(font2);
  textSize(14);
  fill(251);
  text("在校学生", 956, 729);
  
  textFont(font2);
  textSize(14);
  fill(251);
  text("书友", 1016, 729);
  
  textFont(font2);
  textSize(14);
  fill(251);
  text("在校学生", 956, 729);
  
  textFont(font2);
  textSize(14);
  fill(251);
  text("书友", 1016, 729);
  
  readerMale = readerMale_;
  readerFemale = readerFemale_;
  
  
  }
 
  if(d==0 &&  mousePressed && mouseX >= 916 && mouseX <= 995 && mouseY >= 711 && mouseY <= 740){
    

    d = 1 ;
  }
  
  if(d==1 && mousePressed && mouseX >= 993 && mouseX <= 1038 && mouseY >= 711 && mouseY <= 740){
    
    d = 0 ;
  }
}