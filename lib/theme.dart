import 'package:flutter/material.dart';

ThemeData getThemeData() {
  return ThemeData(
    primaryColor: Color(0xFF171617),
    scaffoldBackgroundColor: Color(0xFFEEE5E9),
    fontFamily: 'Faustina',
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
          textStyle: TextStyle(
            fontWeight: FontWeight.w600,
          ),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15.0)),
          minimumSize: Size(180.0, 40.0),
          primary: Colors.white,
          backgroundColor: Color(0xFF171617)),
    ),
  );
}
