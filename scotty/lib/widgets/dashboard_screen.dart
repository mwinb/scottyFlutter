import 'package:flutter/material.dart';
import 'package:scotty/common/Utilities.dart';

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
    makeDashboardItem(
        "Web View", Icons.home, context, 'https://mwinb.github.io/scotty'),
    makeDashboardItem("NASA Live", Icons.satellite, context,
        'https://www.youtube.com/embed/21X5lGlDOfg?cc_load_policy=1&autoplay=1&mute=1'),
    makeDashboardItem(
        "NASA Image of the Day", Icons.satellite, context, '/IOTD'),
    makeDashboardItem(
        "AstroBin Astronomy Photos", Icons.star, context, '/astroBin'),
    makeDashboardItem("Space Flight News", Icons.airplanemode_active, context,
        '/spaceFlightNews'),
    makeDashboardItem("Space Flight Blogs", Icons.airplanemode_active, context,
        '/spaceFlightBlogs'),
    makeDashboardItem("Space Flight Reports", Icons.airplanemode_active,
        context, '/spaceFlightReports'),
    makeDashboardItem("Launch Schedule", Icons.airplanemode_active, context,
        '/launchLibrary'),
    makeDashboardItem(
        "Hubble Live Feed", Icons.brightness_2, context, '/hubbleLiveFeed'),
    makeDashboardItem("Geo Locator", Icons.location_on, context, '/position'),
    makeDashboardItem(
        "Above Me", Icons.location_searching, context, '/aboveMe'),
  ];
}

Card makeDashboardItem(
    String title, IconData icon, BuildContext context, String route) {
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
                child: new Text(
                  title,
                  style: new TextStyle(
                    fontSize: 18.0,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
        ),
      ));
}

void executeLocation(BuildContext context, String route) {
  if (route.contains('https'))
    Utilities.launchURL(route);
  else
    Navigator.pushNamed(context, route);
}

