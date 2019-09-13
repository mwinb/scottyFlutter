import 'package:flutter/material.dart';
import 'package:scotty/common/Utilities.dart';
import 'package:scotty/widgets/space_flight_news/space_flight_news_model.dart';

class SpaceFlightTile extends StatelessWidget {
  final SpaceFlightNews _spaceFlightNews;

  SpaceFlightTile(this._spaceFlightNews);

  @override
  Widget build(BuildContext context) => Column(
        children: <Widget>[
          makeSpaceFlightCard(_spaceFlightNews),
        ],
      );
}

Card makeSpaceFlightCard(SpaceFlightNews article) {
  return Card(
      elevation: 1.0,
      margin: new EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(color: Colors.black87),
        child: new InkWell(
          onTap: () {
            Utilities.launchURL(article.url);
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            verticalDirection: VerticalDirection.down,
            children: <Widget>[
              SizedBox(height: 50.0),
              Center(
                  child: Image.network(
                article.featuredImage,
                height: 200.0,
                fit: BoxFit.fill,
              )),
              SizedBox(height: 20.0),
              new Center(
                child: new Text(
                  article.title,
                  style: new TextStyle(
                    fontSize: 18.0,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 20.0),
              new Center(
                child: new Text(
                  article.newsSiteLong,
                  style: new TextStyle(
                    fontSize: 18.0,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 20.0),
              new Center(
                child: new Text(
                  article.date,
                  style: new TextStyle(
                    fontSize: 18.0,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 20.0),
            ],
          ),
        ),
      ));
}
