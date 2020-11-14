import 'dart:async';

import 'package:flutter/material.dart';
import 'package:whats_the_news/models/news.dart';
import 'package:whats_the_news/resources/string_constants.dart';
import 'package:whats_the_news/services/news_api_client.dart';

import 'error_alert.dart';
import 'loader_spinkit.dart';
import 'news_element.dart';

class NewsStreamBuilder extends StatefulWidget {
  @override
  _NewsStreamBuilderState createState() => _NewsStreamBuilderState();
}

class _NewsStreamBuilderState extends State<NewsStreamBuilder> {
  StreamController<News> _refreshController;
  List<News> newsList = [];

  final NewsAPI newsApiClient = NewsAPI();

  @override
  void dispose() {
    _refreshController?.close();
    _refreshController = null;
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    _refreshController = StreamController.broadcast();
    _refreshController.stream.listen((event) {
      setState(() => newsList.add(event));
    });

    var streamRes = newsApiClient.getTopHeadlines(1);
    _refreshController.addStream(streamRes);
  }

  void _refreshOnError() {
    var streamRes = newsApiClient.getTopHeadlines(2);
    _refreshController.addStream(streamRes);
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: StreamBuilder(
        stream: _refreshController.stream,
        builder: (context, snapshot) {
          return _createNewsListView(context, snapshot);
        },
      ),
    );
  }

  Widget _createNewsListView(BuildContext context, AsyncSnapshot snapshot) {
    if (snapshot.hasError) {
      return ErrorAlert(_refreshOnError);
    } else if (snapshot.hasData) {
      if (newsList.isEmpty) {
        return Text(
          StringConstants.emptyListOfNewsText,
          style: TextStyle(
            fontSize: 20.0,
            height: 1.5,
            fontWeight: FontWeight.w500,
          ),
        );
      }

      return ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return ListElement(listElement: newsList[index]);
        },
        itemCount: newsList.length,
      );
    } else {
      return Center(child: LoaderSpinkit());
    }
  }
}
