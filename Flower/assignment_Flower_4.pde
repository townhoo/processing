Drop[] drops = new Drop[500];

void setup() {
  size(800, 600);
  smooth();
  for (int i = 0; i < drops.length; i++) {
    drops[i] = new Drop();
  }
}


void draw() {
  background(230, 230, 250);  
  for (int i = 0; i < drops.length; i++) {
    drops[i].fall();
    drops[i].show();
    
  }
  
  // set centre point
  translate(mouseX, mouseY);
   
  // rotate
  rotate(radians(frameCount + mouseX + mouseY));
  
   // petals
  fill(#EBA966);
  for (int i = 0; i < 24 ; i++) {
    stroke(255);
    strokeWeight(2);
    ellipse(0,-50,25,100);
    rotate(radians(15));
  }
  // centre circle
  fill(#826A5f);
  ellipse(0,0,100,100);
  ellipse(0,0,75,75);

}
