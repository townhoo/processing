int i = 1 ;
int j = 1 ;
int n = 300;
int a = 0;
void setup(){
  size(500,500);
  smooth();
}

void draw(){
  background(0);
  noStroke();
  fill(255,255,255);
  
  if(a>0){   
   for(i=-125;i<400;i+=250){
     for(j=-125;j<400;j+=250){
       fill(255);
       ellipse(250+i,250+j,100,100);  //i=250
       fill(mouseX, 100,100);
       
       ellipse(175+i,175+j,50,50);
       triangle(175+i,200+j,250+i,250+j,200+i,175+j);
       
       ellipse(250+i,150+j,50,50);
       triangle(225+i,150+j,250+i,250+j,275+i,150+j);
       
       ellipse(325+i,175+j,50,50);
       triangle(300+i,175+j,250+i,250+j,325+i,200+j);
       
       ellipse(150+i,250+j,50,50);
       triangle(150+i,225+j,250+i,250+j,150+i,275+j);
       
       ellipse(350+i,250+j,50,50);
       triangle(350+i,225+j,250+i,250+j,350+i,275+j);
       
       ellipse(175+i,325+j,50,50);
       triangle(175+i,300+j,250+i,250+j,200+i,325+j);
       
       ellipse(250+i,350+j,50,50);
       triangle(225+i,350+j,250+i,250+j,275+i,350+j);
       
       ellipse(325+i,325+j,50,50);
       triangle(300+i,325+j,250+i,250+j,325+i,300+j);
              
     }
   }
}
 
  
  if((abs(mouseX-pmouseX)+abs(mouseY-pmouseY)/2)>5){
   stroke(255);
     strokeWeight(2);
     fill(mouseX%255,0,mouseY%255,200);
     quad(mouseX-60,mouseY-20,mouseX-10,mouseY-30,mouseX,mouseY,mouseX-40,mouseY-10);
     quad(mouseX+60,mouseY-20,mouseX+10,mouseY-30,mouseX,mouseY,mouseX+40,mouseY-10);
     fill(mouseX%255,mouseY%255,0,200);
     quad(mouseX-40,mouseY+30,mouseX-30,mouseY,mouseX,mouseY,mouseX-10,mouseY+20);
     quad(mouseX+40,mouseY+30,mouseX+30,mouseY,mouseX,mouseY,mouseX+10,mouseY+20);
 } else {
   stroke(255);
     strokeWeight(3);
     fill(mouseX%255,0,mouseY%255,250);
     quad(mouseX-60,mouseY-70,mouseX-10,mouseY-50,mouseX,mouseY,mouseX-40,mouseY-10);
     quad(mouseX+60,mouseY-70,mouseX+10,mouseY-50,mouseX,mouseY,mouseX+40,mouseY-10);
     fill(mouseX%255,0,0,200);
     quad(mouseX-60,mouseY+40,mouseX-40,mouseY,mouseX,mouseY,mouseX-10,mouseY+30);
     quad(mouseX+60,mouseY+40,mouseX+40,mouseY,mouseX,mouseY,mouseX+10,mouseY+30);
   
 }
}


void mousePressed(){
a++;
}
void keyPressed(){
n-=10;
if(n==-300){
  n=300;
}
}
