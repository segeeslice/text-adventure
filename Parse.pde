String getMainText(JSONObject obj) {
  return obj.getString("mainText");
}


String[] getButtonText(JSONObject obj) {
  String ret[] = {"", "", "", ""};
  JSONObject searchObj;
  String keyVal;
  
  for (int i = 1; i <= 4; i++) {
    keyVal = "button" + (char)(i + '0');
    searchObj = obj.getJSONObject(keyVal);
    ret[i-1] = searchObj.getString("text");
  }
  
  return ret;
}
