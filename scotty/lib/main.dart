// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
import 'package:flutter/material.dart';
import 'package:scotty/screens/astroBinScreen.dart';
import 'package:scotty/screens/spaceFlightBlogsScreen.dart';
import 'package:scotty/screens/spaceFlightNewsScreen.dart';
import 'package:scotty/screens/spaceFlightReportsScreen.dart';
import 'package:scotty/screens/launchLibraryScreen.dart';
import 'package:scotty/screens/HubbleFeedScreen.dart';
import 'package:scotty/screens/IOTDScreen.dart';
import 'package:scotty/widgets/dashboard.dart';
import 'package:scotty/widgets/nasaLiveStream.dart';
import 'package:scotty/theme/style.dart';

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
        '/spaceFlightBlogs': (context) => SpaceFlightBlogsScreen(),
        '/spaceFlightReports': (context) => SpaceFlightReportsScreen(),
        '/nasaLiveStream': (context) => NasaLiveStream(),
        '/hubbleLiveFeed': (context) => HubbleFeedScreen(),
        '/astroBin': (context) => new AstroBinScreen(),
        '/launchLibrary': (context) => LaunchLibraryScreen(),
        '/IOTD': (context) => IOTDScreen(),
      },
      theme: scottyTheme(),
    );
  }
}