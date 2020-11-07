import 'package:flutter/material.dart';
import 'pages/news_page.dart';
import 'pages/home.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
      primaryColor: Color(0xFF171617),
      scaffoldBackgroundColor: Color(0xFFEEE5E9),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0)),
            minimumSize: Size(180.0, 40.0),
            primary: Colors.white,
            backgroundColor: Color(0xFF171617)),
      ),
    ),
    initialRoute: '/',
    routes: {
      '/': (context) => Home(),
      '/news': (context) => NewsPage(),
    },
  ));
}
