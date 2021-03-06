
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:scotty/widgets/space_flight_news/space_flight_news_model.dart';

Future<List<SpaceFlightNews>> getSpaceFlightArticles(String url) async {
  final response = await http.get(url);
  final test = json.decode(response.body)["docs"];
  List<SpaceFlightNews> myNews = new List();
  for (var item in test) {
    myNews.add(SpaceFlightNews.fromJSON(item));
  }

  return myNews;
}