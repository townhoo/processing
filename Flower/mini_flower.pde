class Drop {
  float x = random(width);
  float y = random(-500, -100);
  float z = random(0,4);
  float len = map(z, 0, 20, 10, 20);
  float yspeed = map(z, 0, 10, 1, 10);
  
  void fall() {
    y += yspeed;
    yspeed += 0.01;
    
    if (y > height) {
      y = random(-200, -100);
      yspeed = map(z, 0, 10, 0.01, 10);
    }
  }
  
  void show() {
    float thick = map(z, 0, 10, 1, 40);
    strokeWeight(thick);
    stroke(235, 169, 102);
    line(x, y, x ,y+len);
  }
}
