import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:whats_the_news/theme.dart';
import 'pages/splash_page.dart';

Future main() async {
  await DotEnv().load('.env');

  runApp(MaterialApp(
    initialRoute: SplashPage.routeName,
    routes: {
      SplashPage.routeName: (context) => SplashPage(),
    },
    theme: getThemeData(),
  ));
}
