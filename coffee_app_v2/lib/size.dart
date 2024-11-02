import 'package:flutter/material.dart';

class SizeConfig {
  static late double screenWidth = 0.0;
  static late double screenHeight = 0.0;
  static late double blockSizeHorizontal;
  static late double blockSizeVertical;
  static bool isPortrait = true;
  static bool isMobilePortrait = false;

  void init(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    blockSizeHorizontal = screenWidth / 100;
    blockSizeVertical = screenHeight / 100;
    isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
    if (screenWidth < 450) {
      isMobilePortrait = isPortrait;
    }
  }

  static double heightMultiplier() {
    return blockSizeVertical;
  }

  static double widthMultiplier() {
    return blockSizeHorizontal;
  }
}
