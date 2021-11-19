int num=10000;
int attractorNum=20;
Particle[]ps;
PVector[][]attractor;
float spdRange=2000;
float damp=0.002;
boolean flags=false;
boolean first=false;
int c=0;
int []power=new int [4];
int shownow=9;
//boolean bwmode=true;
int cmode=0;
PFont text;
int purecol=0;
Boolean savetip=false;
boolean notip=false;

void setup() {
  for (int i=0; i<4; i++) {
    power[i]=1;
  }
  
 // size(960, 900);
 size(640,600);

  background(255);
  text=loadFont("Calibri-48.vlw");
  textFont(text,12);
  ellipseMode(CENTER);
  attractor=new PVector[4][attractorNum];
  ps=new Particle[num];
  // noStroke();
  //fill(#F0C2C2);
  // rect(900,600,50,30);
  //reset();
}

void draw() {
 // println(mouseX,mouseY,savetip);
  //background(255);
  noStroke();
  // scale(2/3);
  fill(#F0C2C2);
  rect(20, 520, 33, 13);
  rect(66, 520, 33, 13);
  rect(113, 520, 33, 13);
  fill(255);
  rect(53,560,93,13);
    fill(#F0C2C2);
  rect(53,563,93,6);
  fill(0);
  rect(map(purecol,0,360,53,146),560,6,13);
  //println(mouseX,mouseY);
    fill(0);
    text("save",20,533);
  text("inherit",66,533);
  if(cmode==0){
  text("color",113,533);
  }
  if(cmode==1){
   text("pure",113,533);
  }
  if(cmode==2){
   text("black",113,533);
  }
    if(savetip==true&&notip==false){
    fill(200);
    noStroke();
    rect(200,540,300,80);
    fill(0);
    text("the picture has been saved",220,550);
    text("i know",220,580);
    text("no reminder anymore",300,580);
  }
  else{
    noStroke();
    fill(255);
    rect(200,540,300,80);
  }
  noStroke();
  colorMode(HSB,360,100,100);
  fill(purecol,100,100);
  colorMode(RGB,255);
  circle(33,566,20);
      strokeWeight(6);
  if (flags) {
    stroke(0);
    line(mouseX, mouseY, pmouseX, pmouseY);
  }
      strokeWeight(1);
  if (c<2000) {
    if (first) {

      float spdRange=2000;
      float damp=0.002;

      stroke(0, 4);
      for (int i=0; i<num; i++) {
        if (cmode==1) {
          colorMode(HSB, 360, 100, 100);
          stroke(map(ps[i].vel.x, -0.1, 0.1, 360, 0),100,100, 4);
          //stroke(0,100,map(ps[i].vel.x, -0.1, 0.1, 100, 0), 4);
          // println(ps[i].vel.x);
          colorMode(RGB, 255);
        }
        if(cmode==2){
          colorMode(HSB, 360, 100, 100);
          stroke(purecol,100,map(ps[i].vel.x, -0.1, 0.1, 100, 0), 4);
          colorMode(RGB, 255);
        }
        ps[i].step((c-c%500)/500);
        if (ps[i].pos.x>160) {
          point(ps[i].pos.x, ps[i].pos.y);
        }
      }

      c++;

      if (c%500==0) {
        copy(160, 0, 480, 533, 13, (c/500-1)*133, 133, 133);
        fill(255);
        rect(160, 0, 480, 600);
        for (int i=0; i<num; i++) {
          ps[i]=new Particle();
        }
      }
    }
  }
}

void keyPressed() {
  if (key==' ') {
    if(first){
    yc();
    }
  }
  if(key=='s'){
    saveFrame();
  }
  if(key=='a'||key=='-'){
    purecol=constrain(purecol-5,0,360);
  }
  if(key=='d'||key=='='){
    purecol=constrain(purecol+5,0,360);
  }
}

void reset() {
  c=0;
  int j=0;
  loadPixels();
  for (int i=0; i<4; i++) {
    j=0;
    do {
      attractor[i][j]=new PVector(random(width), random(height));
      int x= int(attractor[i][j].x);
      int y= int(attractor[i][j].y);
      int all= x+y*width;
      float r=red(pixels[all]);
      if (r==0) {
        j++;
      }
    } while (j<20);
  }

  for (int i=0; i<num; i++) {
    ps[i]=new Particle();
  }

  background(255);
  //fill(255, 0, 0);
  //noStroke();
  //for (int i=0; i<attractor.length; i++) {
  // ellipse(attractor[1][i].x, attractor[1][i].y, 20, 20);
  //}
}

class Particle {
  PVector pos;
  PVector vel;
  Particle() {
    pos=new PVector(random(width), random(height));
    vel=new PVector(random(-spdRange, spdRange), random(-spdRange, spdRange));
  }
  void step(int x) {
    for (int i=0; i<attractor.length; i++) {
      float sqD=PVector.sub(pos, attractor[x][i]).magSq();
      if (sqD>0.1) {
        PVector acc=PVector.sub(attractor[x][i], pos).div(sqD).mult(spdRange*2);
        vel.add(acc);
      }
    }
    pos.add(vel);
    vel.mult(damp);
  }
}

void yc() {
  // println("yc");
  int sum=0;
  for (int i=0; i<4; i++) {
    sum=sum+power[i];
  }
  PVector []tempp=new PVector[20];
  for (int i=0; i<20; i++) {
    tempp[i]=new PVector(0, 0);
  }
  for (int j=0; j<20; j++) {
    for (int i=0; i<4; i++) {
      // println(i,j,attractor[i][j], power[i],sum,tempp[j]);
      tempp[j]=PVector.mult(attractor[i][j], power[i]).div(sum).add(tempp[j]);
    }
    tempp[j]=PVector.div(tempp[j], 2);
  }
  for (int i=0; i<4; i++) {
    for (int j=0; j<20; j++) {
      PVector tempr;
      tempr=new PVector(random(160, 640), random(533));
      attractor[i][j]=PVector.mult(tempr, 0.5).add(tempp[j]);
    }
  }

  for (int i=0; i<4; i++) {
    power[i]=1;
  }
  c=0;
  background(255);
  noStroke();
  fill(#F0C2C2);
  rect(20, 520, 33, 13);
  rect(66, 520, 33, 13);
  if (c<2000) {
    if (first) {

      float spdRange=2000;
      float damp=0.002;
      stroke(0, 4);
      for (int i=0; i<num; i++) {
        ps[i].step((c-c%500)/500);
        if (ps[i].pos.x>160) {
          if (cmode==1) {
            colorMode(HSB, 360, 100, 100);
            stroke(map(ps[i].vel.x, -0.1, 0.1, 360, 0), 100, 100, 4);
            // println(ps[i].vel.x);
            colorMode(RGB, 255);
          }
                  if(cmode==2){
          colorMode(HSB, 360, 100, 100);
          stroke(purecol,100,map(ps[i].vel.x, -0.1, 0.1, 100, 0), 4);
          colorMode(RGB, 255);
        }
          point(ps[i].pos.x, ps[i].pos.y);
        }
      }

      c++;

      if (c%500==0) {
        copy(160, 0, 480, 533, 13, (c/500-1)*133, 133, 133);
        fill(255);
        rect(160, 0, 480, 600);
        for (int i=0; i<num; i++) {
          ps[i]=new Particle();
        }
      }
    }
  }
  shownow=9;
}


//float spdRange=2000;
//float damp=0.002;
void mousePressed() {
 // println(shownow);
  if(mouseX>200&&mouseX<300&&mouseY>540&&mouseY<600){
    savetip=false;
  }
  else if (mouseX>300&&mouseX<400&&mouseY>540&&mouseY<600){
    notip=true;
    
  }
  else if (mouseX>20&&mouseX<53&&mouseY>520&&mouseY<533) {
    saveFrame();
    savetip=true;
  } else if (mouseX>113&&mouseX<146&&mouseY>520&&mouseY<533) {
    //bwmode=!bwmode;
    cmode=(cmode+1)%3;
    shownow=9;
  } else if(mouseX>53&&mouseX<146&&mouseY>560&&mouseY<573){
  purecol=int(map(mouseX,53,146,0,360));
  shownow=9;
  }
  else if (mouseX>66&&mouseX<100&&mouseY>520&&mouseY<533) {
    // println("yeah~");
    yc();
  } else if (mouseX>160) {
    flags=!flags;
    if (flags==false) {
      reset();
      first=true;
    }
  } else if (mouseY<133&&c>1990) {
    fuction1();
  } else if (mouseY<267&&c>1990) {
    fuction2();
  } else if (mouseY<400&&c>1990) {
    fuction3();
  } else if (c>1990) {
    fuction4();
  }
}

void fuction1() {
  if(shownow!=9){
  power[0]++;
  }
  stroke(0);
  line(153, 0, 153, power[0]*5);
 // println("1");
  if (shownow!=0) {
    fill(255);
    noStroke();
    rect(160, 0, 480, 600);
    int cc=0;
    for (int i=0; i<num; i++) {
      ps[i]=new Particle();
    }
    do {
      for (int i=0; i<num; i++) {
        ps[i].step(0);
        if (ps[i].pos.x>160) {
          stroke(0, 4);
          if (cmode==1) {
            colorMode(HSB, 360, 100, 100);
            stroke(map(ps[i].vel.x, -0.1, 0.1, 360, 0), 100, 100, 4);
            // println(ps[i].vel.x);
            colorMode(RGB, 255);
          }
                  if(cmode==2){
          colorMode(HSB, 360, 100, 100);
          stroke(purecol,100,map(ps[i].vel.x, -0.1, 0.1, 100, 0), 4);
          colorMode(RGB, 255);
        }
          point(ps[i].pos.x, ps[i].pos.y);
        }
      }
      shownow=0;
      cc++;
    } while (cc<500);
         copy(160, 0, 480, 533, 13, 0, 133, 133);
  }
}

void fuction2() {
  if(shownow!=9){
  power[1]++;
  }
  stroke(0);
  line(153, 133, 153, 133+power[1]*5);
  //println(mouseX,mouseY,power[1],133+power[1]*5);
  //println("2");
  if (shownow!=1) {
    fill(255);
    noStroke();
    rect(160, 0, 480, 600);
    int cc=0;
    for (int i=0; i<num; i++) {
      ps[i]=new Particle();
    }
    do {
      for (int i=0; i<num; i++) {
        ps[i].step(1);
        if (ps[i].pos.x>160) {
          stroke(0, 4);
          if (cmode==1) {
            colorMode(HSB, 360, 100, 100);
            stroke(map(ps[i].vel.x, -0.1, 0.1, 360, 0), 100, 100, 4);
            // println(ps[i].vel.x);
            colorMode(RGB, 255);
          }
                  if(cmode==2){
          colorMode(HSB, 360, 100, 100);
          stroke(purecol,100,map(ps[i].vel.x, -0.1, 0.1, 100, 0), 4);
          colorMode(RGB, 255);
        }
          point(ps[i].pos.x, ps[i].pos.y);
        }
      }
      shownow=1;
      cc++;
    } while (cc<500);
          copy(160, 0, 480, 533, 13, 133, 133, 133);
  }
}

void fuction3() {
  if(shownow!=9){
  power[2]++;
  }
  stroke(0);
    line(153, 267, 153, 267+power[2]*5);
  //println("3");
  if (shownow!=2) {
    fill(255);
    noStroke();
    rect(160, 0, 480, 600);
    int cc=0;
    for (int i=0; i<num; i++) {
      ps[i]=new Particle();
    }
    do {
      for (int i=0; i<num; i++) {
        ps[i].step(2);
        if (ps[i].pos.x>160) {
          stroke(0, 4);
          if (cmode==1) {
            colorMode(HSB, 360, 100, 100);
            stroke(map(ps[i].vel.x, -0.1, 0.1, 360, 0), 100, 100, 4);
            // println(ps[i].vel.x);
            colorMode(RGB, 255);
          }
                  if(cmode==2){
          colorMode(HSB, 360, 100, 100);
          stroke(purecol,100,map(ps[i].vel.x, -0.1, 0.1, 100, 0), 4);
          colorMode(RGB, 255);
        }
          point(ps[i].pos.x, ps[i].pos.y);
        }
      }
      shownow=2;
      cc++;
    } while (cc<500);
              copy(160, 0, 480, 533, 13, 267, 133, 133);
  }
}

void fuction4() {
  if(shownow!=9){
  power[3]++;
  }
  stroke(0);
    line(153, 400, 153, 400+power[3]*5);
 // println("4");
  if (shownow!=3) {
    fill(255);
    noStroke();
    rect(160, 0, 480, 600);
    int cc=0;
    for (int i=0; i<num; i++) {
      ps[i]=new Particle();
    }
    do {
      for (int i=0; i<num; i++) {
        ps[i].step(3);
        if (ps[i].pos.x>160) {
          stroke(0, 4);
          if (cmode==1) {
            colorMode(HSB, 360, 100, 100);
            stroke(map(ps[i].vel.x, -0.1, 0.1, 360, 0), 100, 100, 4);
            // println(ps[i].vel.x);
            colorMode(RGB, 255);
          }
                  if(cmode==2){
          colorMode(HSB, 360, 100, 100);
          stroke(purecol,100,map(ps[i].vel.x, -0.1, 0.1, 100, 0), 4);
          colorMode(RGB, 255);
        }
          point(ps[i].pos.x, ps[i].pos.y);
        }
      }
      shownow=3;
      cc++;
    } while (cc<500);
          copy(160, 0, 480, 533, 13, 400, 133, 133);
  }
}

void mouseDragged(){
  int mx=mouseX;
  int my=mouseY;
  
  if(mouseX>map(purecol,0,360,53,146)-5&&mouseX<map(purecol,0,360,53,146)+5&&mouseY>560&&mouseY<573){
    purecol=int(map(mouseX,53,146,0,360));
  }
  
}
