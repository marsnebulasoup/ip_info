import 'package:flutter/material.dart';

import 'general_card.dart';

class ErrorCard extends StatelessWidget {
  const ErrorCard({
    Key? key,
    required this.errorMsg,
  }) : super(key: key);
  final String errorMsg;

  @override
  Widget build(BuildContext context) {
    return GeneralCard(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          errorMsg,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
