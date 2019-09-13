import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:scotty/common/Utilities.dart';
import 'above_me_request.dart';
import 'above_me_model.dart';
import 'above_me_cards.dart';

class AboveMeScreen extends StatefulWidget {
  @override
  _AboveMeScreenState createState() => _AboveMeScreenState();
}

class _AboveMeScreenState extends State<AboveMeScreen> {
  List<AboveMeModel> _satellites = <AboveMeModel>[];

  @override
  void initState() {
    super.initState();
    listenForSatsAboveMe();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text('Above Me'),
        ),
        body: ListView.builder(
          itemCount: _satellites.length,
          itemBuilder: (context, index) => AboveMeCard(_satellites[index]),
        ),
      );

  void listenForSatsAboveMe() async {
    final Position position = await Utilities.getCurrentPosition();
    final stream = await getAboveMe(position);
    for (var item in stream) {
      _satellites.add(item);
    }
    setState(() => _satellites);
  }
}
