import 'package:scotty/common/Utilities.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  group('Utilities', () {
    test('returns an empty string if json item does not exist', () {
      Map<String, dynamic> jsonMap = new Map();
      String result = Utilities.verifyJsonString(jsonMap, 'test');
      expect(result, '');
    });

    test('returns the string for a key in a json map', () {
      Map<String, dynamic> jsonMap = {'test': 'TestString'};
      String result = Utilities.verifyJsonString(jsonMap, 'test');
      expect(result, 'TestString');
    });

    test('can convert time in partial milliseconds to a date string', () {
      int originalMilliseconds = 1568042640;
      String result =
          Utilities.getDateStringFromPartialMills(originalMilliseconds);
      expect(result, "2019-09-09T15:24:00.000Z");
    });

    test('converts UTC date string to formatted local time string', () {
      String testDateString = "2019-09-09T15:24:00.000Z";
      String formattedDateString = Utilities.getFormattedDate(testDateString);
      expect(formattedDateString, '09:24:00 09-09-2019 MDT');
    });

    test('flip YYYY-MM-DD into DD-MM-YYYY', () {
      String testDateString = "1965-07-20";
      String formattedDateString =
          Utilities.flipDashSeperatedDate(testDateString);
      expect(formattedDateString, "20-07-1965");
    });
  });
}
