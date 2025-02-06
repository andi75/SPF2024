void setup()
{
  size(600, 600);
}
int width = 600;
int height = 600;

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

void draw()
{
  float zMin[] = { -2, -1.25 };
  float zMax[] = { 0.5, 1.25 };
  // for each pixel:
  // compute c inside the zMin/zMax range
  // set z = c, n = 0
  // while n < 256 and |z| < 2: compute z = z^2 + c
  // afterwards: if n is even: draw a black pixel, otherwise white
}
