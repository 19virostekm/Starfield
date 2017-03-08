// Miki Virostek
// 3/8/17 period 2
// This program uses interfaces and arrays to create
// three types of objects for a colorful display.
Particle[] particles;
int m = 0;
double n = 0;
float o = 0;
void setup()
{
  size(500,500);

  particles = new Particle[500];
  
  for(int nI = 0; nI < particles.length; nI++) {
    particles[nI] = new NormalParticle();
  }
  for(int nI = 0; nI < particles.length; nI += 4) {
    particles[nI] = new NormalParticle(m);
  }
  for(int nI = 1; nI < particles.length; nI += 4) {
    particles[nI] = new NormalParticle(n);
  }
  for(int nI = 3; nI < particles.length; nI += 4) {
    particles[nI] = new NormalParticle(o);
  }
  for(int nI = 0; nI < particles.length; nI += 2) {
    particles[nI] = new OddballParticle();
  }
  for(int nI = 0; nI < particles.length; nI += 10) {
    particles[nI] = new JumboParticle();
  }
}
void draw()
{
  background(0,0,0);
  
   for(int nI = 0; nI < particles.length; nI++) {
    particles[nI].move();
    particles[nI].show();
  }
  
}
class NormalParticle implements Particle
{
  double xPosition, yPosition, angle, speed;
  int myColor;
  
  NormalParticle() {
    xPosition = 500;
    yPosition = 500;
    angle = (Math.random()*2) * Math.PI;
    speed = (Math.random()*10);
  }
  NormalParticle(int m) {
    xPosition = 0;
    yPosition = 0;
    angle = (Math.random()*2) * Math.PI;
    speed = (Math.random()*10);
  }
  NormalParticle(double n) {
    xPosition = 500;
    yPosition = 0;
    angle = (Math.random()*2) * Math.PI;
    speed = (Math.random()*10);
  }
  NormalParticle(float o) {
    xPosition = 0;
    yPosition = 500;
    angle = (Math.random()*2) * Math.PI;
    speed = (Math.random()*10);
  }
  public void move(){
    xPosition += Math.cos(angle) * speed;
    yPosition += Math.sin(angle) * speed;
  }
  public void show() {
    ellipse((float)xPosition,(float)yPosition,20,20);
    fill((int)(Math.random()*255),(int)(Math.random()*255),(int)(Math.random()*255));
  }
}
 interface Particle
{
  public void show();
  public void move();
} 
class OddballParticle implements Particle
{
  double xPosition, yPosition, angle, speed;
  int myColor;
  
  OddballParticle() {
    xPosition = 250;
    yPosition = 250;
    angle = (Math.random()*2) * Math.PI;
    speed = (Math.random()*100);
  }
  public void move(){
    xPosition += Math.cos(angle) * speed;
    yPosition += Math.sin(angle) * speed;

    if(xPosition > 500 || xPosition < 0) {
      xPosition = 250;
      yPosition = 250;
    } 
    if(yPosition > 500 || yPosition < 0) {
      xPosition = 250;
      yPosition = 250;
    } 
  }
  public void show() {
    rect((float)xPosition,(float)yPosition,10,10);
    fill((int)(Math.random()*255),(int)(Math.random()*255),(int)(Math.random()*255));
  }
}
class JumboParticle implements Particle
{
  double xPosition, yPosition, angle, speed;
  int myColor;
  
  JumboParticle() {
    xPosition = 250;
    yPosition = 250;
    angle = (Math.random()*2) * Math.PI;
    speed = (Math.random()*10);
  }
  public void move(){
    xPosition += Math.cos(angle) * speed;
    yPosition += Math.sin(angle) * speed;
    
    if(mousePressed == true) 
    {
      xPosition = mouseX;
      yPosition = mouseY;
    }
  }
  public void show() {
    ellipse((float)xPosition,(float)yPosition,50,50);
    fill((int)(Math.random()*255),(int)(Math.random()*255),(int)(Math.random()*255));
  } 
} 
  
