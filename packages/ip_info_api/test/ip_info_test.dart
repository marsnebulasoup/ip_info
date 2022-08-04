import 'package:ip_info_api/ip_info.dart';
import 'package:test/test.dart';

import 'dummy_consts.dart';

void main() {
  group('IpInfo', () {
    test('initiates', () {
      expect(
        () {
          return IpInfo.fromJson(ipInfoMap);
        }(),
        equals(
          ipInfoObj,
        ),
      );
    });
    test('toString', () {
      expect(IpInfo.fromJson(ipInfoMap).toString(), equals(ipInfoString));
    });
  });
}
