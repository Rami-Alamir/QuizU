import 'package:flutter/material.dart';

class AppTheme {
  final ThemeData appTheme = ThemeData(
    splashColor: Colors.white,
    primaryColor: const Color.fromRGBO(85, 110, 209, 1.0),
    fontFamily: 'Tajawal',
    canvasColor: Colors.transparent,
    backgroundColor: const Color.fromRGBO(250, 250, 250, 1),
    scaffoldBackgroundColor: const Color.fromRGBO(250, 250, 250, 1),
    textTheme: const TextTheme(
      subtitle1: TextStyle(
          color: Colors.white,
          fontSize: 24,
          fontWeight: FontWeight.w500,
          height: 1.5),
      subtitle2: TextStyle(
          fontSize: 20,
          color: Color.fromRGBO(85, 110, 209, 1.0),
          fontWeight: FontWeight.bold),
      headline1: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
          height: 1.40,
          fontSize: 24),
      headline2: TextStyle(
          color: Colors.black, fontWeight: FontWeight.bold, fontSize: 16),
      headline3: TextStyle(
          fontSize: 20, fontWeight: FontWeight.w500, color: Colors.black),
      headline4: TextStyle(
          color: Colors.grey, fontWeight: FontWeight.normal, fontSize: 16),
      headline5: TextStyle(
          fontWeight: FontWeight.normal,
          color: Color.fromRGBO(87, 87, 87, 1),
          fontSize: 16),
      headline6: TextStyle(
        fontWeight: FontWeight.w600,
        color: Colors.white,
        height: 2,
        fontSize: 20,
      ),
    ),
    dialogTheme: const DialogTheme(
      contentTextStyle: TextStyle(
          color: Color.fromRGBO(87, 87, 87, 1),
          fontWeight: FontWeight.w500,
          fontSize: 16),
    ),
    snackBarTheme: const SnackBarThemeData(
        contentTextStyle: TextStyle(
      fontFamily: 'Tajawal',
      color: Colors.white,
    )),
    colorScheme: ColorScheme.fromSwatch().copyWith(
      secondary: Colors.white,
      primaryContainer: const Color.fromRGBO(240, 240, 240, 1),
      secondaryContainer: Colors.grey.withOpacity(0.5),
    ),
  );
}
