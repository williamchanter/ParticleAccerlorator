import controlP5.*;


ControlP5 cp5;
ParticleSystem pl;
ParticleSystem pr;

ParticleSystem tempPart;

Particleoffshot particle;

float uicol = 255;
float acc1 = 2;
float acc2 = 2;

float speed1;
float speed2;
float angtop;
float angbot;
float radio1;
float radio2;

int slow = 1;

boolean cameraSpin;

PVector v;

void setup() {
  
  size(640,640, P3D);
  
  pl = new ParticleSystem(new PVector(0,130));
  pr = new ParticleSystem(new PVector(650,300));
  tempPart = new ParticleSystem(new PVector(-50,-50));
  
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
        .setRange(0, 10)
          .setValue(0.9)
            .setColorCaptionLabel(color(20, 20, 200));
  cp5.addSlider("radio2")
    .setPosition(420, 430)        
      .setSize(20, 160)
        .setRange(0, 10)
          .setValue(0.9)
            .setColorCaptionLabel(color(20, 20, 200));
}

void draw() {
  
  background(124,198,205);
  
    pushMatrix();
    beginCamera();
    if (cameraSpin){
    camera(mouseX, mouseY, 120.0, width/2, height/2, -10, 0.0, 1.0, 0.0);
    }
    if(frameCount%slow==0)
      pl.addParticle(acc1, speed1, speed1+0.2, angtop, angtop+0);
      pl.run(color(74, 82, 231), 20);
    
    if(frameCount%slow==0)
      pr.addParticle(-acc2, -speed2, -speed2+0.2, angbot, angbot+0);
      pr.run(color(255, 234, 0), 20);
    
    pr.detectBeam(pl);
  
    if(frameCount%slow==0)
      v = PVector.random3D();
      tempPart.addParticleOff(-acc2, -speed2, -speed2+0.2, angbot, angbot+0);
      tempPart.runOff(color(255, 255, 255), 8);
    endCamera();
    popMatrix();
  
  layout(40,40,40,40, uicol);
  disInfo();
  conPannel();

}

void layout(float top, float bottom, float left, float right, float uiback) {
  
  fill(uiback);
  noStroke();
  rect(0, 0, left, 400);
  rect(0,0,640,top);
  rect(640-right,0,right,400);
  rect(0,400,640,bottom);
  rect(0,400,640,240);
}

void conPannel() {
  
  fill(121,203,85);
  rect(380,420,220,180);
  fill(216,106,240);
  rect(140,420,220,180);
  
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
