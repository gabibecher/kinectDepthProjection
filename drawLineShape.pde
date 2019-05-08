void drawLineShape()
{
  pushMatrix();
  translate(0, 0, -500);

  int[] depth = kinect.getRawDepth();

  stroke(255);
  strokeWeight(2);
    
  beginShape(LINES);
  for (int x = 0; x < kinect.width; x+=10) {
    for (int y = 0; y < kinect.height; y+=10) {
      int index = x + y * kinect.width;
      float mapWidth = map(x, 0, kinect.width, 0, width);
      float mapHeight = map(y, 0, kinect.height, 0, height);
      int d = depth[index];
      if(d<depthD)
      {
      vertex(mapWidth, mapHeight,d);
      }
    }
  }
  endShape();
  //shape(points);
  popMatrix();
}