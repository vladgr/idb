import 'package:flutter/material.dart';

/// Layout Service
class L {
  static const designWidth = 375;
  static Orientation? orientation;

  // Should be overriden in Root
  static double screenMinSize = 375;
  static double ratio = 1;

  static double appBarHeight = v(120);

  static String lang = 'en';

  static Map<String, Map<String, String>> translationMap = {};

  static void setScreenMinSize(double value) {
    screenMinSize = value;

    if (value < 500) {
      ratio = screenMinSize / designWidth;
    } else if (value < 1000) {
      ratio = 1.4;
    } else {
      ratio = 1.7;
    }
  }

  static void setOrientation(Orientation value) {
    orientation = value;
  }

  /// Use size values via wrapper,
  /// so later the size can be adjusted depending on conditions.
  static double v(double value) {
    return value;
  }
}
