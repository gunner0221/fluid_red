
Fluid fluid;

float t = 0;
int pick;

void settings() {
  size(Nx*SCALE, Ny*SCALE);
}

void setup() {
  fluid = new Fluid(0.5, 0.0, 0.00001);
}

void mouseDragged(){
  fluid.addDensity((mouseX/SCALE),(mouseY/SCALE),200);
  fluid.addColor((mouseX/SCALE),(mouseY/SCALE),pick);
  float amtX = mouseX - pmouseX;
  float amtY = mouseY - pmouseY;
  fluid.addVelocity((mouseX/SCALE),(mouseY/SCALE),amtX,amtY);
}

void draw() {
  background(0);

  fluid.step();
  
  for (int i=0; i<Nx; i++) {
    for (int j=0; j<Ny; j++) {
      float x = i*SCALE;
      float y = j*SCALE;
      int index = i + Nx * j;
      float d = fluid.density[index];
      float r = fluid.r[index];
      float g = fluid.g[index];
      float b = fluid.b[index];
      noStroke();
      fill(r, g, b);
      square(x, y, SCALE);
    }
  }
  
}

void mousePressed(){
  pick = floor(random(3));
}
