class ParticleSystem {
  ArrayList<Particle> particles;
  ArrayList<Particleoffshot> particlesoff;

  PVector origin;
  PVector hidden = new PVector(0, 0);
  boolean colides;

  float angTOP, angBOT, radTOP, radBOT, speTOP, speBOT, accTOP, accBOT;

  float a;

  ParticleSystem(PVector location) {
    origin = location;
    colides = false;
    particles = new ArrayList<Particle>();
    particlesoff = new ArrayList<Particleoffshot>();
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

  void addParticleOff(float speedDir, float x, float y, float z) {
    particlesoff.add(new Particleoffshot(origin, speedDir, x, y, z));
  }

  void runOff(color pcol, float size) {
    for (int i = particlesoff.size ()-1; i >= 0; i--) {
      Particleoffshot p = particlesoff.get(i);
      p.run(pcol, size);
      if (p.isDead()) {
        particlesoff.remove(i);
      }
    }
  }

  void detectBeam(ParticleSystem _p2)
  {
    angTOP = angtop;
    angBOT = angbot;
    radTOP = radio1;
    radBOT = radio2;
    speTOP = speed1;
    speBOT = speed2;
    println(angTOP);
    for (int i=0; i<particles.size (); i++) {
      Particle _particle = particles.get(i);
      if (_particle.detect(_p2.particles)) {
        tempPart.origin = _particle.location;
        colides = true;
        fusion();
        particles.remove(i);
        file = new SoundFile(this, "ping.mp3");
        file.play();
      } else {
        colides = false;
      }
    }
  }
  void fusion() {
    if (atomicMassTOP + atomicMassBOT == 223 && electronTOP + electronBOT == 87 && neutronTOP + neutronBOT == 137 && protonTOP + protonBOT == 87 && roomTemp == 2896) {
      println("Francium");
    }
  }
}

//  void collision() {
//    if (dist(shipList.shipPosX-10, shipList.shipPosY-10, ballPosX-25, ballPosY-25) < 40) {
//      println("colide");
//  }

