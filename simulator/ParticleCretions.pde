class Particleoffshot {
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

  Particleoffshot(PVector l, float speedDir, float speeder1, float speeder2, float ang1, float ang2) {
    acceleration = new PVector(speedDir, 0);
    velocity = new PVector(random(speeder1, speeder2), random(ang1, ang2));
    location = l.get();
    momentum = (velocity.x+velocity.y)*10;
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
    translate(location.x, location.y, 0);
    sphere(size);
    popMatrix();
    //ellipse(location.x, location.y, size, size);
  }
  
    boolean detect(ArrayList<Particle> _p2) {
    for (int i = 0; i < _p2.size(); i++) {  
      Particle _particle1 = _p2.get(i);
      if(
      location.x < _particle1.location.x+10 && 
      location.x > _particle1.location.x-10 && 
      location.y < _particle1.location.y+10 && 
      location.y > _particle1.location.y-10
      ){
        _p2.remove(i);
        //background(255,0,0);
        return true;
      } else {
        
      }
    }
      return false;
    }

  boolean isDead() {
    if (location.x > width+10 || location.x < -10 || location.y > height+10 || location.y < -10) {
      return true;
    } else {
      return false;
    }
  }
}
