import 'dart:math';

class SpaceFlightNews {
  final String featuredImage;
  final String title;
  final String newsSiteLong;
  final String url;
  final String date;

  SpaceFlightNews.fromJSON(Map<String, dynamic> jsonMap) :
    featuredImage = jsonMap['featured_image'],
    title = jsonMap['title'],
    newsSiteLong = jsonMap['news_site_long'],
    url = jsonMap['url'],
    date = getDateString(jsonMap['date_published']);

  static String getDateString(int dateInMills) {
    int zeroOffSet = 7;
    int trailing = pow(10, 3);
    int fullDateInMills = dateInMills * trailing;
    String datePublished = new DateTime.fromMillisecondsSinceEpoch(fullDateInMills).toLocal().toString();
    return datePublished.substring(0, datePublished.length-zeroOffSet);
  }
}


