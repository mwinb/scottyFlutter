import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';


class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Scotty'),
      ),

      body: Container(
        padding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 2.0),
        child: GridView.count(
          crossAxisCount: 1,
          childAspectRatio: 1.75,
          padding: EdgeInsets.all(3.0),
          children: makeCardList(context),
        ),
      ),
    );
  }
}


List<Widget> makeCardList(BuildContext context) {
  return [
    makeDashboardItem("Nasa Live", Icons.satellite, context, 'https://www.youtube.com/embed/21X5lGlDOfg?cc_load_policy=1&autoplay=1&mute=1'),
    makeDashboardItem("Nasa Image of the Day", Icons.satellite, context, '/IOTD'),
    makeDashboardItem("Astro Bin Gallery", Icons.star, context, '/astroBin'),
    makeDashboardItem("Space Flight News", Icons.airplanemode_active, context, '/spaceFlightNews'),
    makeDashboardItem("Launch Schedule", Icons.airplanemode_active, context, '/launchLibrary'),
    makeDashboardItem("Hubble Live Feed", Icons.brightness_2, context, '/hubbleLiveFeed'),
  ];
}

Card makeDashboardItem(String title, IconData icon, BuildContext context, String route) {
  return Card(
      elevation: 1.0,
      margin: new EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(color: Colors.black87),
        child: new InkWell(
          onTap: () {
            executeLocation(context, route);
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisSize: MainAxisSize.min,
            verticalDirection: VerticalDirection.down,
            children: <Widget>[
              SizedBox(height: 50.0),
              Center(
                  child: Icon(
                    icon,
                    size: 60.0,
                    color: Colors.white,
                  )),
              SizedBox(height: 20.0),
              new Center(
                child: new Text(title,
                    style:
                    new TextStyle(fontSize: 18.0, color: Colors.white,), textAlign: TextAlign.center,),
              )
            ],
          ),
        ),
      ));
}

void executeLocation(BuildContext context, String route) {
  if (route.contains('https'))
    _launchURL(route);
  else
    Navigator.pushNamed(context, route);
}

_launchURL(url) async {
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw 'Could not launch $url';
  }
}