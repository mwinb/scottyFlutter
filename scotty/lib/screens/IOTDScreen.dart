import 'package:flutter/material.dart';
import 'package:scotty/requests/IOTDRequest.dart';
import 'package:scotty/models/IOTDModel.dart';
import 'package:youtube_player/youtube_player.dart';
import 'package:url_launcher/url_launcher.dart';

class IOTDScreen extends StatefulWidget {
  @override
  _IOTDScreenState createState() => _IOTDScreenState();
}

class _IOTDScreenState extends State<IOTDScreen> {
  IOTDModel _image;

  @override
  void initState() {
    super.initState();
    listenForIOTD();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      centerTitle: true,
      title: Text('Image of the Day'),
    ),
    body: buildImageOfTheDay(context),
  );

  Widget buildImageOfTheDay(BuildContext context) {
    Widget widget;
    if (_image == null) {
      return new Center(
          child: new CircularProgressIndicator());
    }
    if (_image.mediaType == 'image') {
      widget = InkWell(
          onTap: () {
            _launchURL('https://apod.nasa.gov/apod/astropix.html');
          },
          child: Container(
        constraints: new BoxConstraints.expand(
          height: MediaQuery.of(context).size.height,
        ),
        alignment: Alignment.bottomLeft,
        decoration: new BoxDecoration(
          image: new DecorationImage(
            image: new NetworkImage(_image.url),
            fit: BoxFit.cover,
          ),
        ),
        child: new Text('Title: ${_image.title}\n'
            'Copywrite: ${_image.copyright}',
            style: new TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20.0,
              color: Colors.white,
            )
        ),
      )
      );
    }
    else if (_image.mediaType == 'video') {
      widget = YoutubePlayer(
        context: context,
        source: "21X5lGlDOfg?cc_load_policy=1&autoplay=1&mute=1",
        quality: YoutubeQuality.HIGH,
        playerMode: YoutubePlayerMode.DEFAULT,
        isLive: true,);

    }
    return widget;
  }
  void listenForIOTD() async {
    final image = await getImageOfTheDay();
    _image = image;
    setState(() =>
    _image
    );
  }

  _launchURL(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}