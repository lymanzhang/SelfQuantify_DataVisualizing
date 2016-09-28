String food [] = {"Eggs and Toast","Coffee and Cream","Chips and Juice","Rice & Chicken","Soda (12 oz)","Celery Sticks","Cliff Bar","Chicken Curry and Veggies","Chocolate Cake","Red Wine","Toast and Jam","Mug of Tea with honey"};
float time [] = {7.75,8.83333333333333,10.2166666666667,11.75,12.0833333333333,13.75,16.7166666666667,17.8333333333333,19.3333333333333,19.5,21.1666666666667,23};
int calories [] = {84,53,45,175,84,15,106,285,170,100,80,45};

//println(calories.length);
void setup(){
  size(800,600);
  background(0);
  smooth();
  stroke(50,100,150);
  strokeWeight(2);
}

void draw(){
  background(0);
  line(0, height/2, width, height/2);
  
  for (int i=0; i< calories.length;i++){
    fill(250, 30,80, 50);
    ellipse(time[i]*40 - 230, height/2, calories[i], calories[i]);
    fill(255);
    
    pushMatrix();
    translate(time[i]*40 - 230, height/2 - calories[i]/2);
    rotate(radians(-45));
    text(food[i],0,0);  
    popMatrix();
    
}
  
}
