import 'package:flutter/material.dart';
import 'package:scotty/models/AstroBinModel.dart';
import 'package:scotty/requests/astroBinRequest.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:url_launcher/url_launcher.dart';

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
          title: Text('AstroBin Astronomy Photos'),
        ),
        body: _buildBody(context),
      );

  Widget _buildBody(BuildContext context) {
    if (_articles.length > 0) {
      return new Swiper(
        itemBuilder: (BuildContext context, int index) {
          return makeAstroBinCard(_articles[index], context);
        },
        itemCount: _articles.length,
        control: new SwiperControl(color: Colors.white),
      );
    } else {
      return new Center(child: new CircularProgressIndicator());
    }
  }

  Widget makeAstroBinCard(AstroBinModel article, BuildContext context) {
    return InkWell(
        onTap: () {
          _launchURL(article.urlHD);
        },
        child: Container(
            constraints: new BoxConstraints.expand(
              height: MediaQuery.of(context).size.height,
            ),
            alignment: Alignment.bottomLeft,
            decoration: new BoxDecoration(
              image: new DecorationImage(
                image: new NetworkImage(article.urlHD),
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
                      article.title,
                      style: new TextStyle(
                        fontSize: 18.0,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  new Center(
                    child: new Text(
                      article.published,
                      style: new TextStyle(
                        fontSize: 18.0,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  new InkWell(
                    onTap: () {
                      _launchURL(
                          "https://www.astrobin.com/users/${article.user}");
                    },
                    child: new Text(
                      article.user,
                      style: new TextStyle(
                          fontSize: 18.0,
                          color: Colors.blue,
                          decoration: TextDecoration.underline),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ]
            )
        )
    );
  }

  void listenForAstroBinPhotos() async {
    final stream = await getAstroBinPhotos();
    for (var item in stream) {
      _articles.add(item);
    }
    setState(() => _articles);
  }

  _launchURL(url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
