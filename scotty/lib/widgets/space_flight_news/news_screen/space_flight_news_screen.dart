import 'package:flutter/material.dart';
import 'package:scotty/widgets/space_flight_news/space_flight_news_request.dart';
import 'package:scotty/widgets/space_flight_news/space_flight_news_model.dart';
import 'package:scotty/widgets/space_flight_news/space_flight_cards.dart';

class SpaceFlightNewsScreen extends StatefulWidget {
  @override
  _SpaceFlightNewsScreenState createState() => _SpaceFlightNewsScreenState();
}

class _SpaceFlightNewsScreenState extends State<SpaceFlightNewsScreen> {
  List<SpaceFlightNews> _articles = <SpaceFlightNews>[];

  @override
  void initState() {
    super.initState();
    listenForSpaceFlightArticles();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      centerTitle: true,
      title: Text('Space Flight News'),
    ),
    body: ListView.builder(
      itemCount: _articles.length,
      itemBuilder: (context, index) => SpaceFlightTile(_articles[index]),
    ),
  );

  void listenForSpaceFlightArticles() async {
    final stream = await getSpaceFlightArticles('https://spaceflightnewsapi.net/api/v1/articles?limit=200');
    for (var item in stream) {
      _articles.add(item);
    }
    setState(() =>
      _articles
    );
  }
}