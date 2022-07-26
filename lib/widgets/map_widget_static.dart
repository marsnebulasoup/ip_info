import 'package:maps_launcher/maps_launcher.dart';
import 'package:ip_info/models/ip_info.dart';
import 'package:flutter/material.dart';
import '../consts/constants.dart';

class MapWidgetStatic extends StatelessWidget {
  const MapWidgetStatic({Key? key, required this.ipInfo}) : super(key: key);
  final IpInfo ipInfo;

  void openInMapsApp() async {
    MapsLauncher.launchCoordinates(
      ipInfo.coordinates.latitude,
      ipInfo.coordinates.longitude,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: openInMapsApp,
      child: Image.network(
        "$ipImgUrl?ip=${ipInfo.ipAddress}",
      ),
    );
  }
}
