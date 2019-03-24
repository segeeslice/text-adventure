/*
  FOR REFERENCE:
  text area is 21x95 characters.
  (or 1995 characters, not counting wraps)
*/

// CORNERS mode, main text portion
final int textX1 = padding+5; // Additional 5 to roughly center
final int textY1 = padding;
final int textX2 = 800-padding;
final int textY2 = button1Y - padding;

void mainText() {
  fill(0,255,51);
  rectMode(CORNERS);
  text("_.............................................................................................;_.............................................................................................;_.............................................................................................;_.............................................................................................;_.............................................................................................;_.............................................................................................;_.............................................................................................;_.............................................................................................;_.............................................................................................;_.............................................................................................;_.............................................................................................;_.............................................................................................;_.............................................................................................;_.............................................................................................;_.............................................................................................;_.............................................................................................;_.............................................................................................;_.............................................................................................;_.............................................................................................;_.............................................................................................;_.............................................................................................;_.............................................................................................;",
    textX1, textY1, textX2, textY2);
}
