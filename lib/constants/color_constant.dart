// ignore_for_file: camel_case_types

import 'package:flutter/material.dart';

class COLOR_CONST {
  static const primaryColor = Color(0xFF30b9b2);
  static const primaryLight = Color(0xFF40F3EA);
  static const secondary = Color(0xFFFFa44F);
  static const tertiaryColor = Color(0xFF0078a6);
  static const greyColor = Color(0xFF83829A);
  static const lightGrey = Color(0xFFC1C0C8);
  static const whiteColor = Color(0xFFFFFFFF);
  static const lightWhite = Color(0xFFFAFAFC);
  static const darkColor = Color(0xFF000000);
  static const redColor = Color(0xFFe81e4d);
  static const backgroundColor = Color(0xFFF3F4F8);
  static const primaryGradientColor = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Color(0xFF25164d), Colors.white],
  );

  static const secondaryColor = Color(0xFF979797);
  static const textColor = Color(0xFF4a4a4a);
  static const googleButtonColor = Color(0xFFFFF1F0);
  static const deleteButtonColor = Color(0xFFeb4d4b);
  static const googleButtonColorBorder = Color(0xFFF14336);
  static const facebookButtonColor = Color(0xFFF5F9FF);
  static const facebookButtonColorBorder = Color(0xFF3164CE);
  static const discountColor = Color(0xFFF17322);

  ///Singleton factory
  static final COLOR_CONST _instance = COLOR_CONST._internal();

  factory COLOR_CONST() {
    return _instance;
  }

  COLOR_CONST._internal();
}

const mAnimationDuration = Duration(milliseconds: 200);
