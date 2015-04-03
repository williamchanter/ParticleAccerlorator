import controlP5.*;

import ddf.minim.*; // Liabary tot contorl music playback
Minim minim;
AudioPlayer player;

ControlP5 cp5;

ParticleSystem pl;
ParticleSystem pr;

ParticleSystem tempPart;

color uicol = color(200, 200, 200);
float acc1 = 2;
float acc2 = 2;
float counter = 0;

//Collision Controls
float speed1;
float speed2;
float angtop;
float angbot;

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
float radio1;
float radio2;

int slow = 1;

boolean cameraSpin, collide, inpact;
PImage UI;

PVector v;

char letter;

void setup() {

  smooth(8);

  size(670, 640, P3D);

  UI = loadImage("UI.png"); 

  minim = new Minim (this); // call and load and play the sound file using minim classes
  player = minim.loadFile ("ping.mp3");

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
    .setPosition(70, 430)        
      .setSize(10, 160)
        .setRange(0, 6000)
          .setValue(3000)
            .setColorCaptionLabel(color(20, 20, 200));
  
  cp5.getController("roomTemp").setCaptionLabel("T");
  cp5.getController("acc1").setCaptionLabel("A");
  cp5.getController("acc2").setCaptionLabel("A");
  cp5.getController("speed1").setCaptionLabel("S");
  cp5.getController("speed2").setCaptionLabel("S");
  cp5.getController("angtop").setCaptionLabel("a");
  cp5.getController("angbot").setCaptionLabel("a");
  cp5.getController("radio1").setCaptionLabel("R");
  cp5.getController("radio2").setCaptionLabel("R");
  cp5.getController("atomicMassTOP").setCaptionLabel("M");
  cp5.getController("atomicMassBOT").setCaptionLabel("M");
  cp5.getController("protonsTOP").setCaptionLabel("P");
  cp5.getController("protonsBOT").setCaptionLabel("P");
  cp5.getController("electronTOP").setCaptionLabel("E");
  cp5.getController("electronBOT").setCaptionLabel("E");
  cp5.getController("neutronTOP").setCaptionLabel("N");
  cp5.getController("neutronBOT").setCaptionLabel("N");
  
  style("roomTemp");
  style("acc1");
  style("acc2");
  style("speed1");
  style("speed2");
  style("angtop");
  style("angbot");
  style("radio1");
  style("radio2");
  style("atomicMassTOP");
  style("atomicMassBOT");
  style("protonsTOP");
  style("protonsBOT");
  style("electronTOP");
  style("electronBOT");
  style("neutronTOP");
  style("neutronBOT");
  
}

void draw() {

  colorMode(HSB, 100);
  background(0, roomTemp/100+20, 100);
  colorMode(RGB, 255);

  letter = 'A';

  switch(letter) { // cases for the game, these are the heart of the game
  case 'A': 
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
  image(UI, 0, 0, 670, 640); //display the image taken from the snapshot
  led();
  //fill(uiback);
  //noStroke();
  //rect(0, 0, left, 400);
  //rect(0, 0, 640, top);
  //rect(870-right, 0, right, 640);
  //rect(0, 400, 640, bottom);
  //rect(0, 400, 640, 240);
}

void style(String theControllerName) {
  controlP5.Controller c = cp5.getController(theControllerName);

  // add some padding to the caption label background
  c.getCaptionLabel().getStyle().setPadding(4, 4, 3, 4);

  // shift the caption label up by 4px
  c.getCaptionLabel().getStyle().setMargin(-25, 0, 0, 4); 

  // set the background color of the caption label
  //c.getCaptionLabel().setColorBackground(color(10, 20, 30, 140));
}

void conPannel() {

  fill(121, 203, 85);
  //rect(380, 420, 250, 180);
  fill(216, 106, 240);
  //rect(110, 420, 250, 180);
}

void led() {
  
  if (counter >= 255) {
    counter-=20;
  } else if (counter <= 255) {
    counter+=20;
  }
  println(counter);
  fill(counter,0,0);
  noStroke();
  ellipse(33,450,10,10);
  fill(255);
}

void disInfo() {
  textAlign(LEFT);
  text("Atomic Mass: " + atomicMassTOP, 50, 60);
  text("Electorn Count:  " + electronTOP, 50, 80);
  text("Neutron Count: " + neutronTOP, 50, 100);
  text("Proton Top: " + protonTOP, 50, 120);
  text("Radioacvity: " + radio1, 50, 140);
  text("Atomic Mass: " + atomicMassBOT, 50, 310);
  text("Electorn Count: " + electronBOT, 50, 330);
  text("Neutron Count: " + neutronBOT, 50, 350);
  text("Proton Top: " + protonBOT, 50, 370);
  text("Radioacvity: " + radio2, 50, 390);
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

