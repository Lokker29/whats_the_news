import 'dart:async';

import 'package:flutter/material.dart';
import 'package:whats_the_news/models/category.dart';
import 'package:whats_the_news/resources/text_constants.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'news.dart';

class SplashPage extends StatefulWidget {
  static const String routeName = '/';

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 5), () {
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
              TextConstants.mainTitle,
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
