
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'space_flight_report_model.dart';

Future<List<SpaceFlightReport>> getSpaceFlightReports(String url) async {
  final response = await http.get(url);
  final test = json.decode(response.body)["docs"];
  List<SpaceFlightReport> myNews = new List();
  for (var item in test) {
    myNews.add(SpaceFlightReport.fromJSON(item));
  }

  return myNews;
}