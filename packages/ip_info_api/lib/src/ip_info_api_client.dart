import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:ip_info_api/src/consts/urls.dart';
import 'package:ip_info_api/src/models/models.dart';

class IpInfoApiClient {
  final http.Client _httpClient;

  IpInfoApiClient({http.Client? httpClient})
      : _httpClient = httpClient ?? http.Client();

  Future<IpInfo> fetchIpInfo() async {
    IpInfo ipInfo;

    try {
      final response = await _httpClient.get(Uri.https(ipUrl, ''));
      if (response.statusCode == 200) {
        ipInfo = IpInfo.fromJson(jsonDecode(response.body));
      } else {
        throw IpInfoBadStatusException(response.statusCode);
      }
    } catch (e) {
      rethrow;
    }

    return ipInfo;
  }
}

class IpInfoBadStatusException implements Exception {
  final int statusCode;

  IpInfoBadStatusException(this.statusCode);

  String get message =>
      'Failed to load IP info. Server responded with status code $statusCode';
}
