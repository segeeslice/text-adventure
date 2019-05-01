/*

All the data for monitoring the choice buttons (bottom of screen)

Buttons are numbered in normal reading order as they would
appear on the screen.
The back button is located in the middle of them as such:

1   2
  B
3   4
*/

import java.util.Stack;

class ChoiceButton extends Button {
  final static public int width = 400 - padding*2;
  final static public int height = 56;

  ChoiceButton (int num) {
    super(ChoiceButton.width, ChoiceButton.height, "choice" + (char)(num + '0'));
  }

  void doAction() {

  };
}

// General properties
final int backHeight = 40;
final int backWidth = 48;

// Must be set in setup()
PImage backImg;

final ChoiceButton button1 = new ChoiceButton(1);
final ChoiceButton button2 = new ChoiceButton(2);
final ChoiceButton button3 = new ChoiceButton(3);
final ChoiceButton button4 = new ChoiceButton(4);
final Button buttonB = new Button(backWidth, backHeight, "back", 10);

// Stack for use in tracking backwards via the back button
Stack<String> backTrail = new Stack<String>();

//// --- FUNCTIONS ---

// Initialize additional properties of the buttons
// Handled in this way instead of the constructor since operations
// like this must be contained in functions
void initChoiceButtons () {
  // Initialize necessary coordinates
  button3.setX(padding);
  button3.setY(600 - padding - ChoiceButton.height);
  button1.setX(button3.getX());
  button1.setY(button3.getY() - padding - ChoiceButton.height);

  button4.setX(button3.getX() + 2*padding + ChoiceButton.width);
  button4.setY(button3.getY());
  button2.setX(button4.getX());
  button2.setY(button1.getY());

  // Process central point of back button
  int backCenterX = ChoiceButton.width + 2*padding;
  int backCenterY = button3.getY() - (Integer)(padding/2);

  // Back button central to corner coordinates conversion
  int backX = backCenterX - (Integer)(backWidth  / 2);
  int backY = backCenterY - (Integer)(backHeight / 2);

  buttonB.setX(backX);
  buttonB.setY(backY);
  buttonB.setImg(backImg);
}

// Takes an array of four strings correlating to the
// four main buttons in order and updates their strings
void updateChoiceButtonText(String[] text) {
  if (text.length < 4) {
    println("Could not update button text: size error");
    return;
  }

  button1.setText(text[0]);
  button2.setText(text[1]);
  button3.setText(text[2]);
  button4.setText(text[3]);
}

// Takes an array of four strings correlating to the
// four main buttons in order and updates their destinations
void updateChoiceButtonDest(String[] dest) {
  if (dest.length < 4) {
    println("Could not update button dest: size error");
    return;
  }

  button1.setDest(dest[0]);
  button2.setDest(dest[1]);
  button3.setDest(dest[2]);
  button4.setDest(dest[3]);
}


// Add to the back-tracking trail
// To be used when clicking a main button
// and backEnable is true in the json file
void pushBackTrail(JSONObject obj, String fileName) {
  Boolean track = obj.getBoolean("backEnable");

  if (!backTrail.empty() && backTrail.peek() == fileName) { return; }
  if (fileName.isEmpty()) { return; }

  if (track == true) {
    backTrail.push(fileName);
    buttonB.setDest(fileName);
  } else {
    backTrail = new Stack<String>();
  }
}

// Go back a step
// To be used when the back button is pushed
void popBackTrail() {
  // Back trail contains the destinations *including*
  // the one currently assigned to the back button
  if (!backTrail.empty()) { backTrail.pop(); }

  String back = backTrail.empty() ? "" : backTrail.peek();
  buttonB.setDest(back);
};
