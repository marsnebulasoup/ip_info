import 'package:flutter/material.dart';

import 'copyable_text.dart';

class CaptionedText extends StatelessWidget {
  const CaptionedText({
    Key? key,
    required this.caption,
    required this.text,
    this.size = 24.0,
  }) : super(key: key);
  final String caption;
  final String text;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          caption,
          style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w700),
        ),
        CopyableText(
          text: text,
          size: size,
        ),
      ],
    );
  }
}
