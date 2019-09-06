import 'package:flutter/material.dart';
import 'package:scotty/widgets/launch_library/launch_library_model.dart';
import 'package:scotty/widgets/launch_library/launch_library_request.dart';
import 'package:scotty/widgets/launch_library/launch_library_card.dart';

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