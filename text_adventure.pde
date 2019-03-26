JSONObject jsonObj = new JSONObject();

final String fontFile = "IBM_VGA8.ttf";
final int fontSize = 16;
final int padding = 16;

void setup () {
  size(800, 600);

  // Fonts are retrieved from the "data" folder
  textFont(createFont(fontFile, fontSize, false), fontSize);
  
  noSmooth();
  strokeWeight(2);
  stroke(0,255,51);
  
  backImg = loadImage("back.png");
  initButtons();
  initText();
  
  // Test file
  // TODO: Add button to load own file
  try {
    jsonObj = parseJSON("demoStart.json");
    updateView();
  } catch (Exception e) {
    println("Error:", e); 
  }
}

void draw () {
  background(40, 40, 40);
  mainTextDisplay();
  buttonsDisplay();
}

void mousePressed () {
  char clicked = mouseOverButton(mouseX, mouseY);
  String dest = getButtonDest(clicked);
  jsonObj = parseJSON(dest);
  
  if (jsonObj.size() != 0) {
    updateView();
  }
}

void updateView () {
  String mainText = getMainText(jsonObj);
  updateMainText(mainText);

  String buttonText[] = getJSONButtonText(jsonObj);
  String buttonDest[] = getJSONButtonDest(jsonObj);
  updateButtonText(buttonText);
  updateButtonDest(buttonDest);
}
