class ParticleSystem {
  ArrayList<Particle> particles;
  PVector origin;
  PVector hidden = new PVector(0,0);

  ParticleSystem(PVector location) {
    origin = location.get();
    particles = new ArrayList<Particle>();
  }

  void addParticle(float speedDir, float speeder1, float speeder2, float ang1, float ang2) {
    particles.add(new Particle(origin, speedDir, speeder1, speeder2, ang1, ang2));
  }

  void run(color pcol, float size) {
    for (int i = particles.size ()-1; i >= 0; i--) {
      Particle p = particles.get(i);
      p.run(pcol, size);
      if (p.isDead()) {
        particles.remove(i);
      }
    }
  }
  
  void detectBeam(ParticleSystem _p2)
  {
    for(int i=0; i<particles.size(); i++)
    {
      Particle _particle = particles.get(i);
      if(_particle.detect(_p2.particles)) {
        tempPart.hidden = _particle.location;
        particles.remove(i);
        //background(255,0,0);
      } else {
        //background(0,255,0);
        //tempPart.remove(i);
      }
    }
  }
  
}

//  void collision() {
//    if (dist(shipList.shipPosX-10, shipList.shipPosY-10, ballPosX-25, ballPosY-25) < 40) {
//      println("colide");
//  }
