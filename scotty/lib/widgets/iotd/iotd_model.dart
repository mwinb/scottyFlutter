import 'package:scotty/common/Utilities.dart';

class IOTDModel {
  final String url;
  final String title;
  final String copyright;
  final String publicationDate;
  final String mediaType;
  final String explanation;

  IOTDModel.fromJSON(Map<String, dynamic> jsonMap) :
        url = Utilities.verifyJsonString(jsonMap, 'url'),
        title = Utilities.verifyJsonString(jsonMap, 'title'),
        copyright = Utilities.verifyJsonString(jsonMap, 'copyright'),
        publicationDate = Utilities.verifyJsonString(jsonMap, 'date'),
        mediaType = Utilities.verifyJsonString(jsonMap, 'media_type'),
        explanation = Utilities.verifyJsonString(jsonMap, 'explanation');
  
}