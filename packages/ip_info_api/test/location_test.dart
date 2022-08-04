import 'package:ip_info_api/ip_info.dart';
import 'package:test/test.dart';

import 'dummy_consts.dart';

void main() {
  group('Location', () {
    test('initiates', () {
      expect(
        () {
          return Location.fromJson(locationMap);
        }(),
        equals(locationObject),
      );
    });
    test(
      'toJson',
      (() {
        expect(
          locationObject.toJson(),
          locationJson,
        );
      }),
    );
  });
}
