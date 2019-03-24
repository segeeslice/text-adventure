final String fontFile = "IBM_VGA8.ttf";
final int fontSize = 16;
final int padding = 16;

// CORNER mode, main buttons
final int buttonHeight = 56;
final int buttonWidth = 400 - padding*2;

final int button3X = padding;
final int button3Y = 600 - padding - buttonHeight;
final int button1X = button3X;
final int button1Y = button3Y - padding - buttonHeight;

final int button4X = button3X + 2*padding + buttonWidth;
final int button4Y = button3Y;
final int button2X = button4X;
final int button2Y = button1Y;

// CENTER mode, back button
final int backButtonHeight = 40;
final int backButtonWidth = 48;

final int backButtonX = buttonWidth + 2*padding;
final int backButtonY = button3Y - (Integer)(padding/2);

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

void setup () {
  size(800, 600);
  background(40, 40, 40);

  // Fonts are retrieved from the "data" folder
  textFont(createFont(fontFile, fontSize, false), fontSize);
  textAlign(LEFT,TOP);
  
  noSmooth();
  strokeWeight(2);
  stroke(0,255,51);
}

void draw () {
  fill(0,255,51);
  rectMode(CORNERS);
  text("_.............................................................................................;_.............................................................................................;_.............................................................................................;_.............................................................................................;_.............................................................................................;_.............................................................................................;_.............................................................................................;_.............................................................................................;_.............................................................................................;_.............................................................................................;_.............................................................................................;_.............................................................................................;_.............................................................................................;_.............................................................................................;_.............................................................................................;_.............................................................................................;_.............................................................................................;_.............................................................................................;_.............................................................................................;_.............................................................................................;_.............................................................................................;_.............................................................................................;",
    textX1, textY1, textX2, textY2);

  optionButtons();
}

void optionButtons() {
  fill(40,40,40);
  rectMode(CORNER);
  
  // Base selections
  rect(button1X, button1Y, buttonWidth, buttonHeight);
  rect(button2X, button2Y, buttonWidth, buttonHeight);
  rect(button3X, button3Y, buttonWidth, buttonHeight);
  rect(button4X, button4Y, buttonWidth, buttonHeight);
  
  // Back button
  rectMode(CENTER);
  rect(backButtonX, backButtonY, backButtonWidth, backButtonHeight, 8);
}
