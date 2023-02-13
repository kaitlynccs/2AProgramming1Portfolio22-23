class Laser {
  int x, y, w, h, speed;
  color c1;

  // Constructor
  Laser(int tx, int ty) {
    c1 = color(255, 0, 0);
    x = tx;
    y = ty;
    w = 4 ;
    h = 10;
    speed = 20;
  }

  void display() {
    fill(c1);
    rectMode(CENTER);
    rect(x, y, w, h);
    noStroke();
  }

  void move() {
    y -= speed;
  }

  boolean reachedTop() {
    if (y<-10) {
      return true;
    } else {
      return false;
    }
  }

  boolean intersect(Rock rock) {
    float d = dist(x, y, rock.x, rock.y);
    if (d<40) {
      return true;
    } else {
      return false;
    }
  }
}
