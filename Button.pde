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
  
  // Text to be displayed and destination when clicked
  private String textVal;
  private String dest;
  
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
  
  public void setText (String text_in) { textVal = text_in; }
  public void setDest (String dest_in) { dest = dest_in; }
  
  public int getX () { return x; }
  public int getY () { return y; }
  public int getW () { return w; }
  public int getH () { return h; }
  public char getK () { return k; }
  
  public String getDest () { return dest; }
  
  public void display () {
    fill(40,40,40);
    rectMode(CORNER);   
    rect(x, y, w, h);
    
    textAlign(LEFT, TOP);
    rectMode(CORNERS);
    fill(0,255,51);
    text(textVal, x + 8, y + 8, x + w - 8, y + h - 8);
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
void buttonsDisplay() {
  button1.display();
  button2.display();
  button3.display();
  button4.display();
  buttonB.display(10);
  
  imageMode(CENTER);
  image(backImg, backCenterX, backCenterY, buttonB.getW()-padding, buttonB.getH()-padding);
}


// Takes an array of four strings correlating to the four main buttons in order and updates their strings
void updateButtonText(String[] text) {
  if (text.length < 4) {
    println("Could not update button text: size error");
    return;
  }
  
  // TODO: use buttonVect?
  button1.setText(text[0]);
  button2.setText(text[1]);
  button3.setText(text[2]);
  button4.setText(text[3]);
}

// Takes an array of four strings correlating to the four main buttons in order and updates their destinations
void updateButtonDest(String[] dest) {
  if (dest.length < 4) {
    println("Could not update button dest: size error");
    return;
  }
  
  button1.setDest(dest[0]);
  button2.setDest(dest[1]);
  button3.setDest(dest[2]);
  button4.setDest(dest[3]);
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

// Return destination based on passed button key
// Uses same key conventions as described in mouseOverButton
String getButtonDest(char keyVal) {  
  switch (keyVal) {
    case '1':
      return button1.getDest();
    case '2':
      return button2.getDest();
    case '3':
      return button3.getDest();
    case '4':
      return button4.getDest();
    case 'B':
      // Something here
    default:
      return "";
  }
}
