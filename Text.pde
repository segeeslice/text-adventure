/*
  FOR REFERENCE:
  text area is 21x95 characters.
  (or 1995 characters, not counting wraps)
*/

// CORNERS mode, main text portion
int textX1, textY1, textX2, textY2;

// Must be done in this way to utilize button locations
void initText () {
  textX1 = padding+5; // Additional 5 to roughly center
  textY1 = padding;
  textX2 = 800-padding;
  textY2 = button1.getY() - padding;
}

void mainText(String textContents) {
  fill(0,255,51);
  rectMode(CORNERS);
  text(textContents, textX1, textY1, textX2, textY2);
}
