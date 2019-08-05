import 'package:flutter/material.dart';
import 'package:youtube_player/youtube_player.dart';

class NasaLiveStream extends StatefulWidget {
  @override
  _NasaLiveStreamState createState() => _NasaLiveStreamState();
}

class _NasaLiveStreamState extends State<NasaLiveStream> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Nasa Live Stream"),
        elevation: .1,
        backgroundColor: Color.fromRGBO(49, 87, 110, 1.0),


      ),

      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 2.0),
        child: YoutubePlayer(
            context: context,
            source: "21X5lGlDOfg",
            quality: YoutubeQuality.HD,
            startFullScreen: true,
            isLive: true,)
        ),
    );
  }
}
