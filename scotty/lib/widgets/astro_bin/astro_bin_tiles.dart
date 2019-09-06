import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'astro_bin_model.dart';

class AstroBinTile extends StatelessWidget {
  final AstroBinModel _astroBinModel;
  AstroBinTile(this._astroBinModel);

  @override
  Widget build(BuildContext context) => Column(
        children: <Widget>[
          makeAstroBinCard(_astroBinModel, context),
        ],
      );
}

Widget makeAstroBinCard(AstroBinModel article, BuildContext context) {
  return InkWell(
      onTap: () {
        _launchURL(article.urlHD);
      },
      child: Container(
          constraints: new BoxConstraints.expand(
            height: MediaQuery.of(context).size.height,
          ),
          alignment: Alignment.bottomLeft,
          padding: EdgeInsets.only(bottom: 20),
          decoration: new BoxDecoration(
            image: new DecorationImage(
              image: new NetworkImage(article.urlHD),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              verticalDirection: VerticalDirection.down,
              children: <Widget>[
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
                new Center(
                  child: new Text(
                    article.published,
                    style: new TextStyle(
                      fontSize: 18.0,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                new InkWell(
                  onTap: () {
                    _launchURL(
                        "https://www.astrobin.com/users/${article.user}");
                  },
                  child: new Text(
                    article.user,
                    style: new TextStyle(
                        fontSize: 18.0,
                        color: Colors.blue,
                        decoration: TextDecoration.underline),
                    textAlign: TextAlign.center,
                  ),
                ),
              ])));
}
//Widget makeAstroBinCard(AstroBinModel article, BuildContext context) {
//  return Card(
//      elevation: 1.0,
//      margin: new EdgeInsets.all(8.0),
//      child: Container(
//        decoration: BoxDecoration(color: Colors.black87),
//        child: new InkWell(
//          onTap: () {
//            _launchURL(article.urlHD);
//          },
//          child: Column(
//            crossAxisAlignment: CrossAxisAlignment.center,
//            mainAxisSize: MainAxisSize.min,
//            verticalDirection: VerticalDirection.down,
//            children: <Widget>[
//              SizedBox(height: 50.0),
//              Center(
//                  child: Image.network(
//                article.urlHD,
//                height: 500.0,
//                width: 500.0,
//                fit: BoxFit.fill,
//              )),
//              SizedBox(height: 20.0),
//              new Center(
//                child: new Text(
//                  article.title,
//                  style: new TextStyle(
//                    fontSize: 18.0,
//                    color: Colors.white,
//                  ),
//                  textAlign: TextAlign.center,
//                ),
//              ),
//              SizedBox(height: 20.0),
//              new Center(
//                child: new Text(
//                  article.published,
//                  style: new TextStyle(
//                    fontSize: 18.0,
//                    color: Colors.white,
//                  ),
//                  textAlign: TextAlign.center,
//                ),
//              ),
//              SizedBox(height: 20.0),
//              new InkWell(
//                onTap: () {
//                  _launchURL("https://www.astrobin.com/users/${article.user}");
//                },
//                child: new Text(
//                  article.user,
//                  style: new TextStyle(
//                      fontSize: 18.0,
//                      color: Colors.blue,
//                      decoration: TextDecoration.underline),
//                  textAlign: TextAlign.center,
//                ),
//              ),
//              SizedBox(height: 20.0),
//            ],
//          ),
//        ),
//      ));
//}

_launchURL(url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}
