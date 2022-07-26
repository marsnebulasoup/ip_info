import 'dart:convert';
import 'package:http/http.dart' as http;
import '../consts/constants.dart';
import '../models/ip_info.dart';

class IpProvider {
  static Future<IpInfo?> fetchIpInfo() async {
    IpInfo? ipInfo;

    try {
      final response = await http.get(ipUri);
      if (response.statusCode == 200) {
        ipInfo = IpInfo.fromJson(jsonDecode(response.body));
      } else {
        throw Exception(
            'Failed to load IP info, status code: ${response.statusCode}');
      }
    } catch (e) {
      rethrow;
    }

    return ipInfo;
  }
}
