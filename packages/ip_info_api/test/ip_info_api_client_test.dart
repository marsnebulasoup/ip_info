import 'package:http/http.dart' as http;
import 'package:ip_info_api/ip_info.dart';
import 'package:ip_info_api/src/consts/urls.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import 'dummy_consts.dart';

class MockHttpClient extends Mock implements http.Client {}

class MockResponse extends Mock implements http.Response {}

class FakeUri extends Fake implements Uri {}

void main() {
  group('IpInfoApiClient', () {
    late http.Client httpClient;
    late IpInfoApiClient ipInfoApiClient;

    setUpAll(() {
      registerFallbackValue(FakeUri());
    });

    setUp(() {
      httpClient = MockHttpClient();
      ipInfoApiClient = IpInfoApiClient(httpClient: httpClient);
    });

    group('constructor', () {
      test('does not require an httpClient', () {
        expect(IpInfoApiClient(), isNotNull);
      });
    });

    group('ip info query', () {
      test('makes correct http request', () async {
        final response = MockResponse();
        when(() => response.statusCode).thenReturn(200);
        when(() => response.body).thenReturn('{}');
        when(() => httpClient.get(any())).thenAnswer((_) async => response);
        try {
          await ipInfoApiClient.fetchIpInfo();
        } catch (_) {}
        verify(
          () => httpClient.get(
            Uri.https(ipUrl, ''),
          ),
        ).called(1);
      });

      test('throws IpInfoBadStatusException on non-200 response', () async {
        final response = MockResponse();
        const statusCode = 400;
        when(() => response.statusCode).thenReturn(statusCode);
        when(() => httpClient.get(any())).thenAnswer((_) async => response);
        expect(
          () async => ipInfoApiClient.fetchIpInfo(),
          throwsA(predicate((e) =>
              e is IpInfoBadStatusException &&
              e.message ==
                  'Failed to load IP info. Server responded with status code $statusCode')),
        );
      });

      test('throws CheckedFromJsonException on empty response', () async {
        final response = MockResponse();
        when(() => response.statusCode).thenReturn(200);
        when(() => response.body).thenReturn('{}');
        when(() => httpClient.get(any())).thenAnswer((_) async => response);
        await expectLater(
          ipInfoApiClient.fetchIpInfo(),
          throwsA(isA<CheckedFromJsonException>()),
        );
      });

      test('returns IpInfo on valid response', () async {
        final response = MockResponse();
        when(() => response.statusCode).thenReturn(200);
        when(() => response.body).thenReturn(ipInfoJson);
        when(() => httpClient.get(any())).thenAnswer((_) async => response);
        final actual = await ipInfoApiClient.fetchIpInfo();
        expect(
          actual,
          equals(ipInfoObj),
        );
      });
    });
  });
}
