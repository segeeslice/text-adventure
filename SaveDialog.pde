// Handle the saving of progress in adventures
// Save to path "data/saves/save{num}"
// User can add a save title; will append via "save{num}_This_Is_My_Title"
// Start with hard-coded 3 saves; eventually bump up to any number

Boolean saveActive = false;

void saveToggle() {
  saveActive = !saveActive;
}

void saveProgress (File file) {
  if (file == null) {
    println("User did not enter a file");
    return;
  }

  try {
    FileWriter fileWrite = new FileWriter(file.getPath());
    fileWrite.write(jsonObj.toString());
    fileWrite.flush();

  } catch (IOException e) {
    e.printStackTrace();
  }
}

Integer saveX, saveY;

final Button buttonSave1 = null;
final Button buttonSave2 = null;
final Button buttonSave3 = null;

void initSave () {
  saveX = getTextMidX();
  saveY = getTextMidY();
}

// Display the user's currently saved games for opening
// Each save box has 100 px of height room
void saveDialog () {
  if (saveActive) {
    fill(40, 40, 40);
    rectMode(CENTER);
    rect(saveX, saveY, 500, 300);
  }
}
