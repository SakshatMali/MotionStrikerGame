
import processing.serial.*;
import processing.sound.*;

   Serial myPort;        // The serial port
  //int xPos = 1;         // horizontal position of the graph
  //float inByte = 0;
  float inByte1 = 0;
  //float inByte2 = 0;
  float inByte3 = 0;
  
 
ball B;

SoundFile bling;
PImage pic;
PImage sp;
//PImage mp;
PImage pl;

striker LS;
//striker RS;

int LP = 3;
//int RP = 0;

String time = "100";
int t;
int interval = 100;

void setup() {
  size (1700,900);
  bling = new SoundFile(this, "bling.mp3");
 myPort = new Serial(this, Serial.list()[0], 9600);
  myPort.bufferUntil('\n');
 
  B = new ball();
  LS = new striker (true);
 // RS = new striker (false);
  pic = loadImage("bgp.jpg");
  sp = loadImage("single.png");
 // mp = loadImage("multi.png");
 pl = loadImage("player.png");
}




void draw() {
  
 
 /* background (pic);
  image(sp , width/2 - 300 , height/2 - 400);
  image(mp, width/2 -300 , height/2 );
 */
 
  
    
    
  background (pic);
  image(sp,width/2 - 165,height/2 -50);
  image(pl , width/2 +3 , height/2 -50);
  
  
  
   stroke(255);
  line(0,60 , width, 60);
  
  stroke(255);
  line(width/2 , 60, width/2 , height );
  
  
  stroke(255);
  noFill();
  ellipse(width/2, height/2,350,350);
  
  fill(255);
  text(time , width/2 -30 , 50);
   
  
  B.findstrikerLS(LS);
//  B.findstrikerRS(RS);
  LS.show();
 // RS.show();
  LS.addnew();
 // RS.addnew();
  B.differ();
  B.boundry();
  B.show();
  
  //fill(255);
  textSize(50);
  
  fill(227,9,9);
  text(LP , width-100,50);
  text("LIVES LEFT" , width-400 , 50);
  
 // fill(209,22,13);
 // text(RP, width-80,50);
  
  
  fill(37,46,230);
  text("Player I" , 300 , 50 );
  
 // fill(209,22,13);
 // text("Player II" , 1200 ,50 );
  
 t = interval-int(millis()/1000);
    time = nf(t , 3);
    if(t == 0){
      delay(1000);
      background(pic);
      fill(209,22,13);
      textSize(100);
      text ("GAME OVER You WON!!", width/2 -600  , height/2);
    delay(3000);
    exit(); 
    } 
  
  
  
 if (LP < 1 ) {
   delay(1000);
   background(pic);
   fill(37,46,230);
   textSize(100);
   text ("GAME OVER You LOST!!", width/2 -600  , height/2);
   delay(3000);
   exit();
 }
 

  }


/*if (RP > 10 ) {
  delay(1000);
  background(pic);
  fill(209,22,13);
  textSize(100);
  text ("GAME OVER Player II WINS!!" , width/2 -650 , height/2);
  delay(3000);
  exit();
   
   
 }
}
*/

 void serialEvent (Serial myPort) {
    // get the ASCII string:
    String inString = myPort.readStringUntil('\n');

    if (inString != null) {
      // trim off any whitespace:
      inString = trim(inString);
      // convert to an int and map to the screen height:
      String[] val = inString.split("-");
      inByte1 = float(val[0]);
      //inByte2 = float(val[1]);
      inByte3 = float(val[2]);
      println(inByte1);
     // println(inByte2);
      println(inByte3);
      
      inByte1 = map(inByte1, 0, 20, 0, height+100);
      //inByte2 = map(inByte2, 0,20, 0, height+100);
      
      
     
      
      if (inByte3 > 25) {
         background(pic);
         fill(255, 132, 0);
         textSize(100);
         text ("GAME OVER You Have STOPPED" , width/2 - 800 , height/2);
         //delay(5000);
         exit();
         
     }
      
      
      
      
      
    
    }
    
    
  }


 
  
  
  
void keyReleased() {
  LS.move(0);
//  RS.move(0);
}


void keyPressed() {
  
  if (key == 'a') {
    LS.move(-10);
  } else if (key== 'z') {
    LS.move(10);
  }
  
 /* if (key == 'k') {
    RS.move(-10);
  } else if (key== 'm') {
    RS.move(10);
  } */
  
  if (key == 'p') {
    delay(5000);
  }
  



}
