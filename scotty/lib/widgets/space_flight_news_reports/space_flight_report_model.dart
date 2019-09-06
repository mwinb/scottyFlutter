import 'package:scotty/common/Utilities.dart';

class SpaceFlightReport {
  final String url;
  final String title;
  final String summary;
  final String datePublished;
  final String newsSiteLong;

  SpaceFlightReport.fromJSON(Map<String, dynamic> jsonMap) :
    url = Utilities.verifyJsonString(jsonMap, 'url'),
    title = Utilities.verifyJsonString(jsonMap, 'title'),
    summary = Utilities.verifyJsonString(jsonMap, 'summary'),
    newsSiteLong = Utilities.verifyJsonString(jsonMap, 'news_site_long'),
    datePublished = Utilities.getDateStringFromPartialMills(
      jsonMap['date_published']
    );
}