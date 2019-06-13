// Handle the saving of progress in adventures
// Save to path "data/saves/save{num}.json"
// Other info (like save title) will be located within the json file
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
    rect(saveDialogX, saveDialogY, 500, 300);
  }
}
