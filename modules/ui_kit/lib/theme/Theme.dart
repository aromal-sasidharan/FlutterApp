library ui_kit;

import 'package:flutter/material.dart';
import 'package:ui_kit/utils/ColorHex.dart';
enum AppColors {
  primary,
  secondary,
  accent,
  bodyText1,
  headingText1,
}
extension AppColorValues on AppColors {
  Color get value {
    switch(this) {
      case AppColors.primary:
        return Colors.lightBlue[800];
      case AppColors.accent:
        return Colors.deepPurpleAccent;
      case AppColors.secondary:
        return Colors.lightBlue[600];
      case AppColors.bodyText1:
        final Color color = HexColor.fromHex("5F5E5E");
        return color;
      case AppColors.headingText1:
        return Colors.blueAccent;
    }
  }
}
enum AppGradientColors {
  avatarBackground
}

extension AppGradientColorsValues on AppGradientColors {
  List<Color> get value {
    switch (this) {
      case AppGradientColors.avatarBackground:
        return [
          AppColors.secondary.value,
          AppColors.primary.value,
          AppColors.accent.value,
        ];
    }
  }
  List<double> get stops {
    switch (this) {
      case AppGradientColors.avatarBackground:
        return  [
          0.1,
          0.5,
          0.9
        ];
    }
  }
}

ThemeData appThemeData() {

  return ThemeData(
    brightness: Brightness.dark,
    primaryColor: AppColors.primary.value,
    fontFamily: 'Helvetica Neue',
    accentColor: AppColors.accent.value,
    textTheme: appTextTheme()
  );

}
TextTheme appTextTheme() {
  return TextTheme(
      headline1: TextStyle(fontSize: 72.0, fontWeight: FontWeight.bold),
      headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic,color: AppColors.headingText1.value),
      bodyText1: TextStyle(
      color: AppColors.accent.value,
      letterSpacing: .5,
        fontSize: 20.0,
      ),
      bodyText2: TextStyle(
          color: AppColors.primary.value,
          letterSpacing: .5,
      )
  );
}
