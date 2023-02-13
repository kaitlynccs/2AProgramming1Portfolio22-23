// Kaitlyn Cao | October 31 2022 | Calculators
Button[] numButtons = new Button[10];
Button[] opButtons = new Button[12];
String dVal = "0.0";
char op = ' ';
float l, r, result;
boolean left = true;

void setup() {
  size(340, 540);
  numButtons[0] = new Button(180, 460, 120, 40, '0');
  numButtons[1] = new Button(120, 400, 40, 40, '1');
  numButtons[2] = new Button(180, 400, 40, 40, '2');
  numButtons[3] = new Button(240, 400, 40, 40, '3');
  numButtons[4] = new Button(120, 340, 40, 40, '4');
  numButtons[5] = new Button(180, 340, 40, 40, '5');
  numButtons[6] = new Button(240, 340, 40, 40, '6');
  numButtons[7] = new Button(120, 280, 40, 40, '7');
  numButtons[8] = new Button(180, 280, 40, 40, '8');
  numButtons[9] = new Button(240, 280, 40, 40, '9');
  opButtons[0] = new Button(90, 220, 100, 40, 'C');
  opButtons[1] = new Button(60, 340, 40, 40, '^');
  opButtons[2] = new Button(180, 220, 40, 40, '%');
  opButtons[3] = new Button(300, 220, 40, 40, '/');
  opButtons[4] = new Button(300, 280, 40, 40, '*');
  opButtons[5] = new Button(300, 340, 40, 40, '-');
  opButtons[6] = new Button(300, 400, 40, 40, '+');
  opButtons[7] = new Button(300, 460, 40, 40, '=');
  opButtons[8] = new Button(60, 400, 40, 40, '√');
  opButtons[9] = new Button(60, 460, 40, 40, '.');
  opButtons[10] = new Button(60, 280, 40, 40, 'π');
  opButtons[11] = new Button(240, 220, 40, 40, '±');
}


void draw() {
  background(#FFC0CB);
  for (int i =0; i<numButtons.length; i++) {
    numButtons[i].display();
    numButtons[i].hover(mouseX, mouseY);
  }
  for (int i = 0; i<opButtons.length; i++) {
    opButtons[i].display();
    opButtons[i].hover(mouseX, mouseY);
  }
  updateDisplay();
}

void keyPressed() {
  println("key:"+ key);
  println("keyCode:" + keyCode);
  if (keyCode == 49 || keyCode == 97) {
    handleEvent("1", true);
  } else if (keyCode == 50 || keyCode == 98) {
    handleEvent("2", true);
  } else if (keyCode == 51 || keyCode == 99) {
    handleEvent("3", true);
  } else if (keyCode == 52 || keyCode == 100) {
    handleEvent("4", true);
  } else if (keyCode == 53 || keyCode == 101) {
    handleEvent("5", true);
  } else if (keyCode == 54 || keyCode == 102) {
    handleEvent("6", true);
  } else if (keyCode == 55 || keyCode == 103) {
    handleEvent("7", true);
  } else if (keyCode == 56 || keyCode == 104) {
    handleEvent("8", true);
  } else if (keyCode == 57 || keyCode == 105) {
    handleEvent("9", true);
  } else if (keyCode == 46 || keyCode == 110) {
    handleEvent(".", false);
  } else if (keyCode == 48 || keyCode == 96) {
    handleEvent("0", true);
  } else if (keyCode == 61 || keyCode == 107) {
    handleEvent("+", false);
  } else if (keyCode == 45 || keyCode == 109) {
    handleEvent("-", false);
  } else if (keyCode == 47 || keyCode == 111) {
    handleEvent("/", false);
  } else if (keyCode == 106) {
    handleEvent("*", false);
  } else if (keyCode == 10) {
    performCalculation();
  }
}
void handleEvent(String val, boolean num) {
  if (num) {
    if (dVal.equals("0.0")) {
      dVal = val;
    } else {
      dVal += val;
    }
    if (left) {
      l =float(dVal);
    } else {
      r = float(dVal);
    }
  } else if (val.equals("C")) {// All opButtons here
    dVal = "0.0";
    op = ' ';
    l = 0.0;
    r = 0.0;
    result = 0.0;
    left = true;
  } else if (val.equals(".")) {
    if (!dVal.contains(".")) {
      dVal += ".";
    }
  } else if (val.equals("+")) {
    op = '+';
    dVal = "0.0";
    left = false;
  } else if (val.equals("-")) {
    op = '-';
    dVal = "0.0";
    left = false;
  } else if (val.equals("/")) {
    op = '/';
    dVal = "0.0";
    left = false;
  } else if (val.equals("*")) {
    op = '*';
    dVal = "0.0";
    left = false;
  } else if (val.equals("=")) {
    performCalculation();
  }
}
void mouseReleased() {
  for (int i = 0; i<numButtons.length; i++) {
    if (numButtons[i].on) {
      handleEvent(str(numButtons[i].val), true);
    }
  }
  for (int i = 0; i<opButtons.length; i++) {
    if (opButtons[i].on && opButtons[i].val == 'C') {
      handleEvent("C", false);
    } else if (opButtons[i].on && opButtons[i].val == '+') {
      handleEvent("+", false);
    } else if (opButtons[i].on && opButtons[i].val == '-') {
      handleEvent("-", false);
    } else if (opButtons[i].on && opButtons[i].val == '*') {
      handleEvent("*", false);
    } else if (opButtons[i].on && opButtons[i].val == '/') {
      handleEvent("/", false);
    } else if (opButtons[i].on && opButtons[i].val == 'π') {
      if (left) {
        l=PI;
        dVal = str(l);
      } else {
        r = PI;
        dVal = str(r);
      }
    } else if (opButtons[i].on && opButtons[i].val == '%') {
      if (left) {
        l=l/100;
        dVal = str(l);
      } else {
        r=r/100;
      }
    } else if (opButtons[i].on && opButtons[i].val == '^') {
      if (left) {
        l=sq(l);
        dVal = str(l);
      } else {
        r = sq(r);
        dVal = str(r);
      }
    } else if (opButtons[i].on && opButtons[i].val == '.') {
      handleEvent(".", false);
    } else if (opButtons[i].on && opButtons[i].val == '±') {
      if (left) {
        l=l*-1;
        dVal = str(l);
      } else {
        r = r*-1;
        dVal = str(r);
      }
    } else if (opButtons[i].on && opButtons[i].val == '√') {
      if (left) {
        l=sqrt(l);
        dVal = str(l);
      } else {
        r = sqrt(r);
        dVal = str(r);
      }
    } else if (opButtons[i].on && opButtons[i].val == '=') {
      performCalculation();
    }
    println("l:" + l + " r:" + r + " op:" + op + " left:" + left + " result:" + result);
  }
}
void updateDisplay() {


  fill(255);
  stroke(2);
  rectMode(CENTER);
  rect(170, 100, 300, 160);

  fill(0);
  textSize(20);
  textAlign(LEFT);

  //if (dVal.length()<28 && dVal.length()>35) {
  //  textSize(20);
  //} else if (dVal.length()<30) {
  //  textSize(18);
  //} else if (dVal.length()<32) {
  //  textSize(16);
  //} else if (dVal.length()<33 ) {
  //  textSize(14);
  //} else if (dVal.length()<34) {
  //  textSize(12);
  //} else {
  //  textSize(2);
  //}
// text(dVal, width-210, 255);
  if (textWidth(dVal)>250) {
    textSize(20*(250/textWidth(dVal)));
  }
  text(dVal, 40, 60);
}

void performCalculation() {
  if (op == '+') {
    result = l + r;
  } else if (op == '-') {
    result = l - r;
  } else if (op == '*') {
    result = l*r;
  } else if (op == '/') {
    result = l/r;
  }
  dVal = str(result);
  l = result;
  left = true;
}
