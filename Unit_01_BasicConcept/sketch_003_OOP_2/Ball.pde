class Ball{
 float x;
 float y;
 float xspeed = 5;
 float yspeed = 2.3;
 float ellipseD = 32;
 
 Ball(float x_, float y_){
   x = x_;
   y = y_;
 }
 
 void display(){
   stroke(0);
   fill(127);
   ellipse(x,y,ellipseD,ellipseD);
 }
 
 void update(){
   x = x + xspeed;
   y = y + yspeed;
 }
 
 void checkEdges(){
   if(x+ellipseD/2 > width || x-ellipseD/2 < 0){
     xspeed = xspeed*-1;
   }
   if(y+ellipseD/2 > height || y-ellipseD/2 < 0){
     yspeed = yspeed*-1;
   }
 }
}
