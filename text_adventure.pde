import java.io.FileWriter;

JSONObject jsonObj = new JSONObject();
String currFile = ""; // Store full path to the current file
String currPath = ""; // Store just parent directory of current adventure

final String fontFile = "IBM_VGA8.ttf";
final int fontSize = 16;
final static int padding = 16;

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
  initSave();
}

void draw () {
  background(40, 40, 40);
  mainTextDisplay();
  saveDialog();
  AllButtons.display();
  saveDialog();
  AllButtons.display();
}

synchronized void mousePressed () {
  Button clicked = AllButtons.mouseOverWhich(mouseX, mouseY);
  if (clicked == null) { return; }
  String clickKey = clicked.getK();

  switch (clickKey) {
    case "open":
      // In the future, adapt to open from save or from starter file
      selectInput("Select a starter or save file", "openFile");
      break;
    case "save":
      // TODO: Have a menu appear with various save locations?
      // Currently just saves the output. May need to add
      // special "save" file type
      saveToggle();
      break;
    case "opt":
      break;
    case "res":
      break;
    default:

      // Temporarily allow separate logic for back
      // Don't modify since temp
      if (clicked.getK().equals("back")) {
        // Just to silence some errors that would arise when trying to load dest
        if (clicked.getDest().isEmpty()) { return; }

        // Allow for files from any location
        // Only set current file to the file name
        String destFile = clicked.getDest();
        String destFullPath = currPath + File.separator + destFile;

        jsonObj = parseJSON(destFullPath);

        if (jsonObj.size() != 0) {
          // Keep track of our path backwards
          if (!clicked.getK().equals("back")) {
            pushBackTrail(jsonObj, currFile);

            // Update the back button to the next item backwards
          } else {
            popBackTrail();
          }

          currFile = destFile;

          // Update the view and its data to reflect the new jsonObj
          updateView();
        }
      } else {
        clicked.doAction();
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
    // TODO: Pop-up dialog to user?
    println("Data file not found at", file.getPath());
    return;
  }

  jsonObj = temp;
  currFile = file.getName();
  currPath = file.getParent(); // Store path so user can store data wherever they want
  updateView();
}

