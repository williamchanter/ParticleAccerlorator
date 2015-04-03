class Particleoffshot { //created this before understand inhertance :'(
  PVector location;
  PVector velocity;
  PVector acceleration;
  float momentum;
  float lifespan;

  float speedDir;
  float speeder1;
  float speeder2;
  color pcol;
  
  float rotx;
  float roty;
  float rate = 0.02;

  Particleoffshot(PVector l, float speedDir, float x, float y, float z) {
    acceleration = new PVector(speedDir, speedDir, speedDir);
    velocity = new PVector(x, y, z);
    location = l;
    //acceleration = new PVector(0, 0);
    //velocity = new PVector(x, y, z);
    //location = l;
    //momentum = (velocity.x+velocity.y)*10;
  }

  void run(color pcol, float size) {
    update();
    display(pcol, size);
  }

  // Method to update location
  void update() {
    velocity.add(acceleration);
    location.add(velocity);
  }

  // Method to display
  void display(color pcol, float size) {
    stroke(pcol);
    fill(pcol);
    lights();
    pushMatrix();
    rotateX(rotx);
    rotateY(roty);
    translate(location.x, location.y, location.z);
    sphere(size);
    popMatrix();
    //ellipse(location.x, location.y, size, size);
  }

  boolean isDead() {
    if (location.x > width+10 || location.x < -10 || location.y > height+10 || location.y < -10) {
      return true;
    } else {
      return false;
    }
  }
}



