Mover[] movers = new Mover[100];
boolean flag,flagf;

float g = 0.4;
 
void setup() {
  size(400,400);
  background(0);
  for (int i = 0; i < movers.length-1; i++) {
    movers[i] = new Mover(random(0.1,2),random(width),random(height));
  }
}
 
void draw() {
  //background(255);
  fill(0,10);
  rect(0,0,400,400);
 
  for (int i = 0; i < movers.length-1; i++) {
    for (int j = 0; j < movers.length-1; j++) {
      if (i != j) {
        PVector force = movers[j].attract(movers[i]);
        movers[i].applyForce(force);
      }
          movers[i].che(i,j);
    }
      if(flag){
        PVector forcea = movers[99].attract(movers[i]).mult(-30);
        movers[i].applyForce(forcea);
      }
    movers[i].update();
    movers[i].display();
    movers[i]. checkEdges();
  }
 // saveFrame();
}

class Mover {
 
  PVector location;
  PVector velocity;
  PVector acceleration;
  float mass;
 
  Mover(float m, float x , float y) {
    mass = m;
    location = new PVector(x,y);
    velocity = new PVector(0,0);
    acceleration = new PVector(0,0);
  }
 
  void applyForce(PVector force) {
    PVector f = PVector.div(force,mass);
    acceleration.add(f);
  }
 
  void update() {
    if(flagf){
    velocity.add(acceleration).mult(0.95);
    }
    else{velocity.add(acceleration);}
    location.add(velocity);
    acceleration.mult(0);
  }
 
  void display() {
    stroke(0);
    fill(175);
    stroke(255);
    point(location.x,location.y);
   // circle(location.x,location.y,20);
  }
 
  PVector attract(Mover m) {
    PVector force = PVector.sub(location,m.location);
    float distance = force.mag();
    distance = constrain(distance,5.0,25.0);
    force.normalize();
    float strength = (g * mass * m.mass) / (distance * distance);
    force.mult(strength).mult(-10);
    return force;
  }
  void checkEdges() {
    if (location.x > width) {
      location.x = width;
      velocity.x *= -1;
    } else if (location.x < 0) {
      velocity.x *= -1;
      location.x = 0;
    }
 
    if (location.y > height) {
      velocity.y *= -1;
      location.y = height;
    } else if (location.y < 0) {
      velocity.y *= -1;
      location.y = 0;
    }
  }
  void che(int i,int j){
    float x;
    x=PVector.sub(movers[i].location,movers[j].location).mag();
      if(x<=(movers[i].mass+movers[j].mass)*16){
        movers[i].velocity=PVector.mult(movers[i].velocity,-1);
        movers[j].velocity=PVector.mult(movers[j].velocity,-1);
    }
    
  }
}

void mousePressed(){
      movers[99] = new Mover(5,mouseX,mouseY);
     flag=!flag;
     flagf=true;
}
