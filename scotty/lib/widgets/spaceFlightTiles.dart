import 'package:flutter/material.dart';
import 'package:scotty/models/spaceFlightNews.dart';

class SpaceFlightTile extends StatelessWidget {
  final SpaceFlightNews _spaceFlightNews;
  SpaceFlightTile(this._spaceFlightNews);

  @override
  Widget build(BuildContext context) => Column(
    children: <Widget>[
      ListTile(
        title: Text(_spaceFlightNews.title),
        subtitle: Text(_spaceFlightNews.newsSiteLong),
        leading: Container(
          margin: EdgeInsets.only(left: 6.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
            Image.network(_spaceFlightNews.featuredImage, height: 50.0, fit: BoxFit.fill),
          ]
        ),
      ),
      ),
      Divider()
    ],
  );
}