// Kaitlyn Cao | November 28 2022 | Draw a Spaceship
Spaceship s1;
int score, level;
boolean play;

void setup() {
  size(800, 800);
  s1 = new Spaceship();
}

void draw() {
  background(0);
  noCursor();
  //drawSpaceship(mouseX, mouseY);
  s1.display(mouseX, mouseY);
}
