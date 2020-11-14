import 'package:flutter/material.dart';
import 'package:whats_the_news/views/category_tiles.dart';
import 'package:whats_the_news/views/news_stream_builder.dart';

class ListOfNews extends StatefulWidget {
  @override
  _ListOfNewsState createState() => _ListOfNewsState();
}

class _ListOfNewsState extends State<ListOfNews> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CategoryTiles(),
        NewsStreamBuilder(),
      ],
    );
  }
}
