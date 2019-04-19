JSONObject jsonObj = new JSONObject();
String currFile = "";

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
  openImg = loadImage("open.png");
  initButtons();
  initText();
  
  // Test file
  // TODO: Add button to load own file
  try {
    jsonObj = parseJSON("demoStart.json");
    currFile = "demoStart.json";
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

synchronized void mousePressed () {
  // Basic input processing
  char clicked = mouseOverButton(mouseX, mouseY);
  String dest = getButtonDest(clicked);
  
  if (dest.isEmpty()) { return; }
  
  jsonObj = parseJSONDefault(dest, jsonObj);

  if (jsonObj.size() != 0) {
    // Keep track of our path backwards
    if (clicked != 'B') {
      pushBackTrail(jsonObj, currFile);
    // Update the back button to the next item backwards
    } else {
      popBackTrail();
    }
    
    currFile = dest;
    
    // Update the view and its data to reflect the new jsonObj
    updateView();
  }
}

// -- UTIL FUNCTIONS ---

// Update jsonObj based on what button was clicked
void updateJSONObj (char clicked) {
  String dest = getButtonDest(clicked);
  jsonObj = parseJSONDefault(dest, jsonObj);
}

// Update the text to reflect the current jsonObj
void updateView () {
  String mainText = getMainText(jsonObj);
  updateMainText(mainText);

  String buttonText[] = getJSONButtonText(jsonObj);
  String buttonDest[] = getJSONButtonDest(jsonObj);
  updateButtonText(buttonText);
  updateButtonDest(buttonDest);
}
