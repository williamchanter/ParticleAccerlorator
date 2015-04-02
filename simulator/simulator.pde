import controlP5.*;
import processing.sound.*;


SoundFile file;
ControlP5 cp5;
ParticleSystem pl;
ParticleSystem pr;

ParticleSystem tempPart;

color uicol = color(200, 200, 200);
float acc1 = 2;
float acc2 = 2;

//Collision Controls
float speed1;
float speed2;
float angtop;
float angbot;
float radio1;
float radio2;

//Fusion Varibles
float roomTemp;
float atomicMassTOP;
float atomicMassBOT;
float electronTOP;
float electronBOT;
float neutronTOP;
float neutronBOT;
float protonTOP;
float protonBOT;

int slow = 1;

boolean cameraSpin, collide, inpact;

PVector v;

char letter;

void setup() {

  smooth(8);

  size(840, 640, P3D);

  pl = new ParticleSystem(new PVector(0, 130));
  pr = new ParticleSystem(new PVector(650, 300));
  tempPart = new ParticleSystem(new PVector(0, 0, 0));

  cp5 = new ControlP5(this);
  cp5.setColorForeground(0x00000000);
  cp5.setColorBackground(0xffffffff);

  cp5.addSlider("acc1")
    .setPosition(150, 430)
      .setSize(20, 160)
        .setRange(0, 1)
          .setValue(0.9)
            .setColorCaptionLabel(color(20, 20, 200));
  cp5.addSlider("acc2")
    .setPosition(390, 430)
      .setSize(20, 160)
        .setRange(0, 1)
          .setValue(0.9)
            .setColorCaptionLabel(color(20, 20, 200));

  cp5.addSlider("speed1")
    .setPosition(210, 430)
      .setSize(20, 160)
        .setRange(0, 10)
          .setValue(8)
            .setColorCaptionLabel(color(20, 20, 200));
  cp5.addSlider("speed2")
    .setPosition(450, 430)
      .setSize(20, 160)
        .setRange(0, 10)
          .setValue(8)
            .setColorCaptionLabel(color(20, 20, 200));

  cp5.addSlider("angtop")
    .setPosition(240, 430)  
      .setSize(20, 160)
        .setRange(0, 10)
          .setValue(2)
            .setColorCaptionLabel(color(20, 20, 200));
  cp5.addSlider("angbot")
    .setPosition(480, 430)
      .setSize(20, 160)
        .setRange(0, -10)
          .setValue(-6.81)
            .setColorCaptionLabel(color(20, 20, 200));

  cp5.addSlider("radio1")
    .setPosition(180, 430)
      .setSize(20, 160)
        .setRange(0, 100)
          .setValue(0.9)
            .setColorCaptionLabel(color(20, 20, 200));
  cp5.addSlider("radio2")
    .setPosition(420, 430)        
      .setSize(20, 160)
        .setRange(0, 100)
          .setValue(0.9)
            .setColorCaptionLabel(color(20, 20, 200));

  cp5.addSlider("atomicMassTOP")
    .setPosition(270, 430)  
      .setSize(20, 160)
        .setRange(0, 300)
          .setValue(2)
            .setColorCaptionLabel(color(20, 20, 200));
  cp5.addSlider("atomicMassBOT")
    .setPosition(510, 430)
      .setSize(20, 160)
        .setRange(0, 300)
          .setValue(-6.81)
            .setColorCaptionLabel(color(20, 20, 200));
  cp5.addSlider("protonsTOP")
    .setPosition(300, 430)  
      .setSize(20, 160)
        .setRange(0, 200)
          .setValue(2)
            .setColorCaptionLabel(color(20, 20, 200));
  cp5.addSlider("protonsBOT")
    .setPosition(540, 430)
      .setSize(20, 160)
        .setRange(0, 200)
          .setValue(-6.81)
            .setColorCaptionLabel(color(20, 20, 200));
  cp5.addSlider("electronTOP")
    .setPosition(330, 430)  
      .setSize(20, 160)
        .setRange(0, 200)
          .setValue(2)
            .setColorCaptionLabel(color(20, 20, 200));
  cp5.addSlider("electronBOT")
    .setPosition(570, 430)
      .setSize(20, 160)
        .setRange(0, 200)
          .setValue(-6.81)
            .setColorCaptionLabel(color(20, 20, 200));
  cp5.addSlider("neutronTOP")
    .setPosition(120, 430)  
      .setSize(20, 160)
        .setRange(0, 200)
          .setValue(2)
            .setColorCaptionLabel(color(20, 20, 200));
  cp5.addSlider("neutronBOT")
    .setPosition(600, 430)
      .setSize(20, 160)
        .setRange(0, 200)
          .setValue(-6.81)
            .setColorCaptionLabel(color(20, 20, 200));

  cp5.addSlider("roomTemp")
    .setPosition(40, 430)        
      .setSize(20, 160)
        .setRange(0, 6000)
          .setValue(74)
            .setColorCaptionLabel(color(20, 20, 200));
}

void draw() {

  colorMode(HSB, 100);
  background(0, roomTemp/100+20, 100);
  colorMode(RGB, 255);

<<<<<<< HEAD
  
=======
  switch(letter) { // cases for the game, these are the heart of the game
  case 'A': 
>>>>>>> 8b284f28131c6859428ee5fcb91ac084367633fa
    pushMatrix();
    beginCamera();
    if (cameraSpin) {
      camera(mouseX, mouseY, 120.0, width/2, height/2, -10, 0.0, 1.0, 0.0);
    }
    translate(0, 0, -30);
    if (frameCount%slow==0)
      pl.addParticle(acc1, speed1, speed1+0.2, angtop, angtop+0);
    pl.run(color(74, 82, 231), 20);

    if (frameCount%slow==0)
      pr.addParticle(-acc2, -speed2, -speed2+0.2, angbot, angbot+0);
    pr.run(color(255, 234, 0), 20);

    pr.detectBeam(pl);

    if (frameCount%10==0)
      v = PVector.random3D();
    tempPart.addParticleOff(0, random(-10, 10), random(-10, 10), random(-10, 10));
    tempPart.runOff(color(0, 255, 0), 8);
    endCamera();
    popMatrix();

    layout(40, 40, 40, 240, uicol);
    disInfo();
    conPannel();
    break;
  case 'B':


    break;
  }
}

  void layout(float top, float bottom, float left, float right, color uiback) {
    noLights();
    fill(uiback);
    noStroke();
    rect(0, 0, left, 400);
    rect(0, 0, 640, top);
    rect(840-right, 0, right, 640);
    rect(0, 400, 640, bottom);
    rect(0, 400, 640, 240);
  }

  void conPannel() {

    fill(121, 203, 85);
    rect(380, 420, 250, 180);
    fill(216, 106, 240);
    rect(110, 420, 250, 180);
  }

  void disInfo() {

    text("Particle Speeds: " + acc1, 50, 60);
    text("Top Particle Speeds: " + acc2, 50, 80);

    text("Top Particle Angle: " + angtop, 50, 100);
    text("Bottom Particle Angle: " + angbot, 50, 120);
  }

  void mouseDragged() {
    cameraSpin = true;
  }
  void mouseReleased() {
    cameraSpin = false;
  }


  //void colide() {
  //  print(pr.location.y);
  //}

