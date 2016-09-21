class Ball{
 float x = 50;
 float y = 50;
 float xspeed = 5;
 float yspeed = 2.3;
 float ellipseD = 32;
 
 Ball(){
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
