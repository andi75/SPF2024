void setup()
{
  size(600, 600);
  noLoop();
}

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

float zMin[] = { -2, -2 };
float zMax[] = { 2, 2 };

float cJulia[] = { 0, 0.6 };

void mouseMoved()
{
  float tx = (float)(mouseX) / (float)width;
  float ty = (float)(mouseY) / (float)height;
  
  cJulia[0] = zMin[0] + tx * (zMax[0] - zMin[0]);
  cJulia[1] = zMax[1] + ty * (zMin[1] - zMax[1]);
  
  redraw();
}

void drawFractal(int xOrig, int yOrig, int w, int h, boolean isJulia)
{
  if(w < width) {
    fill(255);
    stroke(255);
    rect(xOrig, yOrig, w-1, h-1);
    stroke(255, 0, 0);
  }
  else
  {
    stroke(0);
  }
    
  // for each pixel:
  for(int y = 0; y < h; y++)
  {
    for(int x = 0; x < w; x++)
    {
      float tx = (float)(x) / (float)w;
      float ty = (float)(y) / (float)h;
      
      // compute c inside the zMin/zMax range
      float z[] = new float[2];
      z[0] = zMin[0] + tx * (zMax[0] - zMin[0]);
      z[1] = zMax[1] + ty * (zMin[1] - zMax[1]);
      
      // set z = c, n = 0
      float c[];
      if(!isJulia) { c = zcopy(z); }
      else { c = cJulia; }
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
        point(x + xOrig, y + yOrig);
      }
    }
  }

}

void draw()
{
  if(frameCount == 1)
  {
    background(255);
    drawFractal(0, 0, width, height, false);
  }
  drawFractal(50, 450, 100, 100, true);
}
