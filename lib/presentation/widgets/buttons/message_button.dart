import 'package:flutter/cupertino.dart';
import 'package:the_exchange_online/configs/config.dart';
import 'package:the_exchange_online/constants/color_constant.dart';
import 'package:the_exchange_online/constants/constants.dart';
import 'icon_button_with_counter.dart';

class MessageButton extends StatelessWidget {
  final Color color;

  const MessageButton({
    super.key,
    this.color = COLOR_CONST.textColor,
  });
  @override
  Widget build(BuildContext context) {
    return IconButtonWithCounter(
      icon: const Icon(CupertinoIcons.mail_solid),
      onPressed: () {
        Navigator.pushNamed(context, "AppRouter.MESSAGES");
      },
      counter: 0,
      size: SizeConfig.defaultSize * 3,
      color: color,
    );
  }
}
