
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:scotty/models/LaunchModel.dart';

Future<List<LaunchModel>> getLaunchLibrary() async {
  final String url = 'https://launchlibrary.net/1.4/launch/next/50';

  final response = await http.get(url);
  final test = json.decode(response.body)["launches"];
  List<LaunchModel> myLaunches = new List();
  for (var item in test) {
    myLaunches.add(LaunchModel.fromJSON(item));
  }

  return myLaunches;
}