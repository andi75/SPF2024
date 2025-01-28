size(600, 600);
background(255);

float w = 600;
float h = 600;

float xMin = -2;
float xMax = 4;

float yMin = -2;
float yMax = 4;

float n = 100;

float x = -2;
float dx = 0.05;

while(x <= 4)
{
  // Parabel
  float y = 0.5 * (x + 0.2) * (x - 2);
  
  // sx, sy: Bildschirmkoordinaten
  float sx = w / 6 * x + w / 3; 
  float sy = -h / 6 * y + 2 * h / 3;
  
  circle(sx, sy, 2);
  
  x += dx;
}

// Koordinatensystem
line(0, 2*h/3, w, 2*h/3);
line(w/3, 0, w/3, h);
