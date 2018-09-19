import meter.*;
Meter m, m2,m3,m4;
void setup()
{
  size(1000,800);
  background(0,0,0);  
  m = new Meter(this,25,50);
  m.setTitleFontSize(20);
  m.setTitleFontName("Arial bold");
  m.setTitle("Sensore 1, Forza (N)");
  String [] scaleLabels = {"0", "64", "128", "255"};
  m.setScaleLabels(scaleLabels);
  m.setScaleFontSize(18);
  m.setScaleFontName("Times new roman");
  m.setScaleFontColor(color(200,30,70));
  m.setDisplayDigitalMeterValue(true);
  m.setArcColor(color(141,113,178));
  m.setArcThickness(15);
  m.setMaxScaleValue(255);
  m.setMinInputSignal(0);
  m.setMaxInputSignal(255);
  m.setNeedleThickness(3);
  int mx = m.getMeterX();
  int my = m.getMeterY();
  int mw = m.getMeterWidth(); 
  int mh = m.getMeterHeight();
  
  m2 = new Meter(this, mx+mw+20, my);
  m2.setTitleFontSize(20);
  m2.setTitleFontName("Arial bold");
  m2.setTitle("Sensore 2, Forza (N)");
  String [] scaleLabels2 = {"0", "64", "128", "255"};
  m2.setScaleLabels(scaleLabels2);
  m2.setScaleFontSize(18);
  m2.setScaleFontName("Times new roman");
  m2.setScaleFontColor(color(200,30,70));
  m2.setDisplayDigitalMeterValue(true);
  m2.setArcColor(color(141,113,178));
  m2.setArcThickness(15);
  m2.setMaxScaleValue(255);
  m2.setMinInputSignal(0);
  m2.setMaxInputSignal(255);
  m2.setNeedleThickness(3);
  
  m3 = new Meter(this, mx, mx+mh+20);
  m3.setTitleFontSize(20);
  m3.setTitleFontName("Arial bold");
  m3.setTitle("Sensore 3, Forza (N)");
  String [] scaleLabels3 = {"0", "64", "128", "255"};
  m3.setScaleLabels(scaleLabels3);
  m3.setScaleFontSize(18);
  m3.setScaleFontName("Times new roman");
  m3.setScaleFontColor(color(200,30,70));
  m3.setDisplayDigitalMeterValue(true);
  m3.setArcColor(color(141,113,178));
  m3.setArcThickness(15);
  m3.setMaxScaleValue(255);
  m3.setMinInputSignal(0);
  m3.setMaxInputSignal(255);
  m3.setNeedleThickness(3);
  
  m4= new Meter(this, mx+mw+20, m3.getMeterY());
  m4.setTitleFontSize(20);
  m4.setTitleFontName("Arial bold");
  m4.setTitle("Sensore 4, Forza (N)");
  String [] scaleLabels4 = {"0", "64", "128", "255"};
  m4.setScaleLabels(scaleLabels4);
  m4.setScaleFontSize(18);
  m4.setScaleFontName("Times new roman");
  m4.setScaleFontColor(color(200,30,70));
  m4.setDisplayDigitalMeterValue(true);
  m4.setArcColor(color(141,113,178));
  m4.setArcThickness(15);
  m4.setMaxScaleValue(255);
  m4.setMinInputSignal(0);
  m4.setMaxInputSignal(255);
  m4.setNeedleThickness(3);
}
void draw()
{
  int value = (int)random(0,255);
  if (value <= 180 && value >= 100)
  {
    m.updateMeter(value);
    m2.updateMeter(value);
    m3.updateMeter(value);
    m4.updateMeter(value);
  }
  
  delay(50);
}
