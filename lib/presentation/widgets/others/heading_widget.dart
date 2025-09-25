import 'package:flutter/material.dart';

class HeadingWidget extends StatelessWidget {
  final String text;
  final TextStyle style;
  const HeadingWidget({super.key, required this.text, required this.style});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          text,
          style: style,
        ),
      ],
    );
  }
}
