import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'space_flight_report_model.dart';

class SpaceFlightReportCard extends StatelessWidget {
  final SpaceFlightReport _spaceFlightNews;

  SpaceFlightReportCard(this._spaceFlightNews);

  @override
  Widget build(BuildContext context) =>
      Column(
        children: <Widget>[ makeSpaceFlightCard(_spaceFlightNews),
        ],
      );
}

Card makeSpaceFlightCard(SpaceFlightReport article) {
  return Card(
      elevation: 1.0,
      margin: new EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(color: Colors.black87),
        child: new InkWell(
          onTap: () {
            _launchURL(article.url);
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            verticalDirection: VerticalDirection.down,
            children: <Widget>[
              SizedBox(height: 20.0),
              new Center(
                child: new Text(article.title,
                  style:
                  new TextStyle(fontSize: 18.0, color: Colors.white,), textAlign: TextAlign.center,),
              ),
              SizedBox(height: 20.0),
              new Center(
                child: new Text(article.summary,
                  style:
                  new TextStyle(fontSize: 18.0, color: Colors.white,), textAlign: TextAlign.center,),
              ),
              SizedBox(height: 20.0),
              new Center(
                child: new Text(article.newsSiteLong,
                  style:
                  new TextStyle(fontSize: 18.0, color: Colors.white,), textAlign: TextAlign.center,),
              ),
              SizedBox(height: 20.0),
              new Center(
                child: new Text(article.datePublished,
                  style:
                  new TextStyle(fontSize: 18.0, color: Colors.white,), textAlign: TextAlign.center,),
              ),
              SizedBox(height: 20.0),
            ],
          ),
        ),
      ));
}

_launchURL(url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}