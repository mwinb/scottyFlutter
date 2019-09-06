import 'package:scotty/common/Utilities.dart';

class SpaceFlightNews {
  final String featuredImage;
  final String title;
  final String newsSiteLong;
  final String url;
  final String date;

  SpaceFlightNews.fromJSON(Map<String, dynamic> jsonMap) :
    featuredImage = Utilities.verifyJsonString(jsonMap, 'featured_image'),
    title = Utilities.verifyJsonString(jsonMap, 'title'),
    newsSiteLong = Utilities.verifyJsonString(jsonMap, 'news_site_long'),
    url = Utilities.verifyJsonString(jsonMap, 'url'),
    date = Utilities.getDateStringFromPartialMills(
      jsonMap['date_published']
    );
}


