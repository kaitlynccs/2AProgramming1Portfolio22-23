// Kaitlyn Cao | Oct 10 2022 | Screen Saver

float xpos, ypos, strokeW, pointCount;

void setup() {
  size(displayWidth, displayHeight);
  background(255);
  xpos = random(width);
  ypos = random(height);
}

void draw() {
  strokeW = random(2, 15);
  pointCount = random(5, 30);
  strokeWeight(strokeW);
  stroke(255, random(21, 192), random(133, 203));
  if (xpos >width || xpos<0||ypos> height || ypos<0) {
    xpos= random(width);
    ypos = random(height);
  }
  if (random(100)>70) {
    strokeWeight(strokeW);
    moveLeft(xpos, ypos, pointCount);
  } else if (random(100)>65) {
    strokeWeight(strokeW);
    moveUp(xpos, ypos, pointCount);
  } else if (random(100)>60) {
    strokeWeight(strokeW);
    moveDown(xpos, ypos, pointCount);
  } else {
    strokeWeight(strokeW);
    moveRight(xpos, ypos, pointCount);
  }
}

void moveRight(float startX, float startY, float moveCount) {
  for (float i=0; i <moveCount; i++) {
    point(startX+i, startY);
    xpos = startX+i;
    ypos = startY;
  }
}

void moveDown(float startX, float startY, float moveCount) {
  for (float i=0; i <moveCount; i++) {
    point(startX, startY+i);
    xpos = startX;
    ypos = startY+i;
  }
}

void moveLeft(float startX, float startY, float moveCount) {
  for (float i=0; i <moveCount; i++) {
    point(startX-i, startY);
    xpos = startX-i;
    ypos = startY;
  }
}

void moveUp(float startX, float startY, float moveCount) {
  for (float i=0; i <moveCount; i++) {
    point(startX, startY-i);
    xpos = startX;
    ypos = startY-i;
  }
}
