import 'dart:math';

class SpaceFlightReport {
  final String url;
  final String title;
  final String summary;
  final String datePublished;
  final String newsSiteLong;

  SpaceFlightReport.fromJSON(Map<String, dynamic> jsonMap) :
    url = jsonMap['url'],
    title = jsonMap['title'],
    summary = jsonMap['summary'],
    datePublished = getDateString(jsonMap['date_published']),
    newsSiteLong = jsonMap['news_site_long'];


  static String getDateString(int dateInMills) {
    int zeroOffSet = 7;
    int trailing = pow(10, 3);
    int fullDateInMills = dateInMills * trailing;
    String datePublished = new DateTime.fromMillisecondsSinceEpoch(fullDateInMills).toLocal().toString();
    return datePublished.substring(0, datePublished.length-zeroOffSet);
  }


}