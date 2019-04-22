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

  // Back button
  backImg = loadImage("back.png");

  // Button column
  openImg = loadImage("open.png");
  saveImg = loadImage("save.png");
  optImg = loadImage("opt.png");
  resImg = loadImage("res.png");

  initChoiceButtons();
  initColButtons();
  initText();
}

void draw () {
  background(40, 40, 40);
  mainTextDisplay();
  AllButtons.display();
}

synchronized void mousePressed () {
  Button clicked = AllButtons.mouseOverWhich(mouseX, mouseY);
  if (clicked == null) { return; }
  char clickKey = clicked.getK();

  switch (clickKey) {
    case 'O':
      selectInput("Select the starter file", "openFile");
      break;
    case 'S':
      break;
    case 'o':
      break;
    case 'R':
      break;
    default:
      jsonObj = parseJSONDefault(clicked.getDest(), jsonObj);

      if (jsonObj.size() != 0) {
        // Keep track of our path backwards
        if (clicked.getK() != 'B') {
          pushBackTrail(jsonObj, currFile);

        // Update the back button to the next item backwards
        } else {
          popBackTrail();
        }

        currFile = clicked.getDest();

        // Update the view and its data to reflect the new jsonObj
        updateView();
      }
  }
}

// -- UTIL FUNCTIONS ---

// Update the text to reflect the current jsonObj
void updateView () {
  String mainText = getMainText(jsonObj);
  updateMainText(mainText);

  String buttonText[] = getJSONButtonText(jsonObj);
  String buttonDest[] = getJSONButtonDest(jsonObj);
  updateChoiceButtonText(buttonText);
  updateChoiceButtonDest(buttonDest);
}

void openFile (File file) {
  if (file == null) {
    println("User did not enter a file");
    return;
  }

  JSONObject temp = parseJSON(file.getPath());
  if (temp.size() == 0) {
    println("Data file not found at", file.getPath());
    return;
  }

  jsonObj = temp;
  currFile = file.getPath();
  updateView();
}
