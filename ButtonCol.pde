// File to manage the column of buttons located in the top right

// Must be set in setup()
PImage openImg;
PImage saveImg;
PImage optImg;
PImage resImg;

// Each button has 50px of space
final int colWidth = 50 - padding/2;
final int colHeight = 50 - padding/2;
final int colX = 800 - colWidth - padding;

final Button openButton = new Button(colWidth, colHeight, "open", 10);
final Button saveButton = new Button(colWidth, colHeight, "save", 10);
final Button optButton  = new Button(colWidth, colHeight, "opt", 10);
final Button resButton  = new Button(colWidth, colHeight, "res", 10);

void initColButtons () {
  openButton.setX(colX);
  saveButton.setX(colX);
  optButton.setX (colX);
  resButton.setX (colX);

  openButton.setY(padding);
  saveButton.setY(padding*2 + colHeight);
  optButton.setY (padding*3 + colHeight*2);
  resButton.setY (padding*4 + colHeight*3);

  openButton.setImg(openImg);
  saveButton.setImg(saveImg);
  optButton.setImg(optImg);
  resButton.setImg(resImg);
}
