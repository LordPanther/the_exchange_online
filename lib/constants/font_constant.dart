// ignore_for_file: non_constant_identifier_names, camel_case_types

import 'package:the_exchange_online/configs/size_config.dart';
import 'package:the_exchange_online/constants/color_constant.dart';
import 'package:flutter/material.dart';

class FONT_CONST {
  static final REGULAR = TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w400,
    color: Colors.black,
    fontSize: SizeConfig.defaultSize * 1.4,
  );

  static final MEDIUM = TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w500,
    color: Colors.black,
    fontSize: SizeConfig.defaultSize * 1.4,
  );

  static final BOLD = TextStyle(
    fontFamily: 'Roboto',
    fontWeight: FontWeight.w600,
    color: Colors.black,
    fontSize: SizeConfig.defaultSize * 1.4,
  );

  //REGULAR
  static final REGULAR_DEFAULT = REGULAR.copyWith(color: COLOR_CONST.greyColor);
  static final REGULAR_DEFAULT_12 =
      REGULAR_DEFAULT.copyWith(fontSize: SizeConfig.defaultSize * 1.2);
  static final REGULAR_DEFAULT_14 =
      REGULAR_DEFAULT.copyWith(fontSize: SizeConfig.defaultSize * 1.4);
  static final REGULAR_DEFAULT_16 =
      REGULAR_DEFAULT.copyWith(fontSize: SizeConfig.defaultSize * 1.6);
  static final REGULAR_DEFAULT_18 =
      REGULAR_DEFAULT.copyWith(fontSize: SizeConfig.defaultSize * 1.8);
  static final REGULAR_DEFAULT_20 =
      REGULAR_DEFAULT.copyWith(fontSize: SizeConfig.defaultSize * 2.0);
  static final REGULAR_DEFAULT_22 =
      REGULAR_DEFAULT.copyWith(fontSize: SizeConfig.defaultSize * 2.2);
  static final REGULAR_DEFAULT_24 =
      REGULAR_DEFAULT.copyWith(fontSize: SizeConfig.defaultSize * 2.4);
  static final REGULAR_DEFAULT_26 =
      REGULAR_DEFAULT.copyWith(fontSize: SizeConfig.defaultSize * 2.6);
  static final REGULAR_DEFAULT_28 =
      REGULAR_DEFAULT.copyWith(fontSize: SizeConfig.defaultSize * 2.8);

  static final REGULAR_PRIMARY =
      REGULAR.copyWith(color: COLOR_CONST.primaryColor);
  static final REGULAR_PRIMARY_12 =
      REGULAR_PRIMARY.copyWith(fontSize: SizeConfig.defaultSize * 1.2);
  static final REGULAR_PRIMARY_14 =
      REGULAR_PRIMARY.copyWith(fontSize: SizeConfig.defaultSize * 1.4);
  static final REGULAR_PRIMARY_16 =
      REGULAR_PRIMARY.copyWith(fontSize: SizeConfig.defaultSize * 1.6);
  static final REGULAR_PRIMARY_18 =
      REGULAR_PRIMARY.copyWith(fontSize: SizeConfig.defaultSize * 1.8);
  static final REGULAR_PRIMARY_20 =
      REGULAR_PRIMARY.copyWith(fontSize: SizeConfig.defaultSize * 2.0);
  static final REGULAR_PRIMARY_22 =
      REGULAR_PRIMARY.copyWith(fontSize: SizeConfig.defaultSize * 2.2);
  static final REGULAR_PRIMARY_24 =
      REGULAR_PRIMARY.copyWith(fontSize: SizeConfig.defaultSize * 2.4);
  static final REGULAR_PRIMARY_26 =
      REGULAR_PRIMARY.copyWith(fontSize: SizeConfig.defaultSize * 2.6);
  static final REGULAR_PRIMARY_28 =
      REGULAR_PRIMARY.copyWith(fontSize: SizeConfig.defaultSize * 2.8);

  static final REGULAR_WHITE = REGULAR.copyWith(color: COLOR_CONST.whiteColor);
  static final REGULAR_WHITE_12 =
      REGULAR_WHITE.copyWith(fontSize: SizeConfig.defaultSize * 1.2);
  static final REGULAR_WHITE_14 =
      REGULAR_WHITE.copyWith(fontSize: SizeConfig.defaultSize * 1.4);
  static final REGULAR_WHITE_16 =
      REGULAR_WHITE.copyWith(fontSize: SizeConfig.defaultSize * 1.6);
  static final REGULAR_WHITE_18 =
      REGULAR_WHITE.copyWith(fontSize: SizeConfig.defaultSize * 1.8);
  static final REGULAR_WHITE_20 =
      REGULAR_WHITE.copyWith(fontSize: SizeConfig.defaultSize * 2.0);
  static final REGULAR_WHITE_22 =
      REGULAR_WHITE.copyWith(fontSize: SizeConfig.defaultSize * 2.2);
  static final REGULAR_WHITE_24 =
      REGULAR_WHITE.copyWith(fontSize: SizeConfig.defaultSize * 2.4);
  static final REGULAR_WHITE_28 =
      REGULAR_WHITE.copyWith(fontSize: SizeConfig.defaultSize * 2.8);

  //MEDIUM (SEMIBOLD)
  static final MEDIUM_DEFAULT = MEDIUM.copyWith(color: COLOR_CONST.textColor);
  static final MEDIUM_DEFAULT_12 =
      MEDIUM_DEFAULT.copyWith(fontSize: SizeConfig.defaultSize * 1.2);
  static final MEDIUM_DEFAULT_14 =
      MEDIUM_DEFAULT.copyWith(fontSize: SizeConfig.defaultSize * 1.4);
  static final MEDIUM_DEFAULT_16 =
      MEDIUM_DEFAULT.copyWith(fontSize: SizeConfig.defaultSize * 1.6);
  static final MEDIUM_DEFAULT_18 =
      MEDIUM_DEFAULT.copyWith(fontSize: SizeConfig.defaultSize * 1.8);
  static final MEDIUM_DEFAULT_20 =
      MEDIUM_DEFAULT.copyWith(fontSize: SizeConfig.defaultSize * 2.0);
  static final MEDIUM_DEFAULT_22 =
      MEDIUM_DEFAULT.copyWith(fontSize: SizeConfig.defaultSize * 2.2);
  static final MEDIUM_DEFAULT_24 =
      MEDIUM_DEFAULT.copyWith(fontSize: SizeConfig.defaultSize * 2.4);
  static final MEDIUM_DEFAULT_28 =
      MEDIUM_DEFAULT.copyWith(fontSize: SizeConfig.defaultSize * 2.8);

  static final MEDIUM_PRIMARY =
      MEDIUM.copyWith(color: COLOR_CONST.primaryColor);
  static final MEDIUM_PRIMARY_12 =
      MEDIUM_PRIMARY.copyWith(fontSize: SizeConfig.defaultSize * 1.2);
  static final MEDIUM_PRIMARY_14 =
      MEDIUM_PRIMARY.copyWith(fontSize: SizeConfig.defaultSize * 1.4);
  static final MEDIUM_PRIMARY_16 =
      MEDIUM_PRIMARY.copyWith(fontSize: SizeConfig.defaultSize * 1.6);
  static final MEDIUM_PRIMARY_18 =
      MEDIUM_PRIMARY.copyWith(fontSize: SizeConfig.defaultSize * 1.8);
  static final MEDIUM_PRIMARY_20 =
      MEDIUM_PRIMARY.copyWith(fontSize: SizeConfig.defaultSize * 2.0);
  static final MEDIUM_PRIMARY_22 =
      MEDIUM_PRIMARY.copyWith(fontSize: SizeConfig.defaultSize * 2.2);
  static final MEDIUM_PRIMARY_24 =
      MEDIUM_PRIMARY.copyWith(fontSize: SizeConfig.defaultSize * 2.4);
  static final MEDIUM_PRIMARY_28 =
      MEDIUM_PRIMARY.copyWith(fontSize: SizeConfig.defaultSize * 2.8);

  static final MEDIUM_WHITE = MEDIUM.copyWith(color: COLOR_CONST.whiteColor);
  static final MEDIUM_WHITE_12 =
      MEDIUM_WHITE.copyWith(fontSize: SizeConfig.defaultSize * 1.2);
  static final MEDIUM_WHITE_14 =
      MEDIUM_WHITE.copyWith(fontSize: SizeConfig.defaultSize * 1.4);
  static final MEDIUM_WHITE_16 =
      MEDIUM_WHITE.copyWith(fontSize: SizeConfig.defaultSize * 1.6);
  static final MEDIUM_WHITE_18 =
      MEDIUM_WHITE.copyWith(fontSize: SizeConfig.defaultSize * 1.8);
  static final MEDIUM_WHITE_20 =
      MEDIUM_WHITE.copyWith(fontSize: SizeConfig.defaultSize * 2.0);
  static final MEDIUM_WHITE_22 =
      MEDIUM_WHITE.copyWith(fontSize: SizeConfig.defaultSize * 2.2);
  static final MEDIUM_WHITE_24 =
      MEDIUM_WHITE.copyWith(fontSize: SizeConfig.defaultSize * 2.4);
  static final MEDIUM_WHITE_28 =
      MEDIUM_WHITE.copyWith(fontSize: SizeConfig.defaultSize * 2.8);

  //BOLD
  static final BOLD_BLACK = BOLD.copyWith(color: COLOR_CONST.darkColor);
  static final BOLD_BLACK_12 =
      BOLD_BLACK.copyWith(fontSize: SizeConfig.defaultSize * 1.2);
  static final BOLD_BLACK_14 =
      BOLD_BLACK.copyWith(fontSize: SizeConfig.defaultSize * 1.4);
  static final BOLD_BLACK_16 =
      BOLD_BLACK.copyWith(fontSize: SizeConfig.defaultSize * 1.6);
  static final BOLD_BLACK_18 =
      BOLD_BLACK.copyWith(fontSize: SizeConfig.defaultSize * 1.8);
  static final BOLD_BLACK_20 =
      BOLD_BLACK.copyWith(fontSize: SizeConfig.defaultSize * 2.0);
  static final BOLD_BLACK_22 =
      BOLD_BLACK.copyWith(fontSize: SizeConfig.defaultSize * 2.2);
  static final BOLD_BLACK_24 =
      BOLD_BLACK.copyWith(fontSize: SizeConfig.defaultSize * 2.4);
  static final BOLD_BLACK_28 =
      BOLD_BLACK.copyWith(fontSize: SizeConfig.defaultSize * 2.8);

  static final BOLD_DEFAULT = BOLD.copyWith(color: COLOR_CONST.greyColor);
  static final BOLD_DEFAULT_12 =
      BOLD_DEFAULT.copyWith(fontSize: SizeConfig.defaultSize * 1.2);
  static final BOLD_DEFAULT_14 =
      BOLD_DEFAULT.copyWith(fontSize: SizeConfig.defaultSize * 1.4);
  static final BOLD_DEFAULT_16 =
      BOLD_DEFAULT.copyWith(fontSize: SizeConfig.defaultSize * 1.6);
  static final BOLD_DEFAULT_18 =
      BOLD_DEFAULT.copyWith(fontSize: SizeConfig.defaultSize * 1.8);
  static final BOLD_DEFAULT_20 =
      BOLD_DEFAULT.copyWith(fontSize: SizeConfig.defaultSize * 2.0);
  static final BOLD_DEFAULT_22 =
      BOLD_DEFAULT.copyWith(fontSize: SizeConfig.defaultSize * 2.2);
  static final BOLD_DEFAULT_24 =
      BOLD_DEFAULT.copyWith(fontSize: SizeConfig.defaultSize * 2.4);
  static final BOLD_DEFAULT_28 =
      BOLD_DEFAULT.copyWith(fontSize: SizeConfig.defaultSize * 2.8);

  static final BOLD_PRIMARY = BOLD.copyWith(color: COLOR_CONST.primaryColor);
  static final BOLD_PRIMARY_12 =
      BOLD_PRIMARY.copyWith(fontSize: SizeConfig.defaultSize * 1.2);
  static final BOLD_PRIMARY_14 =
      BOLD_PRIMARY.copyWith(fontSize: SizeConfig.defaultSize * 1.4);
  static final BOLD_PRIMARY_16 =
      BOLD_PRIMARY.copyWith(fontSize: SizeConfig.defaultSize * 1.6);
  static final BOLD_PRIMARY_18 =
      BOLD_PRIMARY.copyWith(fontSize: SizeConfig.defaultSize * 1.8);
  static final BOLD_PRIMARY_20 =
      BOLD_PRIMARY.copyWith(fontSize: SizeConfig.defaultSize * 2.0);
  static final BOLD_PRIMARY_22 =
      BOLD_PRIMARY.copyWith(fontSize: SizeConfig.defaultSize * 2.2);
  static final BOLD_PRIMARY_24 =
      BOLD_PRIMARY.copyWith(fontSize: SizeConfig.defaultSize * 2.4);
  static final BOLD_PRIMARY_28 =
      BOLD_PRIMARY.copyWith(fontSize: SizeConfig.defaultSize * 2.8);

  static final BOLD_WHITE = BOLD.copyWith(color: COLOR_CONST.whiteColor);
  static final BOLD_WHITE_12 =
      BOLD_WHITE.copyWith(fontSize: SizeConfig.defaultSize * 1.2);
  static final BOLD_WHITE_14 =
      BOLD_WHITE.copyWith(fontSize: SizeConfig.defaultSize * 1.4);
  static final BOLD_WHITE_16 =
      BOLD_WHITE.copyWith(fontSize: SizeConfig.defaultSize * 1.6);
  static final BOLD_WHITE_18 =
      BOLD_WHITE.copyWith(fontSize: SizeConfig.defaultSize * 1.8);
  static final BOLD_WHITE_20 =
      BOLD_WHITE.copyWith(fontSize: SizeConfig.defaultSize * 2.0);
  static final BOLD_WHITE_22 =
      BOLD_WHITE.copyWith(fontSize: SizeConfig.defaultSize * 2.2);
  static final BOLD_WHITE_24 =
      BOLD_WHITE.copyWith(fontSize: SizeConfig.defaultSize * 2.4);
  static final BOLD_WHITE_28 =
      BOLD_WHITE.copyWith(fontSize: SizeConfig.defaultSize * 2.8);

  ///Singleton factory
  static final FONT_CONST _instance = FONT_CONST._internal();

  factory FONT_CONST() {
    return _instance;
  }

  FONT_CONST._internal();
}
