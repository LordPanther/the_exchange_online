import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SizeConfig {
  static late double screenWidth;
  static late double screenHeight;
  static late double defaultSize;
  static Orientation? orientation;

  static double get defaultPadding => defaultSize * 1.5;
  static double get defaultIconSize => defaultSize * 3;

  void init(BoxConstraints constraints, Orientation orientation) {
    screenWidth = constraints.maxWidth;
    screenHeight = constraints.maxHeight;

    // For 8-inch 800x1280 tablets, use a more balanced scaling
    if (kIsWeb) {
      if (screenWidth > 1024) {
        defaultSize = screenHeight * 10 / 1080;
      } else {
        defaultSize = screenHeight * 10 / 1920;
      }
    } else {
      if (orientation == Orientation.portrait) {
        defaultSize = screenHeight * 10 / 1280;
      } else {
        defaultSize = screenHeight * 10 / 800;
      }
    }
  }

  ///Singleton factory
  static final SizeConfig _instance = SizeConfig._internal();

  factory SizeConfig() {
    return _instance;
  }

  SizeConfig._internal();
}
