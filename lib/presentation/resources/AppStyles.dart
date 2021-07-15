import 'package:flutter/material.dart';

import 'AppColors.dart';


abstract class AppStyles {

  static TextStyle get caption => TextStyle(
    color: AppColors.textColor,
    fontSize: 14,
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.bold,
  );

  static TextStyle get captionWhite => caption.copyWith(color: AppColors.white);

  static TextStyle get title => TextStyle(
        color: AppColors.textColor,
        fontSize: 16,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.bold,
      );

  static TextStyle get titleWhite => title.copyWith(color: AppColors.white);

  static TextStyle get subtitle => TextStyle(
        color: AppColors.textColor,
        fontSize: 14,
        fontStyle: FontStyle.italic,
        fontWeight: FontWeight.normal,
      );

  static TextStyle get subtitleWhite => subtitle.copyWith(color: AppColors.white);

  static TextStyle get body => TextStyle(
        color: AppColors.textColor,
        fontSize: 11,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.normal,
      );

  static TextStyle get action => TextStyle(
        color: AppColors.actionColor,
        fontSize: 12,
        fontStyle: FontStyle.normal,
        fontWeight: FontWeight.bold,
      );

  static TextTheme get appThemeText =>
      TextTheme(headline6: title, subtitle2: subtitle, bodyText2: body);

  static ThemeData get appTheme => ThemeData(
      primaryColor: AppColors.primary,
      primaryColorDark: AppColors.primaryDark,
      accentColor: AppColors.accent,
      fontFamily: "Roboto",
      textTheme: appThemeText);
}
