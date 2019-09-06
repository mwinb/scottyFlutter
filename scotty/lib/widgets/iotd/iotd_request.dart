import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:scotty/widgets/iotd/iotd_model.dart';

Future<IOTDModel> getImageOfTheDay() async {
  final String url = 'https://api.nasa.gov/planetary/apod?api_key=x6vBGH5z5njOqWKVMz5pcXKnBPCYDDgGMeQaGcPl';
  final response  = await http.get(url);
  final imageOfTheDay = json.decode(response.body);
  return IOTDModel.fromJSON(imageOfTheDay);
}
