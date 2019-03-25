
import processing.serial.*;

Serial myport;
int wid = 500;
int hei = 500;

void setup(){
  size(500,500);
  frameRate(100);
  smooth();
  myport = new Serial(this,"COM23",9600);
  
}

ArrayList<Float> xArray = new ArrayList<Float>();
ArrayList<Float> yArray = new ArrayList<Float>();


void draw(){
  
  background(255,255,255);
  stroke(0,0,0);
  strokeWeight(2);
  line(wid/2,0,wid/2,hei);
  line(0,hei/2,wid,hei/2);
  
  if(0<myport.available()){
    String val = myport.readString();
    String [] array = split(val,",");
    
    float x = float(array[0])*10;
    float y = float(array[1])*10;
    
    if(!Float.isNaN(x) && !Float.isNaN(y) ){
      
      
      if(x<0){
        x = width/2 - abs(x);
      }else{
        x = width/2 + x;
      }
      
      if(y<0){
        y = height/2 + abs(y);
      }else{
        y = height/2 - y;
      }
      
      xArray.add(x);
      yArray.add(y);
      
      
      
      
      
      print("non pre"+str(x)+","+str(y)+"\n");
    }
    
    
    for(int i=1;i<xArray.size();++i){
        stroke(0,0,0);
        line(xArray.get(i-1),yArray.get(i-1),xArray.get(i),yArray.get(i));
      }
    
    
   
    
  }
  
}
