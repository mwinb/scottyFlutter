
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:scotty/models/AstroBinModel.dart';

Future<List<AstroBinModel>> getAstroBinPhotos() async {
  final int dateOffset = 14;
  final int limit = 200;
  final DateTime startDate = new DateTime.now();
  final DateTime endDate = startDate.subtract(new Duration(days: dateOffset));
  final String parsedStartDate = startDate.toIso8601String().split("T")[0];
  final String parsedEndDate = endDate.toIso8601String().split("T")[0];
  final String url = "https://astrobin.com/api/v1/image/?uploaded__gte=$parsedEndDate%200:00:00&uploaded__lt=$parsedStartDate%200:00:00&api_key=9985b5e659306f24f98faa7c5d78fae212622dc1&api_secret=766c984b731d1d522f8e8fb966ec3be20075c23c&limit=$limit";

  final response = await http.get(url);
  final astroBinObjects = json.decode(response.body)["objects"];
  List<AstroBinModel> astroBinPhotos = new List();
  for (var item in astroBinObjects) {
    astroBinPhotos.add(AstroBinModel.fromJSON(item));
  }
  astroBinPhotos.sort((a, b) => getAsDate(b.published).compareTo(getAsDate(a.published)));
  return astroBinPhotos;
}

DateTime getAsDate(String timeString) {
  return DateTime.parse(timeString);
}