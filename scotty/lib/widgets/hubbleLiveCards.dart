import 'package:flutter/material.dart';
import 'package:scotty/models/HubbleLiveFeedModel.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:scotty/widgets/NetworkImageSSL.dart';

class HubbleLiveCard extends StatelessWidget {
  final HubbleLiveFeedModel _hubbleFeed;
  HubbleLiveCard(this._hubbleFeed);

  @override
  Widget build(BuildContext context) => Column(children: <Widget>[
    makeHubbleLiveFeedCard(_hubbleFeed, context),
  ]);
}

_launchURL(url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}

Widget makeHubbleLiveFeedCard(HubbleLiveFeedModel feed, BuildContext context) {
  return Card(
      margin: new EdgeInsets.all(8.0),
      child: Container(
          decoration: BoxDecoration(
            color: Colors.black87,
          ),
          child: new InkWell(
            onTap: () {
              _launchURL(feed.articleLink);
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              verticalDirection: VerticalDirection.down,
              children: <Widget>[
                Center(
                  child: new Image(
                    image: NetworkImageSSL('http:${feed.image}'),
                    height: MediaQuery.of(context).size.width,
                    width: MediaQuery.of(context).size.width,
                    fit: BoxFit.fill,
                  )
                ),
                SizedBox(height: 20.0),
                new Center(
                  child: new Text(
                    feed.title,
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
                    feed.description,
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
                    feed.publicationDate,
                    style: new TextStyle(
                      fontSize: 18.0,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 20.0),
              ]
            )
          )
      )
  );
}
