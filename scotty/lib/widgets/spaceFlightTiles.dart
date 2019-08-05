import 'package:flutter/material.dart';
import 'package:scotty/models/spaceFlightNews.dart';
import 'package:url_launcher/url_launcher.dart';

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
          child: 
            Image.network(_spaceFlightNews.featuredImage, height: 200.0, fit: BoxFit.fill),
        
        ),
        onTap: () => 
          _launchURL(_spaceFlightNews.url),
      ),
      Divider()
    ],
  );
}

_launchURL(url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}