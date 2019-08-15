class HubbleLiveFeedModel {
  final String image;
  final String title;
  final String description;
  final String publicationDate;
  final String articleLink;

  HubbleLiveFeedModel.fromJSON(Map<String, dynamic> jsonMap) :
        image = jsonMap['image_square_large'],
        title = jsonMap["title"],
        description = jsonMap["description"],
        publicationDate = jsonMap["pub_date"],
        articleLink = jsonMap["link"];

}