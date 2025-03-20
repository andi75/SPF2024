void setup()
{
  size(500, 500);
  frameRate(60);
  // no animation
  noLoop();
}

float x(float mx) {
  float xMin = -4;
  float xMax = 4;
  float t = (mx - xMin) / (xMax - xMin);
  return t * width;
}

float y(float my) {
  float yMin = -4;
  float yMax = 4;
  float t = (my - yMin) / (yMax - yMin);
  return height - t * height;
}

float[] transform(float[] m, float[] p)
{
  float[] result = new float[2];
  result[0] = m[0] * p[0] + m[2] * p[1];
  result[1] = m[1] * p[0] + m[3] * p[1];
  return result;
}  

// animation
// float t = 0;

void draw()
{
  background(255);

  float a[] = { 2, 0 };
  float b[] = { 0, 1 };
  float c[] = { -2, -2 };
  
  stroke(0);
  line( x(-3.5), y(0), x(3.5), y(0) );
  line( x(0), y(-3.5), x(0), y(3.5) );
  
  stroke(255, 0, 0);
  line( x(a[0]), y(a[1]), x(b[0]), y(b[1]) );
  line( x(b[0]), y(b[1]), x(c[0]), y(c[1]) );
  line( x(c[0]), y(c[1]), x(a[0]), y(a[1]) );
  
  // problem2a: rotate by 60 degrees
  float alpha = 60 * PI / 180;
  float[] m = { cos(alpha), sin(alpha), -sin(alpha), cos(alpha) };
  // problem2b: scale by 0.5
  // float k = 0.5
  // float[] m = ....
  
  a = transform(m, a);
  b = transform(m, b);
  c = transform(m, c);
  
  stroke(0, 127, 0);
  line( x(a[0]), y(a[1]), x(b[0]), y(b[1]) );
  line( x(b[0]), y(b[1]), x(c[0]), y(c[1]) );
  line( x(c[0]), y(c[1]), x(a[0]), y(a[1]) );
  
  // animation
  // t += 1.5;
}

  
  
