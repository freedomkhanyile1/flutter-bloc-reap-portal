
import 'package:flutter/material.dart';
import 'package:mobile/locale/constants/theme_constants.dart';

ThemeData theme() {
  return ThemeData(
    fontFamily: "Montserrat",
    appBarTheme: _appBarTheme(),
    textTheme: _textTheme(),
    inputDecorationTheme: _inputDecorationTheme(),
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

InputDecorationTheme _inputDecorationTheme() {
  var outlineInputBorder = OutlineInputBorder(
    borderRadius: BorderRadius.circular(28),
    borderSide: BorderSide(color: kTextLightColor, width: 1.5),
    gapPadding: 10,
  );
  return InputDecorationTheme(
    labelStyle: TextStyle(fontWeight: FontWeight.w500),
    // floatingLabelBehavior: FloatingLabelBehavior.always,
    contentPadding: EdgeInsets.symmetric(
      horizontal: 38,
      vertical: 20,
    ),
    enabledBorder: outlineInputBorder,
    focusedBorder: outlineInputBorder,
    border: outlineInputBorder,
  );
}

TextTheme _textTheme() {
  return TextTheme(
    bodyText1: TextStyle(color: kTextColor),
    bodyText2: TextStyle(color: kTextColor),
  );
}

AppBarTheme _appBarTheme() {
  return AppBarTheme(
    color: Colors.white,
    elevation: 0,
    brightness: Brightness.light,
    iconTheme: IconThemeData(color: Colors.black),
    textTheme:
        TextTheme(headline6: TextStyle(color: kTextLightColor, fontSize: 18)),
  );
}