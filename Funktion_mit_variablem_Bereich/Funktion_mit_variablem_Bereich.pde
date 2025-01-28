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
  
  // sx, sy: Bildschirmkoordinate
  float sx = w / (xMax - xMin) * x + -w * xMin / (xMax - xMin); 
  float sy = -h / (yMax - yMin) * y + h * yMax / (yMax - yMin); 
  
  circle(sx, sy, 2);
  
  x += dx;
}

// Koordinatensystem
line(0, h * yMax / (yMax - yMin), w, h * yMax / (yMax - yMin));
line(-w * xMin / (xMax - xMin), 0, -w * xMin / (xMax - xMin), h);
