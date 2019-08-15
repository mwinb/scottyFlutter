import 'package:flutter/material.dart';
import 'package:scotty/requests/hubbleLiveFeedRequest.dart';
import 'package:scotty/models/HubbleLiveFeedModel.dart';
import 'package:scotty/widgets/hubbleLiveCards.dart';

class HubbleFeedScreen extends StatefulWidget {
  @override
  _HubbleFeedScreenState createState() => _HubbleFeedScreenState();
}

class _HubbleFeedScreenState extends State<HubbleFeedScreen> {
  List<HubbleLiveFeedModel> _feeds = <HubbleLiveFeedModel>[];

  @override
  void initState() {
    super.initState();
    listenForHubbleFeed();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      centerTitle: true,
      title: Text('Hubble Live Feed'),
    ),
    body: ListView.builder(
      itemCount: _feeds.length,
      itemBuilder: (context, index) => HubbleLiveCard(_feeds[index]),
    ),
  );

  void listenForHubbleFeed() async {
    final stream = await getHubbleLiveFeedArticles();
    for (var item in stream) {
      _feeds.add(item);
    }
    setState(() =>
    _feeds
    );
  }
}