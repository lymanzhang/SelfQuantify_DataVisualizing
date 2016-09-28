/*
//用于根据串口输出的数据生成表格，便于后续的可视化工作
 //2015-04-21
 //Zhangliqun
 //zhanglliqun@gmail.com
 
 */

Table intyDataTable;
int index = 0;
int rowNum = 61;
int columeOfData = 10;
int totalRows;//number of rows, which can be used to achieve the loop the vis
float meanValue[] = new float[rowNum];

void setup() {
  size(720, 480);
  rawDataProcess();//generate data table just one time at the beginning
  //frameRate(10);
}

void draw() {
  background(50);
  drawBars();
  drawCurve();
  drawPoints();
  drawHeightmap();
  meanValueArray();
  drawMeanCurve();
  drawMeanCurvePoints();
  index = index % totalRows;//loop
  index ++;//to achieve the motion
  println(index);
}

void rawDataProcess() {
  String lines[] = loadStrings("intyData3.txt");
  println("there are " + lines.length + " lines");
  totalRows = lines.length;

  intyDataTable = new Table();//declare a table object

  for (int i = 0; i < columeOfData; i ++) {
    intyDataTable.addColumn("column"+i);//define table colume ID
  }

  TableRow newRow = intyDataTable.addRow();//declare row

    for (int i = 0; i < lines.length; i++) {
    String s = lines[i];
    String sClean = s.substring(0, 110);//get the date information out of data
    String[] HexNumsRaw = trim(split(sClean, "0x"));
    println("there are " + HexNumsRaw.length + " unit");

    newRow = intyDataTable.addRow();//add new row

      for (int k = 2; k < 12; k ++) {
      String HexNums = HexNumsRaw[k*2-1]+HexNumsRaw[k*2];
      int value = unhex(HexNums);
      newRow.setInt("column"+(k-2), value);//refer each cell to a value
    }
    //saveTable(intyDataTable, "data/sample8.csv");//generate csv table file
  }
}

void drawBars() {
  TableRow row = intyDataTable.getRow(index);
  for (int i = 0; i < columeOfData; i ++) {
    int barHeightRaw = row.getInt("column"+i);
    float barHeight = map(barHeightRaw, 0, 1023, 0, 70);
    fill(#B823F5);
    noStroke();
    rect(50+60*i, height-50-barHeight, 50, barHeight);
    textAlign(CENTER);
    fill(255);
    text(barHeightRaw, 50+60*i+25, height-55);
  }
}

void drawCurve() {
  TableRow row = intyDataTable.getRow(index);
  noFill();
  stroke(#F3F723);
  strokeWeight(3);
  beginShape();
  curveVertex(50+25, height-150-map(row.getInt("column0"), 0, 1023, 0, 70));
  for (int i = 0; i < columeOfData; i ++) {
    int barHeightRaw = row.getInt("column"+i);
    float barHeight = map(barHeightRaw, 0, 1023, 0, 70);    
    curveVertex(50+60*i+25, height-150-barHeight);
  }
  curveVertex(50+540+25, height-150-map(row.getInt("column9"), 0, 1023, 0, 70));
  endShape();
}

void drawPoints() {
  TableRow row = intyDataTable.getRow(index);
  noFill();
  stroke(255);
  strokeWeight(8);
  for (int i = 0; i < columeOfData; i ++) {
    int barHeightRaw = row.getInt("column"+i);
    float barHeight = map(barHeightRaw, 0, 1023, 0, 70);    
    point(50+60*i+25, height-150-barHeight);
  }
}

void drawHeightmap() {
  TableRow row = intyDataTable.getRow(index);
  for (int i = 0; i < columeOfData; i ++) {
    int barHeightRaw = row.getInt("column"+i);
    float blockColor = map(barHeightRaw, 0, 1023, 0, 255);
    fill(blockColor);
    noStroke();
    ellipse(50+60*i+25, 200, 50, 50);
  }
}

void meanValueArray() {
  for (int i = 0; i < totalRows; i ++) {

    TableRow row = intyDataTable.getRow(i);
    float rowValue = 0;
    for (int j = 0; j < columeOfData; j ++) {
      int barHeightRaw = row.getInt("column"+j);
      float unitValue = map(barHeightRaw, 0, 1023, 0, 100);
      rowValue = rowValue + unitValue;
    }

    meanValue[i] = rowValue/columeOfData;
  }
}

void drawMeanCurve() {
  beginShape();
  stroke(100);
  strokeWeight(1);
  noFill();
  line(40, 30, 40, 120);
  line(40, 120, 640, 120);
  for (int i = 0; i < columeOfData; i ++) {
    line(40-5, 30+90/9*i, 40, 30+90/9*i);
  }
  for (int i = 0; i < totalRows+2; i ++) {
    line(40+600/totalRows*i, 120, 40+600/totalRows*i, 120+5);
  }  

  stroke(255);
  for (int i = 0; i < index; i ++) {
    float vertexX = 50+i*600/totalRows;
    float vertexY = 100-meanValue[i];
    vertex(vertexX, vertexY);
  }
  endShape();
}

void drawMeanCurvePoints() {
  strokeWeight(5);
  stroke(200,255,0);
  for (int i = 0; i < index; i ++) {
    float vertexX = 50+i*600/totalRows;
    float vertexY = 100-meanValue[i];
    point(vertexX, vertexY);
  }
}
