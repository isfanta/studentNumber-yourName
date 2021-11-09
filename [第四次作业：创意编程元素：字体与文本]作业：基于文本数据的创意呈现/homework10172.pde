//hello,i'm sorry for that github don't allow me to upload a folder ,
//so please download the picture attached(named "text"),
//and add it to a new folder under the "homework1017"named "data",
//then you can run this code successfully.
//sorry once again for the inconvenience,
//and if you still have any trouble ,please contact me by wechat"wyw13738085572".


PImage hw;
PFont te;
int x,y,c,all,a,i,j,ii,jj,dx,dy,ss,ttt,tt;
float r,yy,s,xx;
long t;
boolean flag,flag1;

int []h=new int[10];
int []w=new int[10];

void setup(){
  yy=150;
  s=1.5;
  size(1000,400);
  hw=loadImage("text.png");
  te=loadFont("Corbel-48.vlw");
  textFont(te,72);
  background(0);
  colorMode(HSB,360,100,100);
  frameRate(1000);

  a=10;
  flag=true;
  flag1=true;
  tt=0;
  ttt=400;
}

void draw(){
  
 t++;
 translate(100,100);
   if(t<=17000){
    addup();
   }
   else if(t<=17200){
    disa();
   }
   else if(t<=18200){
    showup();
    x=1000;
   }
   else if(t<=18600){
    move();
   }
   else if (t<=18700){
    expa();
   }
   else if(t<=18900){
     showte();
   }
   else if(t<=19000){
     fill(0,0,100);
     text("This is my homework.",15,100);
   }
   else if(t<=22000){
     breakdown();
   }
   
   println(t);
 }
 
 void addup(){
     x=int(random(hw.width));
     y=int(random(hw.height));
     all=x+y*hw.width;
     loadPixels();
     r=red(hw.pixels[all]);
       if(r<5){
         c=int(random(360));
         fill(c,100,100,100);
         circle(x,y,3);
       }
 }
      
void disa(){
  
     fill(0,0,100);
     a=a+10;     
     
       for(x=0;x<=hw.width;x++){
         for(y=0;y<=hw.height;y++){ 
           if(x*3+y<=a){
             noStroke();
             fill(0,0,100);
             rect(x+30,y,3,3);
             fill(0,100,0);
             rect(x+28,y,3,3);
              i=x;
           }
         }
       }
       
        for(x=0;x<i;x=x+3){
         for(y=1;y<hw.height;y=y+3){  
     all=x+y*hw.width;
     loadPixels();
     r=red(hw.pixels[all]);
     if(r<5){
       noStroke();
       fill(0,0,100);
       rect(x,y,2,2);
     }
     else{
       fill(0,100,0);
       rect(x,y,2,2);
         }
        }
      }
}

void showup(){
  tt++;
  background(0,100,0); 
  fill(0,0,100);
  text("This is my homework.",15,75);
  
  if(t>=17800 &&t<=17850){
    background(0,100,0);
  }
  
  if(t>=17950 &&t<=17980){
     background(0,100,0);
  }
  
  if(t>=18010 &&t<=18030){
    background(0,100,0);
  }
  
}

void move(){
     frameRate(60);
     x=x-5;
     background(0,0,100);
       if(flag){
         fill(0,100,0);
       }
     noStroke();
     text("This is my homework.",x,100);
     fill(0,100,0);
     rect(-100,-100,300,400);

    if(t>18360){
         float gravity=abs(yy*0.1);
         yy+=s*gravity;
           if((yy> height -25 && s>0) || (yy<25 && s<0)){
             if(t<18520){
               s=-s;
               flag=false;
               if(s<0){
               c=int(random(360));
               }
             }
           }
         fill(c,100,100);
         ellipse(200,yy*0.2-55,50,50);

    if(flag1==true){     
       for(i=0;i<=9;i++){
         h[i]=floor(random(100,200));
         w[i]=floor(random(0,200));
         flag1=false;
       } 
    }
        for(i=0;i<=9;i++){
           fill(c,100,100);
           if(h[i]-dx<-100 || w[i]+dy<-100 || w[i]+dy > 300){
                      if(t<18490){
             h[i]=floor(random(100,200));
             w[i]=floor(random(0,200));
                      }
           }
    
           else{
              h[i]=h[i]- dx;
              w[i]=w[i]+dy;
              circle(h[i],w[i],5);
              dx=int((400-dist(10,50,h[i],w[i]))*0.05);
              if(w[i]>50){
                ss=1;
              }
              else if(w[i]<50){
                ss=-1;
              }
              else{
                ss=0;
              }
              dy=int(0.05*(400-dist(10,50,h[i],w[i])))*ss;
           }
       }
    }
                fill(c,100,100);
}

void expa(){
  tt++;
  background(0,0,100);
  fill(0,100,0);
  rect(-100,-100,x,400);
  x=int((tt-200)*(tt-240)*0.3+300);
  println(x,tt);
}

void showte(){
  tt++;
  fill(0,0,100);
  background(0,100,0);
  text("This is my homework.",15,100);
  println(tt);
  if(tt%50==0){
  c=int(random(360));
  }
  fill(c,100,100,tt/3);
  text("This is my homework.",15,100);
}

void breakdown(){
  clear();
  ttt++;
  textFont(te);
  textSize(72);
  fill(0,0,100);
  text("This is my homework.",50,100);
  for(x=0;x<=1000;x++){
   //copy(x-100,0,1,1000,x-100,-2*int(min(pow(tan((x-t+99*noise(x))*.003),16)*9,200)*sin((x-t)*.006)),1,1000);
    copy(x-100,0,1,1000,x-100,-2*int(pow(tan((x-ttt+99*noise(x))*.003),16)*9*(x-ttt)*.006),1,1000);
  }
  fill(0,100,0);
  rect(-100,-100,int(ttt-370),400);
}
