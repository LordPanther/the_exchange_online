import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:the_exchange_online/configs/size_config.dart';
import 'package:the_exchange_online/constants/font_constant.dart';

class OfferSubscription extends StatelessWidget {
  final String title;
  final Widget? leader;

  const OfferSubscription({
    super.key,
    required this.title,
    this.leader,
  });
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        leader!,
        SizedBox(width: SizeConfig.defaultSize * 1.7),
        Text(title, style: FONT_CONST.MEDIUM_DEFAULT_18),
      ],
    );
  }
}
