import 'package:flutter/material.dart';
import 'package:scotty/requests/IOTDRequest.dart';
import 'package:scotty/models/IOTDModel.dart';
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
      return new Center(child: new CircularProgressIndicator());
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
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                verticalDirection: VerticalDirection.down,
                children: <Widget>[
                  new Center(
                    child: new Text(
                      _image.title,
                      style: new TextStyle(
                        fontSize: 18.0,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  new Center(
                    child: new Text(
                      _image.copyright,
                      style: new TextStyle(
                        fontSize: 18.0,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  )])));

    } else if (_image.mediaType == 'video') {
      _launchURL(_image.url);
    }
    return widget;
  }

  void listenForIOTD() async {
    final image = await getImageOfTheDay();
    _image = image;
    setState(() => _image);
  }

  _launchURL(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
