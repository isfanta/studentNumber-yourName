int tem,i,j,max;
int []h=new int[10];
int []w=new int[10];
int []s=new int[64];
boolean flag;

void ranline(){
do{  
  flag=true;
    for(int i=1;i<=7;i++){
  h[i]=floor(random(0,600));
  w[i]=floor(random(0,600));
  }
  
  for( i=1;i<=7;i++){
          tem=h[i];
    for ( j=i;j<=7;j++){
      if(tem >=h[j]){
        tem = h[j]; 
        max=j;
        }        
     }
        h[max]=h[i];
        h[i]=tem;
 }
   for( i=1;i<=7;i++){
          tem=w[i];
    for ( j=i;j<=7;j++){
      if(tem >=w[j]){
        tem = w[j]; 
        max=j;
        }        
     }
        w[max]=w[i];
        w[i]=tem;
 }
  
  for(i=1;i<=7;i++){
    if(h[i+1]-h[i]<=15){
      flag=false;
    }
    }
    
    for(i=1;i<=7;i++){
    if(w[i+1]-w[i]<=15){
      flag=false;
    }
    }
  
}while(flag=false);
}

void setup()
{
h[8]=600;
h[9]=600;
w[9]=600;
w[8]=600;
h[0]=0;
w[0]=0;
flag=true;
  size(600, 600);
  background(255);
  fill(100);
  
  ranline();
 
 strokeWeight(5);
 for(i=1;i<=7;i++){
 line(h[i],0,h[i],600);
 line(0,w[i],600,w[i]);
 
 }
 
 for(i=0;i<=7;i++){
 
   for(j=0;j<=7;j++){
    s[i*8+j]=(h[i+1]-h[i])*(w[j+1]-w[j]);
   }
 }
 
 max=1;
 
 for(i=0;i<=63;i++){
 
   if(s[i]<=2000 && flag==true){
     fill(80);
   rect(h[(i-i%8)/8],w[i%8],h[(i-i%8)/8+1]-h[(i-i%8)/8],w[i%8+2]-w[i%8]);
     flag=false;
   }
   else if(flag==true && s[i]>10000){
     fill(255);
       rect(h[(i-i%8)/8],w[i%8],h[(i-i%8)/8+2]-h[(i-i%8)/8],w[i%8+2]-w[i%8]);
       flag=false;
   }
   else{
     flag=true;
   }
   
   if(s[i]>=s[max]){
     max=i;
   }
     
 }
 
 fill(20);
  rect(h[(max-max%8)/8],w[max%8],h[(max-max%8)/8+1]-h[(max-max%8)/8],w[max%8+1]-w[max%8]);
 
  for (i=0;i<=63;i++){
 System.out.println (s[i]);
}
  for (i=0;i<=8;i++){
 System.out.println (h[i]);
}

}
