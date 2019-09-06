import 'package:flutter/material.dart';
import 'package:scotty/widgets/launch_library/launch_library_model.dart';
import 'package:url_launcher/url_launcher.dart';

class LaunchLibraryTile extends StatelessWidget {
  final LaunchModel _launchModel;
  LaunchLibraryTile(this._launchModel);

  @override
  Widget build(BuildContext context) => Column(children: <Widget>[
        makeLaunchLibraryCard(_launchModel),
  ]);
}

Card makeLaunchLibraryCard(LaunchModel launch) {
  return Card(
      margin: new EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(color: Colors.black87, ),
        child: new InkWell(
          onTap: () {
            _launchURL(launch.wiki);
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            verticalDirection: VerticalDirection.down,
            children: <Widget>[
              SizedBox(height: 50.0),
              Center(
                  child: Image.network(
                launch.launchImage,
                height: 200.0,
                fit: BoxFit.fill,
              )),
              SizedBox(height: 20.0),
              new Center(
                child: new Text(
                  launch.rocketName,
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
                  launch.description,
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
                  "Start:\n ${launch.launchStart}",
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
                  "End:\n ${launch.launchEnd}",
                  style: new TextStyle(
                    fontSize: 18.0,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 20.0),
              new InkWell(
                onTap: () {
                  _launchURL(launch.mapURL);
                },
                child: new Text(
                  "${launch.location}",
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
