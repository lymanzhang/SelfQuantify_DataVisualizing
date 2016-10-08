//UI settings

void UI() {
  bar = new ControlP5(this, createFont("微软雅黑", 14));
  bar.addSlider("elliX")
    .setRange(0, width)
    .setValue(300)
    .setPosition(50, 50)
    .setSize(200, 20)
    .setLabel("圆心X值");
  bar.addSlider("elliY")
    .setRange(0, height)
    .setValue(300)
    .setPosition(50, 50+30)
    .setSize(200, 20)
    .setLabel("圆心Y值");
}