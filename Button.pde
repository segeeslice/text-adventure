
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

PImage backImg; // Must be set in setup()

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
  rect(backButtonX, backButtonY, backButtonWidth, backButtonHeight, 10);
  
  imageMode(CENTER);
  image(backImg, backButtonX, backButtonY, backButtonWidth-padding, backButtonHeight-padding);
}
