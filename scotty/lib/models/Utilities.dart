import 'dart:math';

class Utilities {
  static String verifyJsonString(Map<String, dynamic> map, String key) {
    return map[key] != null ? map[key] : '';
  }

  static String getDateStringFromPartialMills(int dateInMills) {
    int zeroOffSet = 7;
    int trailing = pow(10, 3);
    int fullDateInMills = dateInMills * trailing;
    String datePublished = new DateTime.fromMillisecondsSinceEpoch(fullDateInMills).toLocal().toString();
    return datePublished.substring(0, datePublished.length-zeroOffSet);
  }

  static String getFormattedDate(String ogDate) {
    String newDateString = ogDate;
    if(ogDate != '') {    
      DateTime newDate = DateTime.parse(ogDate);
      newDateString = newDate.toLocal().toString();
      int stringOffset = newDateString.length - 4;
      newDateString = newDateString.substring(0, stringOffset);
    }
    return newDateString;
  }
}