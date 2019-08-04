import 'package:flutter/material.dart';

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
        title: Text("Scotty"),
        elevation: .1,
        backgroundColor: Color.fromRGBO(49, 87, 110, 1.0),


      ),

      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 2.0),
        child: GridView.count(
          crossAxisCount: 2,
          padding: EdgeInsets.all(3.0),
          children: makeCardList(context),
        ),
      ),
    );
  }
}


List<Widget> makeCardList(BuildContext context) {
  return [
    makeDashboardItem("Nasa Live", Icons.satellite, context, '/nasaLiveStream'),
    makeDashboardItem("Nasa Image of the Day", Icons.satellite, context, '/nasaIOTD'),
    makeDashboardItem("Astro Bin Gallery", Icons.star, context, '/astroBin'),
    makeDashboardItem("Space Flight News", Icons.airplanemode_active, context, '/spaceFlightNews'),
    makeDashboardItem("Launch Schedule", Icons.airplanemode_active, context, '/launchSchedule'),
    makeDashboardItem("Hubble Live Feed", Icons.brightness_2, context, '/hubbleLiveFeed'),
  ];
}
Card makeDashboardItem(String title, IconData icon, BuildContext context, String route) {
  return Card(
      elevation: 1.0,
      margin: new EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(color: Color.fromRGBO(49, 87, 110, 1.0)),
        child: new InkWell(
          onTap: () {
            Navigator.pushNamed(context, route);
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            verticalDirection: VerticalDirection.down,
            children: <Widget>[
              SizedBox(height: 50.0),
              Center(
                  child: Icon(
                    icon,
                    size: 40.0,
                    color: Colors.white,
                  )),
              SizedBox(height: 20.0),
              new Center(
                child: new Text(title,
                    style:
                    new TextStyle(fontSize: 18.0, color: Colors.white)),
              )
            ],
          ),
        ),
      ));
}