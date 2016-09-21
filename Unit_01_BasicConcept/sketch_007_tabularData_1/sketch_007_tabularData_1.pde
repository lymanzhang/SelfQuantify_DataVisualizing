Table myTable;
void setup(){
  size(640,400);
  smooth();
  String s = "64,100,32,7,87,22";
  myTable = loadTable("data.csv");
}

void draw(){
  background(0);
  TableRow row = myTable.getRow(0);
  float x = row.getInt(0);
  float y = row.getInt(1);
  float w = row.getInt(2);
  float h = row.getInt(3);
  
  rect(x,y,w,h);
  
}
