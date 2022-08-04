import 'package:ip_info/widgets/map_widget_static.dart';
import 'package:flutter/material.dart';
import 'package:ip_info_api/ip_info.dart';

import 'captioned_text.dart';
import 'copyable_text.dart';
import 'general_card.dart';

class IpCard extends StatelessWidget {
  const IpCard({Key? key, required this.ipInfo}) : super(key: key);
  final IpInfo ipInfo;

  @override
  Widget build(BuildContext context) {
    return GeneralCard(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
          child: CaptionedText(
              caption: "YOUR PUBLIC IP ADDRESS",
              size: 28,
              text: ipInfo.ipAddress),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0, bottom: 10.0),
          child: CaptionedText(
              caption: "YOUR INTERNET PROVIDER", text: ipInfo.internetProvider),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 10.0, bottom: 0),
          child: CaptionedText(
              caption: "YOUR APPROXIMATE LOCATION",
              text: ipInfo.location.toString()),
        ),
        CopyableText(text: ipInfo.coordinates.toString(), size: 16),
        Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(35),
            child: MapWidgetStatic(ipInfo: ipInfo),
          ),
          // To display a live map image:
          // child: SizedBox(
          //   height: 250,
          //   child: ClipRRect(
          //     borderRadius: BorderRadius.circular(35),
          //     child: Align(
          //       child: MapWidget(coords: ipInfo.coordinates),
          //     ),
          //   ),
          // ),
        ),
      ],
    );
  }
}
