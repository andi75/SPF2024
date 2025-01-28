size(600, 600);
background(255);

float w = 600;
float h = 600;

float xMin = -2;
float xMax = 4;

float yMin = -2;
float yMax = 4;

float n = 100;

float x = xMin;
float dx = (xMax - xMin) / n;

while(x <= xMax)
{
  float y = 0.5 * (x + 0.2) * (x - 2);
  // Parameter tx, ty aus x und y berechnen
  float tx = (x - xMin) / (xMax - xMin);
  float ty = (y - yMin) / (yMax - yMin);
  
  // sx, sy: Bildschirmkoordinaten
  float sx = 0 + tx * (w - 0); 
  float sy = h + ty * (0 - h); 
  
  circle(sx, sy, 2);
  
  x += dx;
}

// Koordinatensystem
float tx0 = (0 - xMin) / (xMax - xMin);
float ty0 = (0 - yMin) / (yMax - yMin);
float x0 = 0 + tx0 * (w - 0);
float y0 = h + ty0 * (0 - h);
line(x0, 0, x0, h);
line(0, y0, w, y0);
