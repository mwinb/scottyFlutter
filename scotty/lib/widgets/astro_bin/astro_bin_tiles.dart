import 'package:flutter/material.dart';
import 'package:scotty/common/Utilities.dart';
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
        Utilities.launchURL(article.urlHD);
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
                    article.formattedDate,
                    style: new TextStyle(
                      fontSize: 18.0,
                      color: Colors.white,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                new InkWell(
                  onTap: () {
                    Utilities.launchURL(
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
