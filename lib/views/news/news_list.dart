import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:whats_the_news/models/news.dart';
import 'package:whats_the_news/resources/text_constants.dart';
import 'package:whats_the_news/services/news_api_client.dart';
import 'package:whats_the_news/views/error_alert.dart';
import 'package:whats_the_news/views/loader_spinkit.dart';

import 'news_element.dart';

class NewsList extends StatefulWidget {
  final String activeCategoryName;
  final String searchText;

  NewsList(this.activeCategoryName, this.searchText, {Key key})
      : super(key: key);

  @override
  _NewsListState createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
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

    _loadData();
  }

  void _loadData() {
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
          return _buildNewsListView(context, snapshot);
        },
      ),
    );
  }

  Widget _buildNewsListView(BuildContext context, AsyncSnapshot snapshot) {
    if (snapshot.hasError) {
      return ErrorAlert(_loadData);
    } else if (snapshot.hasData) {
      if (newsList.isEmpty) {
        return Center(child: Text(
          TextConstants.emptyListOfNewsText,
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
        onLoading: _loadData,
        child: ListView.builder(
          itemBuilder: (BuildContext context, int index) {
            return NewsElement(listElement: newsList[index]);
          },
          itemCount: newsList.length,
        ),
      );
    } else {
      return Center(child: LoaderSpinkit());
    }
  }
}
