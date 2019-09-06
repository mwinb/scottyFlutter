import 'package:scotty/common/Utilities.dart';

class AstroBinModel {
  final String urlHD;
  final String title;
  final String published;
  final String user;

  AstroBinModel.fromJSON(Map<String, dynamic> jsonMap) :
    urlHD = Utilities.verifyJsonString(jsonMap, 'url_hd'),
    title = Utilities.verifyJsonString(jsonMap, 'title'),
    published = Utilities.verifyJsonString(jsonMap, 'published'),
    user = Utilities.verifyJsonString(jsonMap, 'user');
}