void setup()
{
  size(500, 500);
  frameRate(60);
  // no animation
}

float x(float mx) {
  float xMin = -7;
  float xMax = 7;
  float t = (mx - xMin) / (xMax - xMin);
  return t * width;
}

float y(float my) {
  float yMin = -7;
  float yMax = 7;
  float t = (my - yMin) / (yMax - yMin);
  return height - t * height;
}

float[] transform3v(float[] m, float[] p)
{
  float[] result = new float[3];
  for(int row = 0; row < 3; row++)
  {
    float sum = 0;
    for(int k = 0; k < 3; k++)
    {
      sum += ...;
    }
    result[row] = sum;
  }
  return result;
}

float[] transform3m(float[] m1, float[] m2)
{
  float[] result = new float[9];
  for(int row = 0; row < 3; row++)
  {
    for(int col = 0; col < 3; col++)
    {
      float sum = 0;
      for(int k = 0; k < 3; k++)
      {
        sum += m1[...] * m2[...];
      }
      result[...] = sum;
    }
  }   
  return result;
}

void drawLineLoop(float[][] points)
{
  for(int i = 0; i < points.length; i++)
  {
    int j = (i + 1) % points.length;
    line(
      x(points[i][0]), y(points[i][1]),
      x(points[j][0]), y(points[j][1])
    );
  }
}

void draw()
{
  background(255);

  float am1[] = {
    1, 0, 0,
    0, 1, 0,
    2, 2, 1
  };
  
  float alpha = 90.0 * PI / 180.0; // 90 Grad im Bogenmass
  
  float am2[] = {
    cos(alpha), sin(alpha), 0,
    -sin(alpha), cos(alpha), 0,
    0, 0, 1
  };
  float am3[] = {
    1, 0, 0,
    0, 1, 0,
    -2, -2, 1
  };
    
  float am[] = transform3m(am1, transform3m(am2, am3));

  float points[][] = {
    { 2, 0, 1 },
    { 0, 1, 1 },
    { -2, -2, 1 }
  };
  
  printArray(am);
  println();
  
  stroke(0);
  line( x(-6.5), y(0), x(6.5), y(0) );
  line( x(0), y(-6.5), x(0), y(6.5) );
  
  circle( x(2), y(2), 3 );

  stroke(255, 0, 0);
  drawLineLoop(points);
  
  for(int i = 0; i < points.length; i++)
  {
    points[i] = transform3v(am, points[i]);
  }
  
  stroke(0, 127, 0);
  drawLineLoop(points);
}

  
  
