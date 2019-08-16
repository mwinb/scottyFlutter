class HubbleLiveFeedModel {
  final String image;
  final String title;
  final String description;
  final String publicationDate;
  final String articleLink;

  HubbleLiveFeedModel.fromJSON(Map<String, dynamic> jsonMap) :
        image = jsonMap['image_square'],
        title = jsonMap["title"],
        description = jsonMap["description"],
        publicationDate = getBetterDate(jsonMap["pub_date"]),
        articleLink = jsonMap["link"];

  static String getBetterDate(String ogDate) {
    DateTime newDate = DateTime.parse(ogDate);
    String newDateString = newDate.toLocal().toString();
    int stringOffset = newDateString.length - 4;
    return newDateString.substring(0, stringOffset);
  }
}