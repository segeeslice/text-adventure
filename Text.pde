/*
  FOR REFERENCE:
  text area is 21x95 characters.
  (or 1995 characters, not counting wraps)
*/

// CORNERS mode, main text portion
int textX1, textY1, textX2, textY2;

// Main text primary tracker, mimicking the logic in Button
// Not in its own class due to the simplicity of the mainText portion
String MAIN_TEXT = "";

// Must be done in this way to utilize button locations
void initText () {
  textX1 = padding;
  textY1 = padding;
  textX2 = 800-padding-50;
  textY2 = button1.getY() - padding;
}

void updateMainText (String mainText) {
  MAIN_TEXT = mainText;
}

Boolean textChanged (String mainText) {
  return MAIN_TEXT != mainText;
}

void mainTextDisplay() {
  fill(0,255,51);
  rectMode(CORNERS);
  textAlign(LEFT, TOP);
  text(MAIN_TEXT, textX1, textY1, textX2, textY2);
}

int getTextMidY () {
  return (textY2 + textY1) / 2;
}

int getTextMidX () {
  return (textX2 + textX1) / 2;
}
