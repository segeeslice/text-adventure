// Handle the saving of progress in adventures
// Save to path "data/saves/save{num}"
// User can add a save title; will append via "save{num}_This_Is_My_Title"
// Start with hard-coded 3 saves; eventually bump up to any number

// Specifies whether or not the dialog should be displayed
Boolean saveActive = false;

// Dialog box variables
final Integer saveDialogW = 500;
final Integer saveDialogH = 300;
Integer saveDialogX, saveDialogY, saveDialogXCorner, saveDialogYCorner;

// Button variables
Integer saveH, saveW;
Button buttonSave1 = null;
Button buttonSave2 = null;
Button buttonSave3 = null;

void initSave () {
  saveDialogX = getTextMidX();
  saveDialogY = getTextMidY();
  saveW = saveDialogW - 100;
  saveH = (saveDialogH - padding) / 3 - padding;

  saveDialogXCorner = saveDialogX - saveDialogW/2;
  saveDialogYCorner = saveDialogY - saveDialogH/2;
}

void saveToggle() {
  saveActive = !saveActive;

  if (saveActive) {
    buttonSave1 = new Button(saveW, saveH, "save1");
    buttonSave2 = new Button(saveW, saveH, "save2");
    buttonSave3 = new Button(saveW, saveH, "save3");

    buttonSave1.setX(saveDialogXCorner + padding);
    buttonSave2.setX(saveDialogXCorner + padding);
    buttonSave3.setX(saveDialogXCorner + padding);

    buttonSave1.setY(saveDialogYCorner + padding);
    buttonSave2.setY(saveDialogYCorner + saveH + padding*2);
    buttonSave3.setY(saveDialogYCorner + saveH*2 + padding*3);

  } else {
    AllButtons.remove(buttonSave1);
    AllButtons.remove(buttonSave2);
    AllButtons.remove(buttonSave3);

    buttonSave1 = null;
    buttonSave2 = null;
    buttonSave3 = null;
  }
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

// Display the user's currently saved games for opening
// Each save box has 100 px of height room
void saveDialog () {
  if (saveActive) {
    fill(40, 40, 40);
    rectMode(CENTER);
    rect(saveDialogX, saveDialogY, 500, 300);
  }
}
