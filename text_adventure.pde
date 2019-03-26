JSONObject jsonObj = new JSONObject();

final String fontFile = "IBM_VGA8.ttf";
final int fontSize = 16;
final int padding = 16;

void setup () {
  size(800, 600);
  background(40, 40, 40);

  // Fonts are retrieved from the "data" folder
  textFont(createFont(fontFile, fontSize, false), fontSize);
  
  noSmooth();
  strokeWeight(2);
  stroke(0,255,51);
  
  backImg = loadImage("back.png");
  initButtons();
  initText();
  
  try {
    jsonObj = loadJSONObject("demoStart.json");
  } catch (Exception e) {
    println("Error:", e); 
  }
}

void draw () {
  // Update the view if we've loaded a new jsonObj
  // Base this on the assumption that main text will not be the same
  // in two consecutive files
  String mainText = getMainText(jsonObj);
  if (textChanged(mainText)) {
    updateMainText(mainText);

    String buttonText[] = getButtonText(jsonObj);
    updateButtonText(buttonText);
  }
  
  mainTextDisplay();
  buttonsDisplay();
}

void mousePressed () {
  char val = mouseOverButton(mouseX, mouseY);
  println("Value: ", val);
}
