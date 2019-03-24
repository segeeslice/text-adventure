final String fontFile = "IBM_VGA8.ttf";
final int fontSize = 16;
final int padding = 24;

// Text coordinates to be used with CORNERS rect mode
final int textX1 = padding;
final int textY1 = padding;
final int textX2 = 800-padding;
final int textY2 = 600-padding;

final int buttonHeight = 56;
final int buttonWidth = 400 - padding*2;

//final int button3X1 = padding;
//final int button3Y1 = 2*padding + 2*buttonHeight;
//final int button3X2 = 600 - padding*2;
//final int button3Y2 = padding - 

final int button3X = padding;
final int button3Y = 600 - padding - buttonHeight;
final int button1X = button3X;
final int button1Y = button3Y - padding - buttonHeight;

final int button4X = padding*2 + buttonWidth;
final int button4Y = button3Y;
final int button2X = button4X;
final int button2Y = button1Y;


void setup () {
  // Replication of old 800x600 CRT monitor monitors
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
  text("Testing... Happy Valentines Day. live, love, laugh. If only Whitney Houston was still around *tear <3  Happy Valentines Day. live, love, laugh. If only Whitney Houston was still around *tear <3  Happy Valentines Day. live, love, laugh. If only Whitney Houston was still around *tear <3  Happy Valentines Day. live, love, laugh. If only Whitney Houston was still around *tear <3  Happy Valentines Day. live, love, laugh. If only Whitney Houston was still around *tear <3  Happy Valentines Day. live, love, laugh. If only Whitney Houston was still around *tear <3  Happy Valentines Day. live, love, laugh. If only Whitney Houston was still around *tear <3  Happy Valentines Day. live, love, laugh. If only Whitney Houston was still around *tear <3  Happy Valentines Day. live, love, laugh. If only Whitney Houston was still around *tear <3  Happy Valentines Day. live, love, laugh. If only Whitney Houston was still around *tear <3  Happy Valentines Day. live, love, laugh. If only Whitney Houston was still around *tear <3  Happy Valentines Day. live, love, laugh. If only Whitney Houston was still around *tear <3  Happy Valentines Day. live, love, laugh. If only Whitney Houston was still around *tear <3  Happy Valentines Day. live, love, laugh. If only Whitney Houston was still around *tear <3  Happy Valentines Day. live, love, laugh. If only Whitney Houston was still around *tear <3  Happy Valentines Day. live, love, laugh. If only Whitney Houston was still around *tear <3  Happy Valentines Day. live, love, laugh. If only Whitney Houston was still around *tear <3  Happy Valentines Day. live, love, laugh. If only Whitney Houston was still around *tear <3  Happy Valentines Day. live, love, laugh. If only Whitney Houston was still around *tear <3  Happy Valentines Day. live, love, laugh. If only Whitney Houston was still around *tear <3  Happy Valentines Day. live, love, laugh. If only Whitney Houston was still around *tear <3  Happy Valentines Day. live, love, laugh. If only Whitney Houston was still around *tear <3  Happy Valentines Day. live, love, laugh. If only Whitney Houston was still around *tear <3  Happy Valentines Day. live, love, laugh. If only Whitney Houston was still around *tear <3  ",
    textX1, textY1, textX2, textY2);

  optionButtons();
}

void optionButtons() {
  fill(50,50,50);
  rectMode(CORNER);
  
  rect(button1X, button1Y, buttonWidth, buttonHeight);
  rect(button2X, button2Y, buttonWidth, buttonHeight);
  rect(button3X, button3Y, buttonWidth, buttonHeight);
  rect(button4X, button4Y, buttonWidth, buttonHeight);
}
