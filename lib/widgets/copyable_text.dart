import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CopyableText extends StatelessWidget {
  const CopyableText({
    Key? key,
    required this.text,
    this.size = 24,
    this.fontWeight = FontWeight.w700,
  }) : super(key: key);

  final String text;
  final double size;
  final FontWeight fontWeight;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        HapticFeedback.lightImpact();
        Clipboard.setData(ClipboardData(text: text));
      },
      style: TextButton.styleFrom(
        primary: Colors.black,
        padding: EdgeInsets.zero,
        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
      ),
      child: Text(
        text,
        style: TextStyle(fontSize: size, fontWeight: fontWeight),
      ),
    );
  }
}
