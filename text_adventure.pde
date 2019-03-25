final String fontFile = "IBM_VGA8.ttf";
final int fontSize = 16;
final int padding = 16;

void setup () {
  size(800, 600);
  background(40, 40, 40);

  // Fonts are retrieved from the "data" folder
  textFont(createFont(fontFile, fontSize, false), fontSize);
  textAlign(LEFT,TOP);
  
  noSmooth();
  strokeWeight(2);
  stroke(0,255,51);
  
  backImg = loadImage("back.png");
}

void draw () {
  mainText();
  optionButtons();
}
