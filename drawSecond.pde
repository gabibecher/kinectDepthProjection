void drawSecond()
{
  pushMatrix();
  translate(width/20, 0, -500);

  int[] depth = kinect.getRawDepth();

  stroke(#FF1797);
  strokeWeight(2);
  beginShape(POINTS);
  for (int x = 0; x < kinect.width; x+=3) {
    for (int y = 0; y < kinect.height; y+=3) {
    /*  int interval = 0;
      color inter = lerpColor(from, to, interval);
      stroke(inter);
      interval +=.2;*/
      //stroke(lerpColor(palette, x/width, RGB));
      int index = x + y * kinect.width;
      float mapWidth = map(x, 0, kinect.width, 0, width);
      float mapHeight = map(y, 0, kinect.height, 0, height);
      int d = depth[index];
      if(d<depthD)
      {
      vertex(mapWidth, mapHeight, d);
     // println(mapWidth + " " + mapHeight);
      }
    }
  }
  endShape();
  //shape(points);
  popMatrix();
}