import 'package:flutter/material.dart';
import 'package:global_test_project/core/constant/theme_colors.dart';

abstract class ThemeTextBrandonGrotesqueBold {
  static const fontWeight = FontWeight.w500;
  static const fontFamily = "BrandonGrotesqueBold";
  static const fontColor = ThemeColors.black;

  static const commonSize = TextStyle(
    color: fontColor,
    fontWeight: fontWeight,
    fontFamily: fontFamily,
    fontStyle: FontStyle.normal,
    fontSize: 14,
  );
}

abstract class ThemeTextBrandonGrotesqueRegular {
  static const fontWeight = FontWeight.w400;
  static const fontFamily = "BrandonGrotesqueRegular";
  static const fontColor = ThemeColors.black;

  static const commonSize = TextStyle(
    color: fontColor,
    fontWeight: fontWeight,
    fontFamily: fontFamily,
    fontStyle: FontStyle.normal,
    fontSize: 14,
  );
}

abstract class ThemeTextAvenirBold {
  static const fontWeight = FontWeight.w800;
  static const fontFamily = "AvenirBold";
  static const fontColor = ThemeColors.black;

  static const commonSize = TextStyle(
    color: fontColor,
    fontWeight: fontWeight,
    fontFamily: fontFamily,
    fontStyle: FontStyle.normal,
    fontSize: 14,
  );
}

abstract class ThemeTextAvenirRegular {
  static const fontWeight = FontWeight.w500;
  static const fontFamily = "AvenirRegular";
  static const fontColor = ThemeColors.black;

  static const commonSize = TextStyle(
    color: fontColor,
    fontWeight: fontWeight,
    fontFamily: fontFamily,
    fontStyle: FontStyle.normal,
    fontSize: 14,
  );
}
