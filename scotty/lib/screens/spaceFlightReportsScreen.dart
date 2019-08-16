import 'package:flutter/material.dart';
import 'package:scotty/models/spaceFlightReport.dart';
import 'package:scotty/requests/spaceFlightReportsRequest.dart';
import 'package:scotty/widgets/spaceFlightReportsCards.dart';

class SpaceFlightReportsScreen extends StatefulWidget {
  @override
  _SpaceFlightReportsScreenState createState() => _SpaceFlightReportsScreenState();
}

class _SpaceFlightReportsScreenState extends State<SpaceFlightReportsScreen> {
  List<SpaceFlightReport> _articles = <SpaceFlightReport>[];

  @override
  void initState() {
    super.initState();
    listenForSpaceFlightReports();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      centerTitle: true,
      title: Text('Space Flight Reports'),
    ),
    body: ListView.builder(
      itemCount: _articles.length,
      itemBuilder: (context, index) => SpaceFlightReportCard(_articles[index]),
    ),
  );

  void listenForSpaceFlightReports() async {
    final stream = await getSpaceFlightReports('https://spaceflightnewsapi.net/api/v1/reports?limit=200');
    for (var item in stream) {
      _articles.add(item);
    }
    setState(() =>
      _articles
    );
  }
}