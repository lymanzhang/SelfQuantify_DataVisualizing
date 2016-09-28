float [] distance = {0, 0, 3.3, 2.7, 3.9, 4.25, 4.03, 3.2, 5.7, 9.4, 2.2, 0, 3.2, 0, 0, 1.5, 1.9, 34, 24, 4.4, 0.5, 0, 0.3};
int [] minutes = {20, 15, 45, 18, 33, 105, 17, 75, 44, 55, 35, 55, 35, 25, 55, 7, 22, 225, 12, 67, 33, 55, 47};
String [] activity = {"Wake Up & Get Ready", "Breakfast", "Gym", "Cofee Shop", "Grade Papers", "Lecture", "Read NYTimes", "Lunch Meeting", "Grocery Shopping", "Hardware Store", "Friend Visit", "Make Dinner", "Dessert", "Wake Up", "Breakfast for family", "Gas up car", "Groceries for picnic", "Coast trip", "Ice Cream", "Doctor visit", "Yard Work", "Clean House", "Visit neighbor"};
int [] day = {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 2, 2, 2, 2, 2, 2, 2, 2, 2, 2};
float scaler = 1;


void setup(){
  size(800,800);
  background(80,144,200);
  smooth();
}

void draw(){
  background(100);
  translate(width/2, height/2);
  scale(scaler);
  stroke(0);
  strokeWeight(.2);
  line(-10,0,10,0);
  line(0,-10,0,10);
  
  // FOR LOOP cycles through all elements in array
  for (int i=0; i<distance.length ; i++){
    
    pushMatrix(); // used to isolation rotation/scaling/translation, must end with popMatrix()
    noStroke();
    rotate(radians(360/23*i)); // rotate by ~15.6 degrees for each element
    fill(192,150,78,180);
    ellipse(distance[i]*65, 0, minutes[i],minutes[i]); // draws large ellipse, size in minutes
    fill(25, 75);
    ellipse(distance[i]*65, 0, 3,3); // draw inner reference ellipse "core"
    popMatrix();
    
    fill(0,200);
    //Below lines uses trig to convert angle+distance to an X/Y coordinate. Will use this for text later
    // See http://processing.org/learning/trig/ for more
    float x = cos(radians(360/23*i)) * distance[i]*65;
    float y = sin(radians(360/23*i)) * distance[i]*65;
   text(activity[i], x+minutes[i]/2, y); 
   // Note you can append text to an array item below
   text(minutes[i] + " minutes", x+minutes[i]/2, y+12);
   
  stroke(255); 
  line(x,y, 0,0);  // These are the lines that go from ellipse center to sketch center.
  }
}

// Up and down arrow keys grow and shrink a variable that is used for scaling (scaler)
// This is to allow a ZOOM in and out.
void keyPressed(){
  if(keyCode == UP){
    scaler *= 1.25;
  }
  else if(keyCode == DOWN){
    scaler *= .85;
  }
}