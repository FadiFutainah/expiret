import 'package:flutter/material.dart';

ThemeData primaryTheme = ThemeData(
  primaryColor: const Color(0xff24C077),
  textTheme: const TextTheme(
    headline1: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w700,
      fontSize: 29,
    ),
    headline2: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w400,
      fontSize: 20,
    ),
    headline3: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w700,
      fontSize: 22,
    ),
    headline4: TextStyle(
      fontWeight: FontWeight.w300,
      color: Colors.white,
      fontSize: 15,
    ),
    headline5: TextStyle(
      color: Colors.grey,
      fontWeight: FontWeight.w400,
      fontSize: 14,
    ),
    headline6: TextStyle(
      color: Colors.grey,
      fontWeight: FontWeight.w300,
      fontSize: 13,
    ),
    button: TextStyle(
      fontWeight: FontWeight.w300,
      color: Color(0xff24C077),
      fontSize: 15,
    ),
    bodyText1: TextStyle(
      fontWeight: FontWeight.w300,
      color: Color(0xff24C077),
      fontSize: 15,
    ),
    subtitle1: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w700,
      fontSize: 18,
    ),
    subtitle2: TextStyle(
      color: Colors.black,
      fontWeight: FontWeight.w400,
      fontSize: 12,
    ),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      textStyle: MaterialStateProperty.all<TextStyle>(
        const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w300,
          fontSize: 13,
        ),
      ),
    ),
  ),
  cardTheme: CardTheme(
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(14),
    ),
    elevation: 2,
    clipBehavior: Clip.antiAlias,
  ),
  colorScheme: const ColorScheme(
    background: Color(0xFFE0E0E0),
    onBackground: Color(0x1100C569),
    brightness: Brightness.light,
    error: Colors.red,
    onError: Colors.red,
    onPrimary: Colors.grey,
    onSecondary: Colors.white,
    onSurface: Colors.black,
    primary: Color(0xff24C077),
    primaryVariant: Colors.grey,
    secondary: Colors.grey,
    secondaryVariant: Colors.white,
    surface: Colors.grey,
  ),
);
