import 'package:scotty/common/Utilities.dart';

class AboveMeModel {
  final int satId;
  final String satName;
  final String intDesignator;
  // YYYY-MM-DD
  final String launchDate;
  final dynamic satLat;
  final dynamic satLng;
  final dynamic satAlt;
  final String locationURL;

  AboveMeModel.fromJSON(Map<String, dynamic> jsonMap)
      : satId = Utilities.verifyJsonInt(jsonMap, 'satid'),
        satName = Utilities.verifyJsonString(jsonMap, 'satname'),
        intDesignator = Utilities.verifyJsonString(jsonMap, 'intDesignator'),
        launchDate = Utilities.verifyJsonString(jsonMap, 'launchdate'),
        satLat = Utilities.verifyJsonDouble(jsonMap, 'satlat'),
        satLng = Utilities.verifyJsonDouble(jsonMap, 'satlng'),
        satAlt = Utilities.verifyJsonDouble(jsonMap, 'satalt'),
        locationURL = Utilities.getLocationURL(
            Utilities.verifyJsonDouble(jsonMap, 'satlng'),
            Utilities.verifyJsonDouble(jsonMap, 'satlat'));
}
