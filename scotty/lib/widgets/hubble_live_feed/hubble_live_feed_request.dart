import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:scotty/widgets/hubble_live_feed/hubble_live_feed_model.dart';

Future<List<HubbleLiveFeedModel>> getHubbleLiveFeedArticles() async {
  final String url = 'https://hubblesite.org/api/v3/external_feed/st_live';
  final response  = await http.get(url);
  final hubbleObjects = json.decode(response.body);
  List<HubbleLiveFeedModel> liveFeedObs = new List();
  for (var item in hubbleObjects) {
    liveFeedObs.add(HubbleLiveFeedModel.fromJSON(item));
  }
  return liveFeedObs;
}
