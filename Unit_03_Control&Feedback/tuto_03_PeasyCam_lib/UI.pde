void UI() {
  bar = new ControlP5(this, createFont("微软雅黑", 14));
  bar.addSlider("boxWidth")
    .setRange(50, 500)
    .setValue(100)
    .setPosition(50, 50)
    .setSize(200, 20)
    .setLabel("立方体宽度值");
    
  bar.addSlider("boxHeight")
    .setRange(50, 500)
    .setValue(100)
    .setPosition(50, 50+30)
    .setSize(200, 20)
    .setLabel("立方体高度值");
    
  bar.addSlider("boxDepth")
    .setRange(50, 500)
    .setValue(100)
    .setPosition(50, 50+30)
    .setSize(200, 20)
    .setLabel("立方体深度值");
    
  bar.setAutoDraw(false);
}