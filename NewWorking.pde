import org.openkinect.processing.*; 

Kinect kinect;

//color from = #E5568A;
//color to = #006AFA;

float angle;

int depthD = 900;

color randColor = color(random(255), random(255), random(255));

void setup() 
{
  //size(600, 600, P3D);
  fullScreen(P3D);
  kinect = new Kinect(this);
  kinect.initDepth();
  kinect.enableMirror(true);
  angle = kinect.getTilt();
  //findPoints();
}

void draw() 
{
  background(0);
  float period = 40; //seconds
  float time = millis()/1000.0f % period;
  float index = map(time,0,period,0,1);

  if(index<.5)
  {
   // drawLineShape();
    drawDepth();
  }
  else 
  {
    drawNormal(255);
    drawSecond();
  }
  //else if(index>.5 && index<.75)
 // {
    //drawLineShape();
 // }
 
  
 // text(index, 100,100);
 // drawNormal();
 // drawSecond();
 // drawLineShape();
 //drawDepth();

}

void keyPressed() 
{
    if (keyCode == UP) {
      angle++;
    } else if (keyCode == DOWN) {
      angle--;
    }
    angle = constrain(angle, 0, 30);
    kinect.setTilt(angle);
}