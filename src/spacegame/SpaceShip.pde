class SpaceShip {
  int x, y, w, ammo, turretCount, health;

  SpaceShip() {
    x = 0;
    y = 0;
    w = 100;
    ammo = 200;
    turretCount = 1;
    health = 1000;
  }

  void display(int tempx, int tempy) {
    x = tempx;
    y = tempy;
    noStroke();
    fill(150, 0, 0);
    rect(x-20, y+4, 5, 10);
    rect(x+20, y+4, 5, 10);
    triangle(x-20, y+25, x-10, y+25, x-15, y+15);
    triangle(x+20, y+25, x+10, y+25, x+15, y+15);
    fill(128);
    quad(x, y-10, x, y+20, x-30, y+20, x-30, y+10);
    quad(x, y-10, x, y+20, x+30, y+20, x+30, y+10);
    ellipse(x, y, 20, 80);
    triangle(x-15, y-20, x, y-40, x+15, y-20);
    fill(50);
    triangle(x-10, y-22, x, y-30, x+10, y-22);
    rectMode(CENTER);
    fill(#ADD8E6);
    rect(x, y-6, 8, 6);
  }

  void move() {
  }

  boolean fire() {
    if (ammo>0) {
      ammo--;
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
