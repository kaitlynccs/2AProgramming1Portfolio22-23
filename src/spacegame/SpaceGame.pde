 // Kaitlyn Cao | November 28 2022 | Draw a Spaceship
import processing.sound.*;
SoundFile blaster;
SpaceShip s1;
Timer rockTimer, puTimer;
ArrayList<Rock> rocks = new ArrayList<Rock>();
ArrayList<Powerup> powerups = new ArrayList<Powerup>();
ArrayList<Laser> lasers = new ArrayList<Laser>();
Star[] stars = new Star[100];
int score, level, rockCount, rocksPassed, laserCount, rockRate;
boolean play;

void setup() {
  size(800, 800);
  blaster = new SoundFile(this, "blaster.wav");
  s1 = new SpaceShip();
  puTimer = new Timer(5000);
  puTimer.start();
  rockRate = 500;
  rockTimer = new Timer(rockRate);
  rockTimer.start();
  score = 0;
  rocksPassed = 0;
  rockCount = 0;
  laserCount = 0;
  level = 1;
  play = false;

  //Add Stars
  for (int i = 0; i<stars.length; i++) {
    stars[i] = new Star();
  }
}

void draw() {
  background(0);
  if (!play) {
    startScreen();
  } else {
    //Level increase
    if (frameCount % 1000 ==10) {
      level++;
      rockRate -=10;
      s1.ammo +=100;
    }
    //Rendering Stars
    for (int i = 0; i<stars.length; i++) {
      stars[i].display();
      stars[i].move();
      noCursor();
    }

    // Add PowerUps
    if (puTimer.isFinished()) {
      powerups.add(new Powerup());
      puTimer.start();
      println("Powerups:" + powerups.size());
    }

    // Rendering Powerups and Detecting Ship Collision
    for (int i = 0; i < powerups.size(); i++) {
      Powerup pu = powerups.get(i);
      if (pu.intersect(s1)) {
        if (pu.type == 'H') {
          s1.health+=100;
        } else {
          s1.ammo+=100;
        }
        powerups.remove(pu);
        // add a sound of explosion
      }
      if (pu.reachedBottom()) {
        powerups.remove(pu);
        score -= 100;
      } else {
        pu.display();
        pu.move();
      }
    }

    // Add Rocks
    if (rockTimer.isFinished()) {
      rocks.add(new Rock());
      rockCount++;
      rockTimer.start();
      println("Rocks:" + rocks.size());
    }

    // Rendering Rocks and Detecting Ship Collision
    for (int i = 0; i < rocks.size(); i++) {
      Rock r = rocks.get(i);
      if (s1.intersect(r)) {
        s1.health-=50;
        score-=100;
        rocks.remove(r);
        //todo call the explosion animation
        // add a sound of explosion
      }
      if (r.reachedBottom()) {
        rocks.remove(r);
        score -= 100;
      } else {
        r.display();
        r.move();
      }
    }

    // Render Laser
    for (int i = lasers.size()-1; i >= 0; i--) {
      Laser l = lasers.get(i);
      for (int j = 0; j < rocks.size(); j++) {
        Rock r = rocks.get(j);
        if (l.intersect(r)) {
          score+=100;
          rocks.remove(r);
          lasers.remove(l);
          //todo call the explosion animation
          // add a sound of explosion
        }
      }

      if (l.reachedTop()) {
        lasers.remove(l);
      } else {
        l.display();
        l.move();
      }
    }
    infoPanel();
    s1.display(mouseX, mouseY);

    //Game over logic
    if (s1.health<1 || rocksPassed >5) {
      gameOver();
    }
  }
}

// Add Laser based on event
void mousePressed() {
  if (s1.fire()) {
    blaster.play();
  }
  if (s1.fire() && s1.turretCount == 1) {
    lasers.add(new Laser(s1.x, s1.y));
    println("Lasers:" + lasers.size());
  } else if (s1.fire() && s1.turretCount == 2) {
    lasers.add(new Laser(s1.x-20, s1.y));
    lasers.add(new Laser(s1.x+20, s1.y));
    println("Lasers:" + lasers.size());
  } else if (s1.fire() && s1.turretCount == 3) {
    lasers.add(new Laser(s1.x, s1.y));
    lasers.add(new Laser(s1.x+20, s1.y));
    lasers.add(new Laser(s1.x-20, s1.y));
    println("Lasers:" + lasers.size());
  } else if (s1.fire() && s1.turretCount == 4) {
    lasers.add(new Laser(s1.x-20, s1.y));
    lasers.add(new Laser(s1.x+20, s1.y));
    lasers.add(new Laser(s1.x-40, s1.y));
    lasers.add(new Laser(s1.x+40, s1.y));
    println("Lasers:" + lasers.size());
  } else if (s1.fire() && s1.turretCount == 5) {
    lasers.add(new Laser(s1.x, s1.y));
    lasers.add(new Laser(s1.x+20, s1.y));
    lasers.add(new Laser(s1.x-20, s1.y));
    lasers.add(new Laser(s1.x+40, s1.y));
    lasers.add(new Laser(s1.x-40, s1.y));
    println("Lasers:" + lasers.size());
  }
}

void keyPressed() {
  if (s1.fire()) {
    blaster.play();
  }
  if (key == ' ') {
    if (s1.fire() && s1.turretCount == 1) {
      lasers.add(new Laser(s1.x, s1.y));
      println("Lasers:" + lasers.size());
    } else if (s1.fire() && s1.turretCount == 2) {
      lasers.add(new Laser(s1.x-20, s1.y));
      lasers.add(new Laser(s1.x+20, s1.y));
      println("Lasers:" + lasers.size());
    } else if (s1.fire() && s1.turretCount == 3) {
      lasers.add(new Laser(s1.x-20, s1.y));
      lasers.add(new Laser(s1.x+20, s1.y));
      lasers.add(new Laser(s1.x-40, s1.y));
      lasers.add(new Laser(s1.x+40, s1.y));
      println("Lasers:" + lasers.size());
    }
  }
}

void startScreen() {
  background(0);
  fill(222);
  textAlign(CENTER);
  text("Press any key to begin...", width/2, height/2);
  if (mousePressed || keyPressed) {
    play = true;
  }
}

void gameOver() {
  background(0);
  fill(222);
  textAlign(CENTER);
  text("Game Over", width/2, height/2);
  play = false;
  noLoop();
}


void infoPanel() {
  fill(129, 128);
  rectMode(CENTER);
  rect(width/2, 25, width, 50);
  fill(255);
  textAlign(LEFT);
  textSize(25);
  text("SPACEGAME " + " | Health:" + s1.health + " | Score:" + score + " | Level: " + level + " | Ammo: " + s1.ammo, 20, 40);
}
