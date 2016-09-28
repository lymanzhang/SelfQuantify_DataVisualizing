class Bar{
  float rectLBX; //X value of left-bottom corner of rect
  float rectLBY; //Y value of left-bottom corner of rect
  float rectW; //width of rect
  float rectH; //height of rect
  
  Bar(float rectLBX_, float rectLBY_, float rectW_, float rectH_){
    rectLBX = rectLBX_;
    rectLBY = rectLBY_;
    rectW = rectW_;
    rectH = rectH_;
  }
  
  void drawRect(){
    noStroke();
    fill(#6775BC);
    rect(rectLBX, rectLBY - rectH, rectW, rectH);
    textFont(font,16);
    textAlign(CENTER, CENTER);
    String sW = nf(rectH,3,1);
    fill(255);
    text(sW, rectLBX+rectW/2, rectLBY-10);
  }
  
}
