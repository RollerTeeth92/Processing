import processing.serial.*;
import controlP5.*;
Serial myPort;
ControlP5 cp5;
String nome="Sensore";
PFont font;
int windowPadding=10;
int sliderWidth=60;
int sliderHeight=20;
int [] sensoriParteSinistra = {6,7,9,20,11,14,16};
// int totaleLatoSinistro = 0;

void setup()
{
  size(500,500);
  background(64,128,255); 
  font = createFont("Calibri", 20);
  textFont(font);
  
  cp5 = new ControlP5(this);
  myPort = new Serial(this, "COM5",9600);
  int posX=windowPadding;
  int posY=windowPadding;
  int posTextX = posX+sliderWidth+10;
  for(int i=0;i<16;i++){
    String nomeS=nome + (i+1);
    if(i==8){
     posY=windowPadding;
     posX+=(500-windowPadding*2)-sliderWidth;
     posTextX = posX-100; 
    }
    cp5.addSlider(nomeS).setPosition(posX, posY).setSize(sliderWidth, sliderHeight).setRange(0,255).setColorForeground(color(#FFA000));
    cp5.getController(nomeS).getCaptionLabel().setVisible(false);
    textAlign(LEFT, TOP);
    text(nomeS, posTextX, posY);
    posY+=(500+sliderHeight-windowPadding*2)/8;

  }
  
}
void draw()
{
  if(myPort.available() > 0)
  {
    String val = myPort.readStringUntil('\n');
    println(val);
    String[]list = split(val,',');
   
    for(int i=0;i<16;i++){
      String nomeS=nome + (i+1);
      int intValue=0;
      try{
        
        intValue=Integer.parseInt(list[i]);
      }
      catch(Exception e){
        return;
      }
      // funzione che cerca il valore i all'interno dell'array
      // cercaValori(i,totaleLatoSinistro);
      cp5.getController(nomeS).setValue(intValue);
      cp5.getController(nomeS).setColorForeground(colorFromValue(intValue));
    }
  }
  // print(totaleLatoSinistro);
}

int colorFromValue(int value)
{
  if (value <= 128)
  {
    return color(255,(value*2)-1,0);
  }
  else 
  {
    return color(255-(value-128)*2,255,0);
  }
}

void cercaValori(int index, int totaleLatoSinistro){
  for(int i=0; i<3; i++)
  {
    if(sensoriParteSinistra[i] == index)
    {
      totaleLatoSinistro += index;
    }
  }
}
