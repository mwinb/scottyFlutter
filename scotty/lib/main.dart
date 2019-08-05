// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.


import 'package:flutter/material.dart';
import 'package:scotty/screens/spaceFlightNewsScreen.dart';
import 'package:scotty/widgets/dashboard.dart';
import 'package:scotty/widgets/nasaLiveStream.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Scotty',
      initialRoute: '/',
      routes: {
        '/': (context) => Dashboard(),
        '/spaceFlightNews': (context) => SpaceFlightNewsScreen(),
        '/nasaLiveStream': (context) => NasaLiveStream(),
        '/hubbleLiveFeed': (context) => Dashboard(),
      },
    );
  }
}