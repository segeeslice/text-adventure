// Get a JSONObject out of a passed file name
JSONObject parseJSON (String fileName) {
  JSONObject obj = new JSONObject();
  
  if (fileName != null && !fileName.isEmpty()) {
    try {
      obj = loadJSONObject(fileName);
    } catch (Exception e) {
      println("Could not load file: ", fileName, "\n Error:", e);
    }
  }
  
  return obj;
}

String getMainText(JSONObject obj) {
  return obj.isNull("mainText") ? "" : obj.getString("mainText");
}

// Return array of the button texts in order by number
String[] getJSONButtonText(JSONObject obj) {
  String ret[] = {"", "", "", ""};
  JSONObject searchObj;
  String keyVal;
  
  for (int i = 1; i <= 4; i++) {
    keyVal = "button" + (char)(i + '0');
    
    if (!obj.isNull(keyVal)) {
      searchObj = obj.getJSONObject(keyVal);
      ret[i-1] = searchObj.getString("text");
    }
  }
  
  return ret;
}

// Return array of the button destinations in order by number
String[] getJSONButtonDest(JSONObject obj) {
  String ret[] = {"", "", "", ""};
  JSONObject searchObj;
  String keyVal;
  
  for (int i = 1; i <= 4; i++) {
    keyVal = "button" + (char)(i + '0');
    
    if (!obj.isNull(keyVal)) {
      searchObj = obj.getJSONObject(keyVal);
      ret[i-1] = searchObj.getString("dest");
    }
  }
  
  
  return ret;
}
