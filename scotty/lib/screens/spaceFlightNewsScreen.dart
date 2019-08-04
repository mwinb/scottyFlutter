import 'package:flutter/material.dart';
import 'package:scotty/requests/spaceFlightNewsRequest.dart';
import 'package:scotty/models/spaceFlightNews.dart';
import 'package:scotty/widgets/spaceFlightTiles.dart';

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
    final stream = await getSpaceFlightArticles();
    for (var item in stream) {
      _articles.add(item);
    }
    setState(() => {
      _articles
    });
  }
}