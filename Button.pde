/*
Buttons are numbered in normal reading order as they would appear on the screen.
The back button is located in the middle of them as such:

1   2
  B
3   4
*/

import java.util.Vector;

// General properties
final int buttonHeight = 56;
final int buttonWidth = 400 - padding*2;
final int backButtonHeight = 40;
final int backButtonWidth = 48;

PImage backImg; // Must be set in setup()

// X and Y coordinates of the central point in the back button
// For use in display and initialization
int backCenterX;
int backCenterY;

// Basic class for storing each button's info
class Button {
  // Top-left corner x and y coordinates
  private int x;
  private int y;
  
  // Width and height
  private int w;
  private int h;
  
  // Button identifier
  private char k;
  
  // Text to be displayed
  String textVal;
  
  public Button () {
    x = y = w = h = 0;
    k = ' ';
    textVal = "";
  }
  
  public Button (int w_in, int h_in, char k_in) {
    x = y = 0;
    textVal = "";
    
    w = w_in;
    h = h_in;
    k = k_in;
  }
  
  
  public void setX (int x_in)  { x = x_in; }
  public void setY (int y_in)  { y = y_in; }
  public void setW (int w_in)  { w = w_in; }
  public void setH (int h_in)  { h = h_in; }
  public void setK (char k_in) { k = k_in; }
  
  public int getX () { return x; }
  public int getY () { return y; }
  public int getW () { return w; }
  public int getH () { return h; }
  public char getK () { return k; }
  
  public void display (String text_in) {
    fill(40,40,40);
    rectMode(CORNER);   
    rect(x, y, w, h);
    
    textAlign(LEFT, TOP);
    rectMode(CORNERS);
    fill(0,255,51);
    text(text_in, x + 8, y + 8, x + w - 8, y + h - 8);
  }
  
  public void display (int curve) {
    fill(40,40,40);
    rectMode(CORNER);
    
    rect(x, y, w, h, curve);
  }
};

final Button button1 = new Button(buttonWidth, buttonHeight, '1');
final Button button2 = new Button(buttonWidth, buttonHeight, '2');
final Button button3 = new Button(buttonWidth, buttonHeight, '3');
final Button button4 = new Button(buttonWidth, buttonHeight, '4');
final Button buttonB = new Button(backButtonWidth, backButtonHeight, 'B');

final Vector<Button> buttonVect = new Vector<Button>(5);

//// --- FUNCTIONS ---

// NOTE: must be done in this way and run from setup() 
void initButtons () {
  // Initialize necessary coordinates
  button3.setX(padding);
  button3.setY(600 - padding - buttonHeight);
  button1.setX(button3.getX());
  button1.setY(button3.getY() - padding - buttonHeight);
  
  button4.setX(button3.getX() + 2*padding + buttonWidth);
  button4.setY(button3.getY());
  button2.setX(button4.getX());
  button2.setY(button1.getY());
  
  // Process central point of back button
  backCenterX = buttonWidth + 2*padding;
  backCenterY = button3.getY() - (Integer)(padding/2);
  
  // Back button central to corner coordinates conversion
  int backX = backCenterX - (Integer)(backButtonWidth  / 2);
  int backY = backCenterY - (Integer)(backButtonHeight / 2);
  
  buttonB.setX(backX);
  buttonB.setY(backY);
  
  // Init button vector
  buttonVect.add(buttonB);
  buttonVect.add(button1);
  buttonVect.add(button2);
  buttonVect.add(button3);
  buttonVect.add(button4);
}

// Takes an array of four strings correlating to the four main buttons in order
void buttonsDisplay(String[] text) {
  if (text.length < 4) {
    println("Size error");
    return;
  }
  
  button1.display(text[0]);
  button2.display(text[1]);
  button3.display(text[2]);
  button4.display(text[3]);
  buttonB.display(10);
  
  imageMode(CENTER);
  image(backImg, backCenterX, backCenterY, buttonB.getW()-padding, buttonB.getH()-padding);
}

/*
Returns one the following:
  - 1-4: x, y is over one of those numbered buttons
  - B:   x, y is over the back button
  - ' ':  x, y is over none of the buttons
*/
char mouseOverButton(int x, int y) {
  for (Button b : buttonVect) {
    if (x >= b.getX() && x <= b.getX() + b.getW() && y >= b.getY() && y <= b.getY() + b.getH()) {
      return b.getK();
    }
  }

  return ' ';
}
