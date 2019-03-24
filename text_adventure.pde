final String fontFile = "IBM_VGA8.ttf";
final int fontSize = 16;
final int fontPad = 24;

// Text coordinates to be used with CORNERS rect mode
final int textX1 = fontPad;
final int textY1 = fontPad;
final int textX2 = 800-fontPad;
final int textY2 = 600-fontPad;

void setup () {
  // Replication of old 800x600 CRT monitor monitors (*1.5)
  size (800, 600);
  background(40, 40, 40);
  fill(0,255,51);

  // Fonts are retrieved from the "data" folder
  textFont(createFont(fontFile, fontSize, false), fontSize);
  textAlign(LEFT,TOP);
  rectMode(CORNERS);
}

void draw () {
  text("Testing... Happy Valentines Day. live, love, laugh. If only Whitney Houston was still around *tear <3  Happy Valentines Day. live, love, laugh. If only Whitney Houston was still around *tear <3  Happy Valentines Day. live, love, laugh. If only Whitney Houston was still around *tear <3  Happy Valentines Day. live, love, laugh. If only Whitney Houston was still around *tear <3  Happy Valentines Day. live, love, laugh. If only Whitney Houston was still around *tear <3  Happy Valentines Day. live, love, laugh. If only Whitney Houston was still around *tear <3  Happy Valentines Day. live, love, laugh. If only Whitney Houston was still around *tear <3  Happy Valentines Day. live, love, laugh. If only Whitney Houston was still around *tear <3  Happy Valentines Day. live, love, laugh. If only Whitney Houston was still around *tear <3  Happy Valentines Day. live, love, laugh. If only Whitney Houston was still around *tear <3  Happy Valentines Day. live, love, laugh. If only Whitney Houston was still around *tear <3  Happy Valentines Day. live, love, laugh. If only Whitney Houston was still around *tear <3  Happy Valentines Day. live, love, laugh. If only Whitney Houston was still around *tear <3  Happy Valentines Day. live, love, laugh. If only Whitney Houston was still around *tear <3  Happy Valentines Day. live, love, laugh. If only Whitney Houston was still around *tear <3  Happy Valentines Day. live, love, laugh. If only Whitney Houston was still around *tear <3  Happy Valentines Day. live, love, laugh. If only Whitney Houston was still around *tear <3  Happy Valentines Day. live, love, laugh. If only Whitney Houston was still around *tear <3  Happy Valentines Day. live, love, laugh. If only Whitney Houston was still around *tear <3  Happy Valentines Day. live, love, laugh. If only Whitney Houston was still around *tear <3  Happy Valentines Day. live, love, laugh. If only Whitney Houston was still around *tear <3  Happy Valentines Day. live, love, laugh. If only Whitney Houston was still around *tear <3  Happy Valentines Day. live, love, laugh. If only Whitney Houston was still around *tear <3  Happy Valentines Day. live, love, laugh. If only Whitney Houston was still around *tear <3  ",
    textX1, textY1, textX2, textY2);
}
