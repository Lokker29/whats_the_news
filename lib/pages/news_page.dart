import 'package:flutter/material.dart';
import 'package:whats_the_news/settings.dart';

class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: DEFAULT_PROJECT_COLOR,
            title: Text("News", style: TextStyle(fontSize: 20)),
            centerTitle: true,
            elevation: 1,
        )
    );
  }
}
