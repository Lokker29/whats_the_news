import 'package:flutter/material.dart';
import 'package:whats_the_news/resources/string_constants.dart';
import 'package:whats_the_news/views/list_of_news.dart';

import 'home.dart';

class NewsPage extends StatefulWidget {
  static const String routeName = '/news';

  @override
  _NewsPageState createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pushNamed(
                context,
                Home.routeName,
              );
            },
          ),
          title: Text(
            StringConstants.mainTitle,
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w600,
            ),
          ),
          centerTitle: true),
      body: Container(
        // padding: EdgeInsets.all(30.0),
        child: ListOfNews(),
      ),
    );
  }
}
