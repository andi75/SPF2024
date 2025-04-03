size(600, 600);
background(255);

float r = 250;

int n = 5;
float phi = 0;
float dphi = 2 * (360 / n) * PI / 180;

for(int i = 0; i < n; i++) {
  float x1 = r * cos(phi);
  float y1 = r * sin(phi);
  float x2 = r * cos(phi + dphi);
  float y2 = r * sin(phi + dphi);
  line(width / 2 + x1, height / 2 - y1, width / 2 + x2, height / 2 - y2);  
  phi += dphi;
}
