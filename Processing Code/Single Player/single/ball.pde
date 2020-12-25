
class ball {
  float x = width/2 ;
  float y = height/2 ;
  float xv ;
  float yv ;
  float r = 20;
  
  ball() {
   reset();
  }
  
  
  void findstrikerLS(striker p) {
    if (y < p.y  + p.h/2 && y > p.y - p.h/2 && x-r < p.x + p.w/2) {
      if ( x > p.x + r) {
        //float diff = y - (p.y - p.h/2);
        //float rad = radians(45);
        //float angle = map(diff , 0 , p.h, -rad , rad);
        //xv = 10 * cos(angle);
        //yv = 10 * sin(angle);
        //x = p.x + p.w/2 + r;
          
      xv *= -1 ;
      }
    }
  }
      
/*  void findstrikerRS(striker p) {
    if (y < p.y  + p.h/2 && y > p.y - p.h/2 && x + r > p.x - p.w/2) {
      if (x < p.x - r) {
        //float diff = y - (p.y - p.h/2);
        //float rad = radians(135);
        //float angle = map(diff , 0 , p.h, -rad , rad);
        //xv = 10 * cos(angle);
        //yv = 10 * sin(angle);
        //x = p.x - p.w/2 - r;
        
      xv *= -1 ;
      }
     }
  }
    */
  
  void reset() {
    x= width /2 ;
    y = height /2;
    
    float angle = random(TWO_PI/6);
    xv = 10 * cos(angle);
    yv = 10 * sin(angle);
    
    if (random(1) < 0.5) {
      xv *= -1;
    }
  }
  
  void differ() {
    x += xv;
    y += yv;
  }
  
  void boundry() {
    if (y<80  || y > height-r) {
      yv *= -1;
    }
    if (x + r < 0 ) {
      bling.play();
      LP--;
      
      
      reset();
      
    }
    if ( x + r > width) {
      xv *= -1 ;
      
    }
      
   /* if (x + r < 0 ) {
      bling.play();
      RP++;
      
      
      reset();
      
    }
      */
      
  }
  
  void show() {
    fill(194,0,252);
    ellipse(x,y,r*2,r*2);
  }
}
