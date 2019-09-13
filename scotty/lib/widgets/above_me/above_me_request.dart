import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';
import 'dart:convert';
import 'above_me_model.dart';

Future<List<AboveMeModel>> getAboveMe(Position position,
    {double degrees: 10, int category: 0}) async {
  List<AboveMeModel> satsAboveMe = [];
  final String url =
      "https://www.n2yo.com/rest/v1/satellite/above/${position.longitude}/${position.latitude}/${position.altitude}/$degrees/$category/&apiKey=668ERC-R8KBE8-MFS7S5-4778";

  final Response response = await http.get(url);

  final dynamic aboveJSON = json.decode(response.body)["above"];
  for (dynamic item in aboveJSON) {
    satsAboveMe.add(AboveMeModel.fromJSON(item));
  }

  return satsAboveMe;
}
