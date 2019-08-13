import 'package:flutter/material.dart';
import 'package:scotty/models/AstroBinModel.dart';
import 'package:scotty/requests/astroBinRequest.dart';
import 'package:scotty/widgets/astroBinTiles.dart';

class AstroBinScreen extends StatefulWidget {
  @override
  _AstroBinScreenState createState() => _AstroBinScreenState();
}

class _AstroBinScreenState extends State<AstroBinScreen> {
  List<AstroBinModel> _articles = <AstroBinModel>[];

  @override
  void initState() {
    super.initState();
    listenForAstroBinPhotos();
  }



  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      centerTitle: true,
      title: Text('Astro Bin Gallery'),
    ),
    body: ListView.builder(
      itemCount: _articles.length,
      itemBuilder: (context, index) => AstroBinTile(_articles[index]),
    ),
  );

  void listenForAstroBinPhotos() async {
    final stream = await getAstroBinPhotos();
    for (var item in stream) {
      _articles.add(item);
    }
    setState(() => 
      _articles
    );
  }
}