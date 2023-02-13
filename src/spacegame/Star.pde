class Star {
  int x, y, diam, speed;
  PImage star;

  // Constructor
  Star() {
    x = int(random(width));
    y = int(random(height));
    diam = int(random(1, 4));
    speed = int(random(2, 6));
    star = loadImage("star.png");
  }

  void display() {
    imageMode(CENTER);
    image(star, x, y);
  }

  void move() {
    if (y>height+5) {
      y = -5;
      x = int(random(width));
    } else {
      y+=speed;
    }
  }

  boolean reachedBottom() {
    return true;
  }
}
