import 'package:flutter/material.dart';
import 'package:sla_common/theme/theme.dart';

final lightTheme = ThemeData(
  textTheme: textTheme,
  scaffoldBackgroundColor: Colors.blue,
  primaryColor: AppColor.FFF7691F,
  highlightColor: AppColor.FFF7691F,
  splashColor: AppColor.FFFF5700,
  hoverColor: AppColor.FFF7691F,
);

final darkTheme = ThemeData(
  textTheme: textTheme,
  scaffoldBackgroundColor: Colors.black,
  primaryColor: AppColor.FFF7691F,
  highlightColor: AppColor.FFF7691F,
  splashColor: AppColor.FFFF5700,
  hoverColor: AppColor.FFF7691F,
);

const textTheme = TextTheme(
  /// headline1
  displayLarge: TextStyle(),

  /// headline2
  displayMedium: TextStyle(),

  /// headline3
  displaySmall: TextStyle(),
  headlineLarge: TextStyle(),

  /// headline4
  headlineMedium: TextStyle(),

  /// headline5
  headlineSmall: TextStyle(),

  /// headline6
  titleLarge: TextStyle(),

  /// subtitle1
  titleMedium: TextStyle(),

  /// subtitle2
  titleSmall: TextStyle(),

  /// bodyText1
  bodyLarge: TextStyle(),

  /// bodyText2
  bodyMedium: TextStyle(),

  /// caption
  bodySmall: TextStyle(),

  /// button
  labelLarge: TextStyle(),

  labelMedium: TextStyle(),

  /// over-line
  labelSmall: TextStyle(),
);
