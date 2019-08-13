
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:scotty/models/SpaceFlightNewsModel.dart';

Future<List<SpaceFlightNews>> getSpaceFlightArticles() async {
  final String url = 'https://spaceflightnewsapi.net/api/v1/articles?limit=200';

  final response = await http.get(url);
  final test = json.decode(response.body)["docs"];
  List<SpaceFlightNews> myNews = new List();
  for (var item in test) {
    myNews.add(SpaceFlightNews.fromJSON(item));
  }

  return myNews;
}