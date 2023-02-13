class Button{
  // Member Variables aka the stuff that you need to make the button
  int x,y,w,h;
  char val;
  color c1, c2;
  boolean on;
  //Constructor aka constructing the buttons 
  Button(int x, int y, int w, int h, char val) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.val = val;
    c1 = color(#F26B8A);
    c2 = color(#E11584);
    on = false;
  }
  // Member Methods aka what happens when you hover over a button, the color changes
  void display() {
    rectMode(CENTER);
    if(on) {
      fill(c2);
    } else {
      fill(c1);
    }
    rect(x,y,w,h,10);
    fill(255);
    textAlign(CENTER);
    textSize(20);
    text(val,x,y);
  }
  // what happens when the house is over the button, edge detection
  void hover(int mx, int my) {
    on = (mx > x - w/2 && mx < x+w/2 && my < y + h/2 && my > y - h/2);
  }
}


// button: name, make, call
