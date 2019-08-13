class AstroBinModel {
  final String urlHD;
  final String title;
  final String published;
  final String user;

  AstroBinModel.fromJSON(Map<String, dynamic> jsonMap) :
    urlHD = jsonMap['url_hd'],
    title = jsonMap['title'],
    published = jsonMap['published'],
    user = jsonMap['user'];
}