import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:scotty/common/Utilities.dart';

class WhereAmI extends StatefulWidget {
  @override
  _WhereAmIState createState() => _WhereAmIState();
}

class _WhereAmIState extends State<WhereAmI> {
  Geolocator geolocator = Geolocator();

  Position userLocation;

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: _buildBody(context),
    );
  }

  Widget _buildBody(BuildContext context) {
    if (userLocation != null) {
      return makeLocationCard(userLocation);
    } else {
      return new Center(child: new CircularProgressIndicator());
    }
  }

  void getLocation() async {
    try {
      userLocation = await geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best);
    } catch (e) {
      userLocation = null;
    }
    setState(() => userLocation);
  }
}

Card makeLocationCard(Position position) {
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
              makeTextCenter("Longitude: ${position.longitude}"),
              SizedBox(height: 20.0),
              makeTextCenter("Latitude: ${position.latitude}"),
              SizedBox(height: 20.0),
              makeTextCenter("Altitude: ${position.altitude}"),
              new InkWell(
                onTap: () {
                  Utilities.launchURL(Utilities.getLocationURL(
                      position.longitude, position.latitude));
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
