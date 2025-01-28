size(640, 640);

float mx = 320;
float my = 320;
float r0 = 10;
int n = 5;

for(int i = 0; i < n * 360; i++)
{
  float phi = i / 360.0 * 2*PI;
  float r = r0 * pow(2, phi/(2*PI));
  float dx = r * cos(phi);
  float dy = r * sin(phi);
  float px = mx + dx;
  float py = my - dy;
  circle(px, py, 5); // Kreis mit Radius 5 an der Stelle px, py
}
