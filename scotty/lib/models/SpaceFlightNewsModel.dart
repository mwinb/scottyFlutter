class SpaceFlightNews {
  final String featuredImage;
  final String title;
  final String newsSiteLong;
  final String url;

  SpaceFlightNews.fromJSON(Map<String, dynamic> jsonMap) :
    featuredImage = jsonMap['featured_image'],
    title = jsonMap['title'],
    newsSiteLong = jsonMap['news_site_long'],
    url = jsonMap['url'];

}