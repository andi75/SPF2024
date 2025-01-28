size(600, 600);

float mx = 300;
float my = 300;
float r0 = 20;

for(int i = 0; i < 14 * 360; i++)
{
  float phi = i / 360.0 * 2*PI;
  float r = r0 / (2*PI) * phi + r0;
  float dx = r * cos(phi);
  float dy = r * sin(phi);
  float px = mx + dx;
  float py = my - dy;
  circle(px, py, 5); // Kreis mit Radius 5 an der Stelle px, py
}
