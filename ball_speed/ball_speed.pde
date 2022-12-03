Ball[] balls;

void setup() {
  size(700,500);
  noStroke();
  
  balls = new Ball[200];
  
  for (int i=0; i<balls.length; i++) {
    balls[i] = new Ball();
  }
}

void draw() {
  clearBackground();
    for (int i=0; i<balls.length; i++) {
    balls[i].update();
    balls[i].display();
  }
}

  void clearBackground() {
    fill(255);
    rect(0, 0, width, height);
  }
 
