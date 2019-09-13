import 'dart:math';
import 'package:geolocator/geolocator.dart';
import 'package:url_launcher/url_launcher.dart';

class Utilities {
  static String verifyJsonString(Map<String, dynamic> map, String key) {
    return map[key] != null ? map[key] : '';
  }

  static int verifyJsonInt(Map<String, dynamic> map, String key) {
    return map[key] != null ? map[key] : 0;
  }

  static dynamic verifyJsonDouble(Map<String, dynamic> map, String key) {
    return map[key] != null ? map[key] : 0.0;
  }

  static String getDateStringFromPartialMills(int dateInMills) {
    int trailing = pow(10, 3);
    int fullDateInMills = dateInMills * trailing;
    String datePublished =
        new DateTime.fromMillisecondsSinceEpoch(fullDateInMills)
            .toUtc()
            .toString()
            .replaceAll(' ', 'T');
    return datePublished;
  }

  static String getFormattedDate(String ogDate) {
    String newDateString = ogDate;
    if (ogDate != '') {
      DateTime newDate = DateTime.parse(ogDate);
      newDateString = newDate.toLocal().toString();
      newDateString = newDateString.split(" ")[1].substring(0, 8) +
          " " +
          newDateString.split(" ")[0].split("-").reversed.join("-") +
          " " +
          newDate.toLocal().timeZoneName;
    }
    return newDateString;
  }

  static String flipDashSeperatedDate(String ogDate) {
    String newDateString = ogDate;
    if (ogDate != '') {
      return newDateString.split('-').reversed.join('-');
    }
    return newDateString;
  }

  static Future<Position> getCurrentPosition() async {
    Geolocator geolocator = new Geolocator();
    Position position = await geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.best);
    return position;
  }

  static String getLocationURL(dynamic satLong, dynamic satLat) {
    return "http://maps.google.com/maps?q=$satLat+N,+$satLong+E";
  }

  static void launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
