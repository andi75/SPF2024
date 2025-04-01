void setup()
{
  size(500, 500);
  frameRate(60);
  // no animation
  // noLoop();
  background(255);
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
      sum += m[row + 3 * k] * p[k];
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
        sum += m1[row + 3 * k] * m2[k + 3 * col];
      }
      result[row + 3 * col] = sum;
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

float t = 0;

void keyPressed()
{
  noLoop();
}

void draw()
{
  // background(255);
  
  float alpha = (720.0 * t) * PI / 180.0; // 90 Grad im Bogenmass
  float k = 0.5 + 0.5 * cos(t * (2 * PI) );
  float tx = 4 * cos(t / 5 * 2 * PI);
  float ty = 4 * sin(t / 5 * 2 * PI);
  
  float amRotate[] = {
    cos(alpha), sin(alpha), 0,
    -sin(alpha), cos(alpha), 0,
    0, 0, 1
  };
  float amTranslate[] = {
    1, 0, 0,
    0, 1, 0,
   tx, ty, 1
  };
  float amScale[] = {
    k, 0, 0,
    0, k, 0,
    0, 0, 1
  };
    
  float am[] = transform3m(amTranslate, transform3m(amRotate, amScale));

  // arrow shape
  float points[][] = {
    { 0, 1, 1 },
    { -1, -1, 1 },
    { 0, 0, 1 },
    { 1, -1, 1 }
  };
  
  stroke(0);
  line( x(-6.5), y(0), x(6.5), y(0) );
  line( x(0), y(-6.5), x(0), y(6.5) );
  
  stroke(255, 0, 0);
  drawLineLoop(points);
  
  for(int i = 0; i < points.length; i++)
  {
    points[i] = transform3v(am, points[i]);
  }
  
  // change colors as well
  float tCol = (t - floor(t));
  float col = (1 - tCol) * 64 + tCol * 191;
  stroke(0, col, 0);
  
  drawLineLoop(points);
  
  t += 0.01666666;
}

  
  
