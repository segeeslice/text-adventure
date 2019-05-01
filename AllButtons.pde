
// Way to manage all of the buttons at once
// All buttons are added to this within the Button constructor
static class AllButtons {
  static private Vector<Button> buttons = new Vector<Button>();

  static void add (Button b) {
    buttons.add(b);
  }

  // Ideally this would be in the deconstructor of Button, but
  // that is not an option in Java
  static void remove (Button b) {
    if (buttons.remove(b) == false) {
      println("Button removal unsuccessful");
    }
  }

  // Return what button we are over (if any!)
  // References buttons **in order**
  static Button mouseOverWhich (int x, int y) {
    for (Button b : buttons) {
      if (x >= b.getX() && x <= b.getX() + b.getW() && y >= b.getY() && y <= b.getY() + b.getH()) {
        return b;
      }
    }

    return null;
  }

  static void display () {
    for (Button b : buttons) {
      b.display();
    }
  }

  // Return destination based on passed button key
  // NOTE: Not currently used anywhere; may be deleted?
  static String getButtonDest(String keyVal) {
    for (Button b : buttons) {
      if (b.getK().equals(keyVal)) {
        return b.getDest();
      }
    }

    return "";
  }

  static void setButtonText(String keyVal, String text_in) {
    for (Button b : buttons) {
      if (b.getK().equals(keyVal)) {
        b.setText(text_in);
      }
    }
  }
};
