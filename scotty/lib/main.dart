// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.
import 'package:flutter/material.dart';
import 'package:scotty/theme/style.dart';
import 'package:scotty/widgets/astro_bin/astro_bin_screen.dart';
import 'package:scotty/widgets/dashboard_screen.dart';
import 'package:scotty/widgets/hubble_live_feed/hubble_live_feed_screen.dart';
import 'package:scotty/widgets/iotd/iotd_screen.dart';
import 'package:scotty/widgets/above_me/above_me_screen.dart';
import 'package:scotty/widgets/launch_library/launch_library_screen.dart';
import 'package:scotty/widgets/space_flight_news/blog_screen/space_flight_blog_screen.dart';
import 'package:scotty/widgets/space_flight_news/news_screen/space_flight_news_screen.dart';
import 'package:scotty/widgets/space_flight_news_reports/space_flight_reports_screen.dart';
import 'package:scotty/widgets/geo_locator.dart';

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
        '/hubbleLiveFeed': (context) => HubbleFeedScreen(),
        '/astroBin': (context) => AstroBinScreen(),
        '/launchLibrary': (context) => LaunchLibraryScreen(),
        '/IOTD': (context) => IOTDScreen(),
        '/position': (context) => WhereAmI(),
        '/aboveMe': (context) => AboveMeScreen(),
      },
      theme: scottyTheme(),
    );
  }
}
