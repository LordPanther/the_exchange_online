import 'package:flutter/material.dart';
import 'package:the_exchange_online/configs/size_config.dart';
import 'package:the_exchange_online/constants/color_constant.dart';

class DefaultButton extends StatelessWidget {
  final Function() onPressed;
  final Widget child;
  final Color backgroundColor;

  const DefaultButton({
    super.key,
    required this.onPressed,
    required this.child,
    this.backgroundColor = COLOR_CONST.primaryColor,
  });
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      height: SizeConfig.defaultSize * 5,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(backgroundColor: backgroundColor),
        child: child,
      ),
    );
  }
}
