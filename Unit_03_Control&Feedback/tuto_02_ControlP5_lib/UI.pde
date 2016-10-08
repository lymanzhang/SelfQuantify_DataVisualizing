void UI() {
  bar = new ControlP5(this, createFont("微软雅黑", 14));

  /*
   float radius = 300;
   int pop = 200;
   int lineNum = 50;
   int subDivSteps = 30;
   int lineWeight = 8;
   float reactionDistance = 15;
   float reactionStopDistance = 5;
   */

  bar.addSlider("radiusTMP")
    .setRange(50, 400)
    .setValue(300)
    .setPosition(50, 300)
    .setSize(200, 20).setLabel("外包半径");
  bar.addSlider("popTMP")
    .setRange(100, 400)
    .setValue(200)
    .setPosition(50, 330)
    .setSize(200, 20).setLabel("有效半径");
  bar.addSlider("lineNumTMP")
    .setRange(10, 200)
    .setValue(50)
    .setPosition(50, 360)
    .setSize(200, 20).setLabel("线数");
  bar.addSlider("subDivStepsTMP")
    .setRange(10, 50)
    .setValue(30)
    .setPosition(50, 390)
    .setSize(200, 20).setLabel("线细分步数");
  bar.addSlider("lineWeight")
    .setRange(1, 20)
    .setValue(8)
    .setPosition(50, 420)
    .setSize(200, 20).setLabel("线宽");
  bar.addSlider("reactionDistanceTMP")
    .setRange(10, 50)
    .setValue(15)
    .setPosition(50, 450)
    .setSize(200, 20).setLabel("吸附距离");
  bar.addSlider("reactionStopDistanceTMP")
    .setRange(0, 10)
    .setValue(5)
    .setPosition(50, 480)
    .setSize(200, 20).setLabel("止停距离");  
  bar.addSlider("radianAreaAngleTMP")
    .setRange(0, 180)
    .setValue(120)
    .setPosition(50, 510)
    .setSize(200, 20).setLabel("覆盖角度");
  bar.addSlider("phaseTMP")
    .setRange(0, 360)
    .setValue(120)
    .setPosition(50, 540)
    .setSize(200, 20).setLabel("相位");

  bar.addToggle("displayOriginLayout")
    .setPosition(width-200, 100)
    .setValue(false)
    .setLabel("显示原始网格")
    //.setMode(ControlP5.SWITCH)
    .setSize(50, 20);
  bar.addToggle("stopRun")
    .setPosition(width-200, 150)
    .setValue(false)
    .setLabel("暂停运行")
    //.setMode(ControlP5.SWITCH)
    .setSize(50, 20);
  bar.addToggle("endPoints")
    .setPosition(width-200, 200)
    .setValue(false)
    .setLabel("随机分布端点")
    //.setMode(ControlP5.SWITCH)
    .setSize(50, 20);
  bar.addToggle("randomAreaDistribution")
    .setPosition(width-200, 250)
    .setValue(false)
    .setLabel("随机区域分布")
    //.setMode(ControlP5.SWITCH)
    .setSize(50, 20);
  bar.addToggle("randomColor")
    .setPosition(width-200, 300)
    .setValue(false)
    .setLabel("网格随机颜色")
    //.setMode(ControlP5.SWITCH)
    .setSize(50, 20);
  bar.addToggle("recordPDF")
    .setPosition(width-200, 350)
    .setValue(false)
    .setLabel("导出PDF文件")
    //.setMode(ControlP5.SWITCH)
    .setSize(50, 20);
  bar.addToggle("saveImage")
    .setPosition(width-200, 400)
    .setValue(false)
    .setLabel("导出PNG文件")
    //.setMode(ControlP5.SWITCH)
    .setSize(50, 20);
}

void controlEvent(ControlEvent theEvent) {

  if (theEvent.isFrom(bar.getController("randomAreaDistribution"))) {
    if (randomAreaDistribution) {
      randomAreaDistribution = false;
    } else {
      randomAreaDistribution =true;
    }
    initiateSystem();
  }

  if (theEvent.isFrom(bar.getController("randomColor"))) {
    if (randomColor) {
      randomColor = true;
    } else {
      randomColor =false;
    }
    initiateSystem();
  }

//  if (theEvent.isFrom(bar.getController("recordPDF"))) {
//  }

}

void updateSystem() {
  if (radiusTMP != radius) {
    radius = radiusTMP;
    initiateSystem();
  }
  if (popTMP != pop) {
    pop = popTMP;
    initiateSystem();
  }
  if (lineNumTMP != lineNum) {
    lineNum = lineNumTMP;
    initiateSystem();
  }
  if (subDivStepsTMP != subDivSteps) {
    subDivSteps = subDivStepsTMP;
    initiateSystem();
  }
  //if(lineWeightTMP != lineWeight){
  //  lineWeight = lineWeightTMP;
  //  initiateSystem();
  //}
  if (reactionDistanceTMP != reactionDistance) {
    reactionDistance = reactionDistanceTMP;
    initiateSystem();
  }
  if (reactionStopDistanceTMP != reactionStopDistance) {
    reactionStopDistance = reactionStopDistanceTMP;
    initiateSystem();
  }
  if (radianAreaAngleTMP != radianAreaAngle) {
    radianAreaAngle = radianAreaAngleTMP;
    initiateSystem();
  }
  if (phaseTMP != phase) {
    phase = phaseTMP;
    initiateSystem();
  }
}

void discription() {
  textSize(14);
  textFont(font);
  textAlign(LEFT);
  fill(150);
  text("press key 'i': initiate the generative design system", 50, 50);
  text("press key 's': save current canvas design into .png image", 50, 70);
  text("press key 'o': the toggle of display of original lines layout", 50, 90);
  text("press key 'r': the toggle of pause the computing of program", 50, 110);
  text("press key 'p': output the current design work into PDF file and save to local /designWork folder", 50, 130);
  text("press key 's': output the current design work into PNG file and save to local /designWork folder", 50, 150);
  text("press key 'd': the toggle of random distribute endPoints of lines", 50, 170);
  text("press key 'c': the toggle of random color of lines", 50, 190);
}