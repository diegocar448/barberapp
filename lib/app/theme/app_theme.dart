import 'package:flutter/material.dart';

final ThemeData appThemeData = ThemeData(
  primaryColor: Colors.cyan,
  //buttonColor: Colors.cyan,
  colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.cyan),
  brightness: Brightness.light,
  //accentColor: Colors.cyan[600],
  appBarTheme: AppBarTheme(
    color: Colors.cyan,
  ),
);
/* final ThemeData appThemeData = ThemeData(
  primaryColor: Colors.cyan,
  buttonColor: Colors.cyan,
  //colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.cyan),
  brightness: Brightness.light,
  accentColor: Colors.cyan[600],
  appBarTheme: AppBarTheme(
    color: Colors.cyan,
  ),
); */
