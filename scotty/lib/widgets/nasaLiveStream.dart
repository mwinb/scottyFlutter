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
      ),

      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 2.0),
        child: YoutubePlayer(
            context: context,
            source: "21X5lGlDOfg?cc_load_policy=1&autoplay=1&mute=1",
            quality: YoutubeQuality.HIGH,
            playerMode: YoutubePlayerMode.DEFAULT,
            isLive: true,)
        ),
    );
  }
}
