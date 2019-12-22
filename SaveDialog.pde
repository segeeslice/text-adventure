// Handle the saving of progress in adventures
// Save to path "data/saves/save{num}.json"
// Other info (like save title) will be located within the json file
// Start with hard-coded 3 saves; eventually bump up to any number

// --- GLOBAL VARIABLES ---

// Specifies whether or not the dialog should be displayed
Boolean saveActive = false;

// Dialog box variables
final Integer saveDialogW = 500;
final Integer saveDialogH = 300;

// Save button variables
final Integer saveW = saveDialogW - 100;
final Integer saveH = (saveDialogH - padding) / 3 - padding;

// --- CLASS EXTENSION ---

class SaveButton extends Button {

  SaveButton (int num) {
    super(saveW, saveH, "save" + (char)(num + '0'));
  }

  void doAction() {

  }
}

// Button variables
SaveButton buttonSave1 = null;
SaveButton buttonSave2 = null;
SaveButton buttonSave3 = null;

// --- UTIL METHODS ---

void toggleSaveDialog () {
  saveActive = !saveActive;

  final int saveDialogX = getTextMidX() - saveDialogW / 2;
  final int saveDialogY = getTextMidY() - saveDialogH / 2;

  if (saveActive) {
    buttonSave1 = new SaveButton(1);
    buttonSave2 = new SaveButton(2);
    buttonSave3 = new SaveButton(3);

    buttonSave1.setX(saveDialogX + padding);
    buttonSave2.setX(saveDialogX + padding);
    buttonSave3.setX(saveDialogX + padding);

    buttonSave1.setY(saveDialogY + padding);
    buttonSave2.setY(saveDialogY + buttonSave1.getH() + padding*2);
    buttonSave3.setY(saveDialogY + buttonSave2.getH()*2 + padding*3);

    updateDialogText();

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
// Buttons are displayed on top of this automatically
void saveDialog () {
  if (saveActive) {
    fill(40, 40, 40);
    rectMode(CENTER);
    rect(getTextMidX(), getTextMidY(), saveDialogW, saveDialogH);
  }
}

void updateDialogText () {
  for (int i = 1; i <= 3; i++) {
    String keyVal = "save" + (char)(i + '0');
    JSONObject temp = new JSONObject();

    try {
      temp = loadJSONObject("saves" + File.separator + keyVal + ".json");
    } catch (Exception e) {
      // Lack of a file just means it will not be loaded
      // Hide any exception for this for now
    }

    String saveText = "Save " + (char)(i + '0') + "\n";
    if (temp.size() == 0) {
      saveText += "[empty]";
    } else if (temp.isNull("saveText")) {
      saveText += "[untitled]";
    } else {
      saveText += temp.getString("saveText");
    }

    AllButtons.setButtonText(keyVal, saveText);
  }
}
