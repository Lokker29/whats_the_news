import 'dart:async';

import 'package:flutter/material.dart';
import 'package:whats_the_news/models/category.dart';
import 'package:whats_the_news/resources/string_constants.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'news_page.dart';

class Home extends StatefulWidget {
  static const String routeName = '/';

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 1), () {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => NewsPage(),
          settings: RouteSettings(
            arguments: Category.getDefaultCategoryName,
          ),
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Container(
        color: Theme.of(context).primaryColor,
        child: Center(
          child: TypewriterAnimatedTextKit(
            speed: Duration(milliseconds: 250),
            text: [
              StringConstants.mainTitle,
            ],
            textStyle: TextStyle(
              fontSize: 30,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
    );
  }
}
