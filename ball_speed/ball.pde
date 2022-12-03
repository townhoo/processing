class Ball {
  // properties
  float x, y, w, h;
  float speedX, speedY;
  color c;
  
  // constructor
  Ball() {
    x = random(100, width-100);
    y = random(100, height-100);
    w = random(20,50);
    h = w;
    c = color(random(255), random(255), random(255), random(100,200));
    speedX = random(-5,7);
    speedY = random(-5,7);
  }
  
  
  // methods
  void update() {
    checkBounds();
    x += speedX;
    y += speedY;
  }
  // ball color
  void display() {
    fill(c);
    ellipse(x, y, w, h);
  }
  void checkBounds() {
    if (x < 0+w/2 || x > width-w/2) {
      speedX *= -1;
    }
    if (y < 0+h/2 || y > width-h/2) {
      speedX *= -1;
    }
  }

}
