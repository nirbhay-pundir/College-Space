import 'package:flutter/material.dart';

class AutoSize {
  static MediaQueryData? _mediaQueryData;
  static double? screenWidth;
  static double? screenHeight;
  static double? defaultSize;
  static Orientation? orientation;
  static double? designHeight;
  static double? designWidth;

  void init(
      BuildContext context, double width, double height, double appBarHeight) {
    _mediaQueryData = MediaQuery.of(context);
    screenWidth = _mediaQueryData!.size.width;
    screenHeight = _mediaQueryData!.size.height -
        _mediaQueryData!.padding.top -
        _mediaQueryData!.padding.bottom -
        appBarHeight;
    orientation = _mediaQueryData!.orientation;
    designWidth = width;
    designHeight = height;
  }

  static double getAutoHeight(double inputHeight) {
    return (inputHeight / designHeight!) * screenHeight!;
  }

  static double getAutoWidth(double inputWidth) {
    return (inputWidth / designWidth!) * screenWidth!;
  }
}
