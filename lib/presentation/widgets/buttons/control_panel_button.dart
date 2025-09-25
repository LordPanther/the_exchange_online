import 'package:flutter/cupertino.dart';
import 'package:the_exchange_online/constants/font_constant.dart';

class PanelButton extends StatelessWidget {
  final Function() onTap;
  final String name;

  const PanelButton({
    super.key,
    required this.name,
    required this.onTap,
  });
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Text(
        name,
        style: FONT_CONST.REGULAR_DEFAULT_18,
      ),
    );
  }
}
