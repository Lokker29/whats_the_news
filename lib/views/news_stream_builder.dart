import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:whats_the_news/models/news.dart';
import 'package:whats_the_news/resources/string_constants.dart';
import 'package:whats_the_news/services/news_api_client.dart';

import 'error_alert.dart';
import 'loader_spinkit.dart';
import 'news_element.dart';

class NewsStreamBuilder extends StatefulWidget {
  final String activeCategoryName;
  final String searchText;

  NewsStreamBuilder(this.activeCategoryName, this.searchText, {Key key})
      : super(key: key);

  @override
  _NewsStreamBuilderState createState() => _NewsStreamBuilderState();
}

class _NewsStreamBuilderState extends State<NewsStreamBuilder> {
  int pageNumber = 1;

  StreamController<List<News>> _streamController;
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  List<News> newsList = [];

  final NewsAPI newsApiClient = NewsAPI();

  @override
  void dispose() {
    _streamController?.close();
    _streamController = null;
    super.dispose();
  }

  Map _getApiFilters() {
    var categoryName = widget.activeCategoryName;
    return {
      'category': categoryName,
      'q': widget.searchText,
      'page': pageNumber
    };
  }

  @override
  void initState() {
    super.initState();

    _streamController = StreamController.broadcast();
    _streamController.stream.listen((event) {
      setState(() => newsList.addAll(event));
    });

    _refreshData();
  }

  void _refreshData() {
    var streamRes = newsApiClient.getTopHeadlines(filters: _getApiFilters());
    _streamController.addStream(streamRes);

    _refreshController.loadComplete();
    ++pageNumber;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: StreamBuilder(
        stream: _streamController.stream,
        builder: (context, snapshot) {
          return _createNewsListView(context, snapshot);
        },
      ),
    );
  }

  Widget _createNewsListView(BuildContext context, AsyncSnapshot snapshot) {
    if (snapshot.hasError) {
      return ErrorAlert(_refreshData);
    } else if (snapshot.hasData) {
      if (newsList.isEmpty) {
        return Center(child: Text(
          StringConstants.emptyListOfNewsText,
          style: TextStyle(
            fontSize: 20.0,
            height: 1.5,
            fontWeight: FontWeight.w500,
          ),
        ));
      }

      return SmartRefresher(
        controller: _refreshController,
        enablePullDown: false,
        enablePullUp: true,
        onLoading: _refreshData,
        child: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return ListElement(listElement: newsList[index]);
          },
          itemCount: newsList.length,
        ),
      );
    } else {
      return Center(child: LoaderSpinkit());
    }
  }
}
