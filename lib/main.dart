import 'package:flutter/material.dart';
import 'pages/news_page.dart';
import 'pages/home.dart';

void main() => runApp(MaterialApp(
  initialRoute: '/',
  routes: {
    '/': (context) => Home(),
    '/news': (context) => NewsPage(),
  },
));
