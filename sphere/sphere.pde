void setup() {
  size(600, 600);
  noLoop();
}

float[] mAlpha(float alpha)
{
  float m[] = new float[9];
  m[0] = cos(alpha);
  m[1] = 0;
  m[2] = sin(alpha);
  m[3] = 0;
  m[4] = 1;
  m[5] = 0;
  m[6] = -sin(alpha);
  m[7] = 0;
  m[8] = cos(alpha);
  
  return m;
}

float[] transform(float[] m, float[] v)
{
  return transform(m, v[0], v[1], v[2]);
}

float[] transform(float[] m, float x, float y, float z)
{
  float[] v = new float[3];
  v[0] = m[0] * x + m[3] * y + m[6] * z;
  v[1] = m[1] * x + m[4] * y + m[7] * z;
  v[2] = m[2] * x + m[5] * y + m[8] * z;
  return v;
}
  
float alpha = 0; // PI / 12;
float zoom = 60;
float r = 2;

boolean isHittingSphere = false;
float[] vHit;

void drawPoint(float[] v, float weight)
{
  drawPoint(v[0], v[1], v[2], weight);
}

void drawPoint(float x, float y, float z, float weight)
{
  if(x < 0) return;
  
  float px = width / 2 + y * zoom;
  float py = height / 2 - z * zoom;
  
  strokeWeight(weight);
  point(px, py);
}

void mousePressed()
{
   float y = (mouseX - width / 2) / zoom;
   float z = - (mouseY - height / 2) / zoom;
   float x2 = r*r - y*y - z*z;
   if(x2 >= 0)
   {
     vHit = transform(mAlpha(-alpha), sqrt(x2), y, z);
     
     isHittingSphere = true;
     redraw();
   }
   else
   {
     isHittingSphere = false;
   }
}

boolean isLooping = true;

void keyPressed()
{
  if (isLooping) {
    noLoop();
    isLooping = false;
  } else {
    loop();
    isLooping = true;
  }
}

void draw()
{
  alpha += 0.01 * PI;
  background(255);
  
  for(int latitude = -90; latitude < 90; latitude += 5)
  {
    for(int longitude = 0; longitude < 360; longitude += 5)
    {
      float latR = latitude / 360.0 * 2 * PI; // latitude im Bogenmass
      float longR = longitude / 360.0 * 2 * PI;
      float rb = r * cos(latR);
      float x = rb * cos(longR);
      float y = rb * sin(longR);
      float z = r * sin(latR);
      
      float v[] = transform(mAlpha(alpha), x, y, z);
      stroke(0, 0, 255);
      drawPoint(v, 2.0);
    }
  }
  
  if(isHittingSphere)
  {
    stroke(255, 0, 0);
    float[] v = transform(mAlpha(alpha), vHit[0], vHit[1], vHit[2]);

    drawPoint(v, 6.0);
  }
}
