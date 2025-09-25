import 'package:flutter/material.dart';
import 'package:the_exchange_online/constants/font_constant.dart';

class CenterButton extends StatelessWidget {
  final Function() onPressed;
  final String name;

  const CenterButton({
    super.key,
    required this.onPressed,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPressed,
      child: Text(
        name,
        style: FONT_CONST.REGULAR_DEFAULT_18,
      ),
    );
  }
}
