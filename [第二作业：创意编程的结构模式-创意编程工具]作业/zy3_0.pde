int v=2;
int w=20;
int t=0;
int x1,y1,x2,y2;
int heax,heay,roox,rooy;

void setup(){
size(300,400);
background(65,0,85);

  t=0;
  heax=floor(random(50,250));
  x2=heax;
  heay=floor(random(50,350));
  y2=heay;

  roox=floor(random(-100,400));
  rooy=floor(random(-100,500));

}


void draw(){
  
  t=t+1;
x1=x2;
y1=y2;
x2=floor(heax+v*t*cos(w*t));
y2=floor(heay+v*t*sin(w*t));

noStroke();
fill(255,135,250,50);
beginShape();
  vertex(roox,rooy);
  vertex(x1,y1);
  vertex(x2,y2);
  vertex(roox,rooy);
endShape();

stroke(0);
strokeWeight((t-t%20)/20+1);
line(x1,y1,x2,y2);

if(t>=130){
  background(65,0,85);
  t=0;}

}
