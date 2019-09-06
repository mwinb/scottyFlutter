import 'package:flutter/material.dart';
import 'package:youtube_player/youtube_player.dart';

class YoutubeFrame extends StatefulWidget {
  final String url;
  final String title;

  YoutubeFrame({@required this.url, @required this.title});

  @override
  _YoutubeFrame createState() => new _YoutubeFrame(url, title);


}

class _YoutubeFrame extends State<YoutubeFrame> {
  String url;
  String title;

  _YoutubeFrame(this.url, this.title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(this.title),
        elevation: .1,
      ),

      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 2.0),
        child: YoutubePlayer(
            context: context,
            source: this.url,
            quality: YoutubeQuality.HIGH,
            playerMode: YoutubePlayerMode.DEFAULT,
            isLive: true,)
        ),
    );
  }
}
