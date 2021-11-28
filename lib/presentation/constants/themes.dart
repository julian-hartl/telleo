import 'package:flutter/material.dart';

import 'colors.dart';

final darkTheme = ThemeData.from(
  colorScheme: const ColorScheme.dark(
    background: backgroundColor,
    onBackground: onBackground,
    surface: darkerBackgroundColor,
    primary: accentColor,
    secondary: secondaryAccentColor,
    onPrimary: onAccent,
    onSecondary: onAccent,
    primaryVariant: darkerAccentColor,
  ),
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
    headline3: TextStyle(
      color: onBackground,
      fontSize: 40,
      fontWeight: FontWeight.bold,
    ),
    headline4: TextStyle(
      color: onBackground,
      fontSize: 33,
      fontWeight: FontWeight.bold,
    ),
    subtitle2: TextStyle(
      fontSize: 15.0,
      color: dimmedColor,
    ),
  ),
).copyWith(
  appBarTheme:
      const AppBarTheme(backgroundColor: backgroundColor, elevation: 0.0),
);
