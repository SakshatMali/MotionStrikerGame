
class striker {
  float x;
  float y = height/2;
  float w = 20;
  float h = 200;
  
  float ynew;
  
  striker(boolean left) {
    if (left) {
      x=w;
      
     
   // } else {
    //  x = width -w;
      
    } 
  }
  
  void addnew() {
    
    y += ynew;
    
    LS.y = inByte1;
    
   // RS.y = inByte2;
    
    y = constrain (y,160,height-h/2);
  }
  
  void move (float steps) {
     ynew = steps;
  }
  
  void show () {
    
    rectMode (CENTER);
    fill(117 , 66 , 8 );
    rect (x,y,w,h);
    
  }
}
