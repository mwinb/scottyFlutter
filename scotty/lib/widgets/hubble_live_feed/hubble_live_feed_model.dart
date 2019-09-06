import 'package:scotty/common/Utilities.dart';

class HubbleLiveFeedModel {
  final String image;
  final String title;
  final String description;
  final String publicationDate;
  final String articleLink;

  HubbleLiveFeedModel.fromJSON(Map<String, dynamic> jsonMap) :
    image = Utilities.verifyJsonString(jsonMap, 'image_square_large'),
    title = Utilities.verifyJsonString(jsonMap, 'title'),
    description = Utilities.verifyJsonString(jsonMap, 'description'),
    articleLink = Utilities.verifyJsonString(jsonMap, 'link'),
    publicationDate = Utilities.getFormattedDate(
      Utilities.verifyJsonString(jsonMap, 'pub_date')
    );
}