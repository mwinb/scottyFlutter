import 'package:scotty/models/Utilities.dart';

class LaunchModel {
  final String launchImage;
  final String rocketName;
  final String description;
  final String launchStart;
  final String launchEnd;
  final String wiki;
  final String location;
  final String mapURL;

  LaunchModel.fromJSON(Map<String, dynamic> jsonMap) :
    launchImage = Utilities.verifyJsonString(jsonMap['rocket'], 'imageURL'),
    rocketName = Utilities.verifyJsonString(jsonMap, 'name'),
    description = getMissions(jsonMap),
    launchStart = Utilities.verifyJsonString(jsonMap, 'windowstart'),
    launchEnd = Utilities.verifyJsonString(jsonMap, 'windowend'),
    wiki = Utilities.verifyJsonString(jsonMap['rocket'], 'wikiURL'),
    location = Utilities.verifyJsonString(jsonMap['location'], 'name'),
    mapURL = getLaunchPadLocation(jsonMap);

  static String getMissions(Map<String, dynamic> jsonMap) {
    String missionString = '';
    if(jsonMap['missions'].length != 0)
      missionString = jsonMap['missions'][0]['description'];
    return missionString;
  }

  static String getLaunchPadLocation(Map<String, dynamic> jsonMap) {
    String launchPadString = '';
    if(jsonMap['location']['pads'].length > 0) {
      launchPadString = jsonMap['location']['pads'][0]['mapURL'];
    }
    return launchPadString;
  }
}