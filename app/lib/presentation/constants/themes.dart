import 'package:flutter/material.dart';

import 'colors.dart';

class _TextStyles {
  static const headline5 = TextStyle(
    fontSize: 22.0,
    fontWeight: FontWeight.bold,
    color: onBackground,
  );
}

final darkTheme = ThemeData.from(
  colorScheme: const ColorScheme.dark(
      background: backgroundColor,
      onBackground: onBackground,
      surface: darkerBackgroundColor,
      primary: accentColor,
      secondary: secondaryAccentColor,
      onPrimary: onAccent,
      onSecondary: onSecondary,
      primaryVariant: darkerAccentColor,
      error: Colors.red,
      onError: Colors.white),
  textTheme: const TextTheme(
    bodyText2: TextStyle(
      fontSize: 15.0,
      color: onBackground,
    ),
    button: TextStyle(
      fontSize: 16.0,
      color: onAccent,
      fontWeight: FontWeight.bold,
    ),
    headline1: TextStyle(
      color: onBackground,
      fontSize: 40.0,
      fontWeight: FontWeight.bold,
    ),
    headline2: TextStyle(
      color: onBackground,
      fontSize: 34.0,
      fontWeight: FontWeight.bold,
    ),
    headline3: TextStyle(
      color: onBackground,
      fontSize: 30.0,
      fontWeight: FontWeight.bold,
    ),
    headline4: TextStyle(
      color: onBackground,
      fontSize: 26.0,
      fontWeight: FontWeight.bold,
    ),
    headline5: _TextStyles.headline5,
    headline6: TextStyle(
      fontSize: 18.0,
      fontWeight: FontWeight.bold,
      color: onBackground,
    ),
    subtitle2: TextStyle(
      fontSize: 15.0,
      color: dimmedColor,
    ),
  ),
).copyWith(
  appBarTheme: const AppBarTheme(
    backgroundColor: backgroundColor,
    elevation: 0.0,
    titleTextStyle: _TextStyles.headline5,
  ),
);
