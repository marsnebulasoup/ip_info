import 'package:ip_info_api/ip_info.dart';
import 'package:test/test.dart';

import 'dummy_consts.dart';

void main() {
  group('LatLng', () {
    test('initiates', () {
      expect(
        () {
          return LatLng.fromJson(coordinatesMap);
        }(),
        equals(coordinatesObject),
      );
    });
    test(
      'toJson',
      (() {
        expect(
          coordinatesObject.toJson(),
          coordinatesJson,
        );
      }),
    );
  });
}
