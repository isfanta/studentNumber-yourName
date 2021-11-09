PFont f;
int i;

void setup(){
  
 size(300,300,P3D);
 smooth();
 f=loadFont("3ds-48.vlw");
 textFont(f,48);
 frameRate(5);
 
}

void draw(){
i++;
wri(i);
}

void wri(int x){
  clear();
   translate(150,150);
   rotateX(PI/30);
   rotateZ(PI/30);
    rotateY(-PI/8-PI/36*i);
 text("k",0,0,100);
 rotateY(-PI/8);
 text("r",0,0,100);
 rotateY(-PI/8);
 text("o",0,0,100);
 rotateY(-PI/8);
 text("w",0,0,100);
 rotateY(-PI/8);
 text("e",0,0,100);
 rotateY(-PI/8);
 text("m",0,0,100);
 rotateY(-PI/8);
 text("o",0,0,100);
 rotateY(-PI/8);
 text("h ",0,0,100);
 rotateY(-PI/8);
 text("y",0,0,100);
 rotateY(-PI/8);
 text("m ",0,0,100);
 rotateY(-PI/8);
 text("s",0,0,100);
 rotateY(-PI/8);
 text("i",0,0,100);
 rotateY(-PI/8);
 text("h",0,0,100);
 rotateY(-PI/8);
 text("T",0,0,100);
  
}
