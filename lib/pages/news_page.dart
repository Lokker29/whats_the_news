import 'package:flutter/material.dart';
import 'package:whats_the_news/views/list_of_news.dart';

class NewsPage extends StatefulWidget {
  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
            title: Text("News", style: TextStyle(fontSize: 20)),
            centerTitle: true
        ),
        body: Container(
          padding: EdgeInsets.all(30.0),
          child: ListOfNews(),
        ),
    );
  }
}
