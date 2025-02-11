void setup()
{
  size(600, 600);
  noLoop();
}

float zMin[] = { -2, -1.25 };
float zMax[] = { 0.5, 1.25 };

float[] zadd(float[] z1, float[] z2)
{
  float[] w = new float[2];
  w[0] = z1[0] + z2[0];
  w[1] = z1[1] + z2[1];
  return w;
}

float[] zmultiply(float[] z1, float[] z2)
{
  float[] w = new float[2];
  w[0] = z1[0] * z2[0] - z1[1] * z2[1];
  w[1] = z1[0] * z2[1] + z1[1] * z2[0];
  return w;
}

float[] zmultiply(float k, float[] z)
{
  float[] w = new float[2];
  return w;  
}

float zlength(float[] z)
{
  return sqrt(z[0] * z[0] + z[1] * z[1]);
}

float[] zcopy(float[] z)
{
  float[] w = new float[2];
  w[0] = z[0];
  w[1] = z[1];
  return w;
}

void mousePressed()
{
  float zoom = 0.25; // 4-fach zoom
  
  float zCenter[] = new float[2];
  float tx = (float)mouseX / (float)width;
  float ty = (float)mouseY / (float)height;
  zCenter[0] = zMin[0] + tx * (zMax[0] - zMin[0]);
  zCenter[1] = zMax[1] + ty * (zMin[1] - zMax[1]);
  float zWidth = zMax[0] - zMin[0];
  float zHeight = zMax[1] - zMin[1];
  zMin[0] = zCenter[0] + zoom * -0.5 * zWidth;
  zMin[1] = zCenter[1] + zoom * -0.5 * zHeight;
  zMax[0] = zCenter[0] + zoom * 0.5 * zWidth;
  zMax[1] = zCenter[1] + zoom * 0.5 * zHeight;
  
  redraw();
}

void draw()
{
  background(255);
  stroke(0);
  

  // for each pixel:
  for(int y = 0; y < height; y++)
  {
    for(int x = 0; x < width; x++)
    {
      float tx = (float)x / (float)width;
      float ty = (float)y / (float)height;
      
      // compute c inside the zMin/zMax range
      float c[] = new float[2];
      c[0] = zMin[0] + tx * (zMax[0] - zMin[0]);
      c[1] = zMax[1] + ty * (zMin[1] - zMax[1]);
      
      // set z = c, n = 0
      float z[] = zcopy(c);
      int n = 0;
      
      // while n < 256 and |z| < 2: compute z = z^2 + c
      while(n < 256 && zlength(z) < 2)
      {
        z = zadd( zmultiply(z, z), c );
        n += 1;
      }
      // afterwards: if n is even: draw a black pixel, otherwise white
      if(n % 2 == 0)
      {
        point(x, y);
      }
    }
  }
  // save("mandelbrot.png");
}
