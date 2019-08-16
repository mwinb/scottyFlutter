import 'package:flutter/material.dart';
import 'package:scotty/models/LaunchModel.dart';
import 'package:scotty/requests/launchLibraryRequest.dart';
import 'package:scotty/widgets/launchLibraryTile.dart';

class LaunchLibraryScreen extends StatefulWidget {
  @override
  _LaunchLibraryScreenState createState() => _LaunchLibraryScreenState();
}

class _LaunchLibraryScreenState extends State<LaunchLibraryScreen> {
  List<LaunchModel> _launches = <LaunchModel>[];

  @override
  void initState() {
    super.initState();
    listenForLaunches();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      centerTitle: true,
      title: Text('Launch Schedule'),
    ),
    body: ListView.builder(
      itemCount: _launches.length,
      itemBuilder: (context, index) => LaunchLibraryTile(_launches[index]),
    ),
  );

  void listenForLaunches() async {
    final stream = await getLaunchLibrary();
    for (var item in stream) {
      _launches.add(item);
    }
    setState(() => 
      _launches
    );
  }
}