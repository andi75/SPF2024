void setup() {
  size(800, 400);
  background(255);
  noLoop();
}

float w = 800;
float h = 400;
float d = 20; // Abstand vom Rand
float zx = d;
float zy = d;
float zw = w/2 - 2*d; // halbe Breite - 2*Rand
float zh = h - 2*d;

float za_min = -2;
float za_max = 4;
float zb_min = -1;
float zb_max = 5;

// Dasselbe nochmal für die w-Ebene
float wx = w/2 + d;
float wy = d;
float ww = zw;
float wh = zh;

float wa_min = -3;
float wa_max = 3;
float wb_min = -3;
float wb_max = 3;

float xz(float a)
{
  float t = (a - za_min) / (za_max - za_min);
  return zx + t * zw;
}

float xw(float a)
{
  float t = (a - wa_min) / (wa_max - wa_min);
  return wx + t * ww;
}
float yz(float b)
{
  float t = (b - zb_min) / (zb_max - zb_min);
  return zy + zh - t * zh;
}

float yw(float b)
{
  float t = (b - wb_min) / (wb_max - wb_min);
  return wy + wh - t * ww;
}
  
  
void draw()
{
  // Koordinatenachsen
  // z-Ebene
  line( xz(0), zy, xz(0), zy + zh);
  line(zx, yz(0), zx + zw, yz(0));
  
  // w-Ebene
  line( xw(0), wy, xw(0), wy + wh);
  line(wx, yw(0), wx + ww, yw(0)); 
  
  for(int i = 0; i < 7; i++)
  {
    float a = i - 2;
    // float b = ...;
    
    // rot
    stroke(255, 0, 0);
    line( xz(a), yz(-0.1), xz(a), yz(0.1) );
  }
  
  // schwarz
  stroke(0);
  // z = 1 + 2i
  circle( xz(1), yz(2), 4);
  // z = -1 + i
  circle( xz(-1), yz(1), 4);
  // z = 2 - i
  circle( xz(2), yz(-1), 4);
  
  // w = 2 - 2i
  circle( xw(2), yw(-2), 4 );
  
}
