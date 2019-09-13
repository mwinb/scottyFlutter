import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

import 'astro_bin_model.dart';
import 'astro_bin_request.dart';
import 'astro_bin_tiles.dart';

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

  void listenForAstroBinPhotos() async {
    final stream = await getAstroBinPhotos();
    for (var item in stream) {
      _articles.add(item);
    }
    setState(() => _articles);
  }
}
