import 'package:scotty/common/Utilities.dart';

class AstroBinModel {
  final String urlHD;
  final String title;
  final String user;
  final String published;
  final String formattedDate;

  AstroBinModel.fromJSON(Map<String, dynamic> jsonMap)
      : urlHD = Utilities.verifyJsonString(jsonMap, 'url_hd'),
        title = Utilities.verifyJsonString(jsonMap, 'title'),
        published = Utilities.verifyJsonString(jsonMap, 'published'),
        formattedDate = Utilities.verifyJsonString(jsonMap, 'published') == ''
            ? ''
            : Utilities.getFormattedDate(jsonMap['published']),
        user = Utilities.verifyJsonString(jsonMap, 'user');
}
