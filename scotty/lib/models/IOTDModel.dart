class IOTDModel {
  final String url;
  final String title;
  final String copyright;
  final String publicationDate;
  final String mediaType;
  final String explanation;

  IOTDModel.fromJSON(Map<String, dynamic> jsonMap) :
        url = jsonMap['url'],
        title = jsonMap['title'],
        copyright = jsonMap['copyright'],
        publicationDate = jsonMap['date'],
        mediaType = jsonMap['media_type'],
        explanation = jsonMap['explanation'];
}