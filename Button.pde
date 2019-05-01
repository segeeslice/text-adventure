import java.util.Vector;

// Class for storing meta data on buttons and internal functionality
class Button {
  // Top-left corner x and y coordinates
  private int x;
  private int y;

  // Width and height
  private int w;
  private int h;

  // Button identifier
  private String k;

  // Text to be displayed and destination when clicked
  private String textVal;
  private String dest;

  // Curve for the corner of the button (if any)
  private int dispCurve;

  // Image to be displayed in the button (if any)
  private PImage img;

  public Button () {
    x = y = w = h = dispCurve = 0;
    k = "";
    textVal = "";
    dest = "";
    img = new PImage();

    AllButtons.add(this);
  }

  public Button (int w_in, int h_in, String k_in) {
    x = y = dispCurve = 0;
    textVal = "";
    dest = "";

    w = w_in;
    h = h_in;
    k = k_in;

    img = new PImage();

    AllButtons.add(this);
  }

  public Button (int w_in, int h_in, String k_in, int dispCurve_in) {
    this(w_in, h_in, k_in);

    dispCurve = dispCurve_in;
  }

  public void setY (int y_in)  { y = y_in; }
  public void setX (int x_in)  { x = x_in; }
  public void setW (int w_in)  { w = w_in; }
  public void setH (int h_in)  { h = h_in; }
  public void setK (String k_in) { k = k_in; }
  public void setImg (PImage img_in) { img = img_in; }

  public void setText (String text_in) { textVal = text_in; }
  public void setDest (String dest_in) { dest = dest_in; }

  public int getX () { return x; }
  public int getY () { return y; }
  public int getW () { return w; }
  public int getH () { return h; }
  public String getK () { return k; }

  public String getDest () { return dest; }

  public void display () {
    fill(40,40,40);
    rectMode(CORNER);
    rect(x, y, w, h, dispCurve);

    textAlign(LEFT, TOP);
    rectMode(CORNERS);
    fill(0,255,51);
    text(textVal, x + 8, y + 8, x + w - 8, y + h - 8);

    int centerX = x + w / 2;
    int centerY = y + h / 2;

    imageMode(CENTER);
    image(img, centerX, centerY, w-padding, h-padding);
  }
};
