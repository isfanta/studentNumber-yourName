PImage []tools=new PImage[14];
boolean []flag=new boolean[7];
boolean []flagtc=new boolean[6];
boolean []colset=new boolean[100];
boolean []colsetp=new boolean[100];
boolean []colsetl=new boolean[100];
int []rl=new int[100];
int []gl=new int[100];
int []bl=new int[100];
int []al=new int[100];
int []rp=new int[100];
int []gp=new int[100];
int []bp=new int[100];
int []ap=new int[100];
int []penx=new int[100];
int []peny=new int[100];
int []erax=new int[100];
int []eray=new int[100];
int []pawx=new int[100];
int []pawy=new int[100];
int []lightx=new int[500];
int []lighty=new int[500];
int []r=new int[100];
int []g=new int[100];
int []b=new int[100];
int []a=new int[100];
int []rr=new int[6];
int []aa=new int[6];
PFont f;
PImage pic;
int i, alpha, alphar, alphag, alphab, xr, xg, xb, xa,ttt;
color col;
int cx1, cy1, tt, js,i1,i2,i3,i4;
boolean flagc,flagp,flagpaint,cli,slep;

void setup() {

  size(1000, 900);
  background(255, 230, 230);
  smooth();

  col=#828282;
  alphar=130;
  alphag=130;
  alphab=130;
  xr=201;
  xg=201;
  xb=201;
  xa=201;
  for(i=0;i<6;i++){
     rr[i]=i*20;
     aa[i]=160-i*20;
  }

  f=loadFont("Consolas-48.vlw");
  textFont(f, 24);

  tools[0]=loadImage("pen.png");
  tools[1]=loadImage("eraser.png");
  tools[2]=loadImage("lightpen.png");
  tools[3]=loadImage("loadinpic.png");
  tools[4]=loadImage("text.png");
  tools[5]=loadImage("col.png");
  tools[6]=loadImage("save.png");
  tools[7]=loadImage("pen.png");
  tools[8]=loadImage("eraser.png");
  tools[9]=loadImage("rainbow.png");
  tools[10]=loadImage("paw.png");
  tools[11]=loadImage("light.png");
  tools[12]=loadImage("cursor.png"); 
  tools[13]=loadImage("alpha.png");
  pic=loadImage("pic.jpg");

}

void draw() {
  if(slep){
    delay(2000);
  }
  slep=false;
 background(255, 210, 210);
  showback();
     if(flagp){
          image(pic,140,80,800,750);
     }
  showclick();
  showmouse();
  pen();
  paw();
  light();
  eraser();
  showtool();
}

void light(){
 if(flagtc[4]){
    if(cli){
      ttt=(ttt+1)%20;
      if(ttt==1){
      lightx[i4]=constrain(mouseX,140,940);
      lighty[i4]=constrain(mouseY,80,830);
      i4++;
      }
    }
  }
  for(i=0;i<500;i++){
    if(lightx[i]>0){
       if(colsetl[i]==false){
     rl[i]=int(map(xr,130,280,0,255));
     gl[i]=int(map(xg,130,280,0,255));
     bl[i]=int(map(xb,130,280,0,255));
        }
        colsetl[i]=true;
   fill(rl[i],gl[i],bl[i],aa[i%6]);
   stroke(rl[i],gl[i],bl[i],aa[i%6]);
   strokeWeight(5);
   circle(lightx[i],lighty[i],rr[i%6]);
   println(lightx[i],rr[i%6]);
    }
  }
  
}

void paw(){
  if(flagtc[3]){
    if(flagpaint){
      pawx[i3]=constrain(mouseX,140,940);
      pawy[i3]=constrain(mouseY,80,830);
      i3++;
      flagpaint=false;
    }
  }
  for(i=0;i<100;i++){
    if(pawx[i]>0){
       if(colsetp[i]==false){
     rp[i]=int(map(xr,130,280,0,255));
     gp[i]=int(map(xg,130,280,0,255));
     bp[i]=int(map(xb,130,280,0,255));
     ap[i]=int(map(xa,130,280,0,255));
        }
        colsetp[i]=true;
      tint(rp[i],gp[i],bp[i],ap[i]);
      image(tools[10],pawx[i]-25,pawy[i]-25,50,50);
      tint(255,255,255,255);
    }
  }
}

void pen(){
    if(flagtc[0]){
       if(flagpaint){
        penx[i1]=constrain(mouseX,140,940);
        peny[i1]=constrain(mouseY,80,830);
        i1++;
       }
       flagpaint=false;
    }
    for(i=0;i<97;i++){
      if(i%3==2&&penx[i]>0){
        if(colset[i]==false){
     r[i]=int(map(xr,130,280,0,255));
     g[i]=int(map(xg,130,280,0,255));
     b[i]=int(map(xb,130,280,0,255));
     a[i]=int(map(xa,130,280,0,255));
        }
        colset[i]=true;
     noFill();
     stroke(r[i],g[i],b[i],a[i]);
     strokeWeight(5);
     beginShape();
     vertex(penx[i-2],peny[i-2]);
     bezierVertex(penx[i-2],peny[i-2],penx[i-1],peny[i-1],penx[i],peny[i]);
     endShape();
      }
     }  
    
}
void eraser(){
    if(flagtc[1]){
       if(flagpaint){
        erax[i2]=constrain(mouseX,140,940);
        eray[i2]=constrain(mouseY,80,830);
        i2++;
       }
       flagpaint=false;
    }
    for(i=0;i<97;i++){
      if(i%3==2&&erax[i]>0){
     noFill();
     stroke(255,210,210,255);
     strokeWeight(8);
     beginShape();
     vertex(erax[i-2],eray[i-2]);
     bezierVertex(erax[i-2],eray[i-2],erax[i-1],eray[i-1],erax[i],eray[i]);
     endShape();
     stroke(255,50);
     beginShape();
     vertex(erax[i-2],eray[i-2]);
     bezierVertex(erax[i-2],eray[i-2],erax[i-1],eray[i-1],erax[i],eray[i]);
     endShape();
      }
     }  
    
}

void showmouse() {

  int x, y;
  x=mouseX;
  y=mouseY;

  if ((x>50 &&x<90  &&y>100 &&y<140) || flag[0]==true) {
    flag[0]=true;
    alpha=int(map(dist(x, y, 120, 130), 100, 0, 0, 255));
    if (abs(x-120)>50||abs(y-130)>50) {
      flag[0]=false;
    }
    fill(50, alpha);
    text("pen,draw a smooth line.", 90, 140);
  }

  if ((x>50 &&x<90  &&y>200 &&y<240) || flag[1]==true) {
    flag[1]=true;
    alpha=int(map(dist(x, y, 120, 230), 100, 0, 0, 255));
    if (abs(x-120)>50||abs(y-230)>50) {
      flag[1]=false;
    }
    fill(50, alpha);
    text("eraser,clear what you have painted", 90, 240);
  }

  if ((x>50 &&x<90  &&y>300 &&y<340) || flag[2]==true) {
    flag[2]=true;
    alpha=int(map(dist(x, y, 175, 350), 200, 0, 0, 255));
    if (abs(x-175)>110||abs(y-350)>50) {
      flag[2]=false;
    }
    fill(50, alpha);
    text("another pen ,have a try!", 90, 340);
    fill(255, alpha);
    noStroke();
    rect(120, 360, 45, 45);
    rect(180, 360, 45, 45);
    rect(240, 360, 45, 45);
    image(tools[9], 120, 360, 45, 45);
    tint(0,0,0);
    image(tools[10], 180, 360, 45, 45);
    tint(255,255,255,255);
    image(tools[11], 240, 360, 45, 45);
  }

  if ((x>50 &&x<90  &&y>400 &&y<440) || flag[3]==true) {
    flag[3]=true;
    alpha=int(map(dist(x, y, 120, 430), 100, 0, 0, 255));
    if (abs(x-120)>50||abs(y-430)>50) {
      flag[3]=false;
    }
    fill(50, alpha);
    text("load in a picture i've prepared", 90, 440);
  }

  if ((x>50 &&x<90  &&y>500 &&y<540) || flag[4]==true) {
    flag[4]=true;
    alpha=int(map(dist(x, y, 120, 530), 100, 0, 0, 255));
    if (abs(x-120)>50||abs(y-530)>50) {
      flag[4]=false;
    }
    fill(50, alpha);
    text("add some text", 90, 540);
  }

  if ((x>50 &&x<90  &&y>600 &&y<640) || flag[5]==true) {
    flag[5]=true;
    alpha=int(map(dist(x, y, 190, 730), 200, 0, 0, 255));
    if (abs(x-190)>120||abs(y-730)>120) {
      flag[5]=false;
    }
    fill(50, alpha);
    text("choose the color and alpha", 90, 640);

    noStroke();
    alphar=int(map(xr,130,280,0,255));
    fill(255, 0, 0, alphar);
    rect(90, 680, 25, 25);
    alphag=int(map(xg,130,280,0,255));
    fill(0, 255, 0, alphag);
    rect(90, 725, 25, 25);
    alphag=int(map(xb,130,280,0,255));
    fill(0, 0, 255, alphab);
    rect(90, 770, 25, 25);
    fill(map(xr,130,280,0,255),map(xg,130,280,0,255),map(xb,130,280,0,255),map(xa,130,280,0,255));
    rect(90,815,25,25);
    strokeWeight(5);
    stroke(255);
    line(130, 825, 280, 825);
    line(130, 735, 280, 735);
    line(130, 780, 280, 780);
    line(130, 690, 280, 690);

    stroke(0);
    strokeWeight(1);
    fill(100);
    rect(xa-4, 818, 8, 14);
    rect(xg-4, 728, 8, 14);
    rect(xb-4, 772, 8, 14);
    rect(xr-4, 683, 8, 14);
  }

  if ((x>50 &&x<90  &&y>750 &&y<790) || flag[6]==true) {
    flag[6]=true;
    alpha=int(map(dist(x, y, 120, 770), 100, 0, 0, 255));
    if (abs(x-120)>50||abs(y-770)>50) {
      flag[6]=false;
    }
    fill(50, alpha);
    text("save the picture", 90, 770);
  }
}

void showback() {
  strokeWeight(10);
  stroke(255);
  strokeJoin(ROUND);
  fill(255);
  rect(30, 80, 80, 620);
  rect(30, 730, 80, 100);
  strokeWeight(20);
  fill(255, 50);
  stroke(255, 50);
  rect(140, 80, 800, 750);

  for (i=0; i<6; i++) {
    image(tools[i], 50, 100*i+100, 40, 40);
  }
  image(tools[6], 50, 750, 40, 40);
}

void showclick() {
  if (flagc==true) {
    js=js+1;
    if (js<6) {
      fill(50, 80, 120, (6-js)*20);
      noStroke();
      circle(cx1, cy1, js*10);
    }
    if (js>10&&js<=15) {
    }
  }
  if (js==15) {
    flagc=false;
    js=0;
  }
}

public void mouseClicked(MouseEvent e) {
  cx1=e.getX();
  cy1=e.getY();
  flagc=true;
  if(cx1>130&&cx1<930&&cy1>80&&cy1<830){
  cli=!cli;
  }
}

void mousePressed() {
  int mx=mouseX;
  int my=mouseY;

 if(mx>50&&mx<90 &&my>750&&my<790){
  save("paint");
  fill(0);
  text("you have saved it.",300,400);
slep=true;

}
  
 if(mx>140&&my>80&&mx<940&&my<830){
   flagpaint=true;
 }
 else{
   flagpaint=false;
 }
  if(mx>50 &&mx<90  &&my>100 &&my<140){
      for( i=1;i<6;i++){
        flagtc[i]=false;
      }
      flagtc[0]=!flagtc[0];
  }  
  
  if(mx>50 &&mx<90  &&my>200 &&my<240){
      for( i=0;i<6;i++){
        if(i!=1){
        flagtc[i]=false;
        }
      }
      flagtc[1]=!flagtc[1];
  } 
  if(flag[2]){
       flagpaint=false;
  if(mx>120 &&mx<165  &&my>360 &&my<405){
      for( i=0;i<6;i++){
        if(i!=2){
        flagtc[i]=false;
        }
      }
      flagtc[2]=!flagtc[2];
  } 
  
  if(mx>180 &&mx<225  &&my>360 &&my<405){
      for( i=0;i<6;i++){
        if(i!=3){
        flagtc[i]=false;
        }
      }
      flagtc[3]=!flagtc[3];
  } 
  
  if(mx>240 &&mx<285  &&my>360 &&my<405){
      for( i=0;i<6;i++){
        if(i!=4){
        flagtc[i]=false;
        }
      }
      flagtc[4]=!flagtc[4];
  } 
  }
  if(mx>50 &&mx<90  &&my>400 &&my<440){
    flagp=!flagp;
  } 
  
  if(mx>50 &&mx<90  &&my>500 &&my<540){
      for( i=0;i<6;i++){
        if(i!=5){
        flagtc[i]=false;
        }
      }
      flagtc[5]=!flagtc[5];
  } 
 if(flag[5]){ 
  flagpaint=false;
  if(mx>130&&mx<280&&my>678 &&my<702){
    xr=mx;
  }
  if(mx>130&&mx<280&&my>723 &&my<757){
    xg=mx;
  }
  if(mx>130&&mx<280&&my>767 &&my<800){
    xb=mx;
  }
  if(mx>130&&mx<280&&my>812 &&my<845){
    xa=mx;
  }
 }

}

void mouseDragged(){
  int mx=mouseX;
  int my=mouseY;
  if(flag[5]){
       flagpaint=false;
  if(mx>xr-4 &&mx<xr+4  &&my>678 &&my<702){
    xr=constrain(mouseX,130,280);
  } 
  if(mx>xg-4 &&mx<xg+4  &&my>723 &&my<757){
    xg=constrain(mouseX,130,280);
  } 
  if(mx>xb-4 &&mx<xb+4  &&my>767 &&my<800){
    xb=constrain(mouseX,130,280);
  } 
  if(mx>xa-4 &&mx<xa+4  &&my>812 &&my<845){
    xa=constrain(mouseX,130,280);
  } 
  }
}

void showtool(){
  
  for (i=0;i<6;i++){
    if(flagtc[i]){
      if(i==3){
        tint(0,0,0);
      }
          image(tools[i+7],mouseX-5,mouseY-20,20,20);     
      if(i==3){
        tint(255,255,255,255);
      }
    }
  }  
    
}
