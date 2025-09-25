import 'package:the_exchange_online/configs/size_config.dart';
import 'package:flutter/material.dart';

class UtilSnackBar {
  static showSnackBarContent(BuildContext context, {String? content}) {
    final snackBar = SnackBar(
      content: Center(child: Text(content!)),
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.all(SizeConfig.defaultSize * 5),
      elevation: SizeConfig.defaultSize * 3,
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
