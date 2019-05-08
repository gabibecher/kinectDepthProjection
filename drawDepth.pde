void drawDepth()
{
  pushMatrix();
  translate(0, 0, -500);

  int[] depth = kinect.getRawDepth();

  stroke(255);
  strokeWeight(2);
    
  color from = #CA02F7;
  color to = #FEFF05;
 
  
  beginShape(POINTS);
  for (int x = 0; x < kinect.width; x+=2) {
    for (int y = 0; y < kinect.height; y+=2) {
      int index = x + y * kinect.width;
      float mapWidth = map(x, 0, kinect.width, 0, width);
      float mapHeight = map(y, 0, kinect.height, 0, height);
      int d = depth[index];
      
      float t = map(d, 800, 850, 0, 1);
      int c = lerpColor(from, to, t);
      stroke(c);
      if(d<depthD)
      {
      vertex(mapWidth, mapHeight, d);
      }
    }
    }
  endShape();
  //shape(points);
  popMatrix();
}