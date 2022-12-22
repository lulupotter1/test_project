import 'package:flutter/material.dart';
import 'package:test_project/utils/theme_colors.dart';

class ThemeTextRegular {
  static const fontWeight = FontWeight.w400;
  static const fontFamily = "InterRegular";
  static const fontColor = ThemeColors.white;
  static const size12 = TextStyle(
    color: fontColor,
    fontWeight: fontWeight,
    fontFamily: fontFamily,
    fontStyle: FontStyle.normal,
    fontSize: 12.0,
  );
}

class ThemeTextMedium {
  static const fontWeight = FontWeight.w500;
  static const fontFamily = "InterMedium";
  static const fontColor = ThemeColors.white;

  static const size14 = TextStyle(
    color: fontColor,
    fontWeight: fontWeight,
    fontFamily: fontFamily,
    fontStyle: FontStyle.normal,
    fontSize: 14.0,
  );
}

class ThemeTextBold {
  static const fontWeight = FontWeight.w700;
  static const fontFamily = "InterBold";
  static const fontColor = ThemeColors.white;

  static const size18 = TextStyle(
    color: fontColor,
    fontWeight: fontWeight,
    fontFamily: fontFamily,
    fontStyle: FontStyle.normal,
    fontSize: 18.0,
  );
}

class ThemeTextLight {
  static const fontWeight = FontWeight.w300;
  static const fontFamily = "InterLight";
  static const fontColor = ThemeColors.white;

  static const size17 = TextStyle(
    color: fontColor,
    fontWeight: fontWeight,
    fontFamily: fontFamily,
    fontStyle: FontStyle.normal,
    fontSize: 17.0,
  );
}
