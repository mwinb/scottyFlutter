import 'package:flutter/material.dart';
import 'package:scotty/common/Utilities.dart';
import 'above_me_model.dart';

class AboveMeCard extends StatelessWidget {
  final AboveMeModel _aboveMe;

  AboveMeCard(this._aboveMe);

  @override
  Widget build(BuildContext context) => Column(
        children: <Widget>[makeAboveMeCard(_aboveMe)],
      );
}

Card makeAboveMeCard(AboveMeModel objectAboveMe) {
  return Card(
      elevation: 1.0,
      margin: new EdgeInsets.all(8.0),
      child: Container(
          decoration: BoxDecoration(color: Colors.black87),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            verticalDirection: VerticalDirection.down,
            children: <Widget>[
              SizedBox(height: 20.0),
              makeTextCenter("Sat Name: ${objectAboveMe.satName}"),
              SizedBox(height: 20.0),
              makeTextCenter("Sat ID: ${objectAboveMe.satId}"),
              SizedBox(height: 20.0),
              makeTextCenter("Longitude: ${objectAboveMe.satLng}"),
              SizedBox(height: 20.0),
              makeTextCenter("Latitude: ${objectAboveMe.satLat}"),
              SizedBox(height: 20.0),
              makeTextCenter("Altitude: ${objectAboveMe.satAlt}"),
              new InkWell(
                onTap: () {
                  
                  Utilities.launchURL(objectAboveMe.locationURL);
                },
                child: new Text(
                  "See on map.",
                  style: new TextStyle(
                    fontSize: 18.0,
                    color: Colors.lightBlue,
                    decoration: TextDecoration.underline,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 20.0),
            ],
          )));
}

Center makeTextCenter(String text) {
  return new Center(
    child: new Text(
      text,
      style: new TextStyle(
        fontSize: 18.0,
        color: Colors.white,
      ),
      textAlign: TextAlign.center,
    ),
  );
}

