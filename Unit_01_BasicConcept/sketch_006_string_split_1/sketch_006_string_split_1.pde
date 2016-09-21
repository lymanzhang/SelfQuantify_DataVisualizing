
void setup(){
  size(640,480);
  smooth();
}

void draw(){
  background(0);
  String s = "100,90,32,7,87";
  //String c = "200,50,120,190,90";
  String[] nums = split(s, ",");
  //String[] colors = split(c, ",");
  int[] vals = int(nums);
  //int[] ellipseColor = int(colors);
  
  for(int i = 0; i < nums.length; i ++){
    //fill(ellipseColor[i]);
    ellipse(50 + i*50, 200, vals[i], vals[i]);
  }
}
  
  
