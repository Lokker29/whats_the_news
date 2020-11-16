import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:whats_the_news/exceptions.dart';
import 'package:whats_the_news/models/category.dart';
import 'package:whats_the_news/models/news.dart';
import 'package:whats_the_news/resources/text_constants.dart';
import 'package:whats_the_news/services/blocs/news_bloc.dart';
import 'package:whats_the_news/views/error_alert.dart';
import 'package:whats_the_news/views/loader_spinkit.dart';

import 'news_element.dart';

class NewsList extends StatefulWidget {
  final Category activeCategory;
  final String searchText;

  NewsList(this.activeCategory, this.searchText);

  @override
  _NewsListState createState() => _NewsListState();
}

class _NewsListState extends State<NewsList> {
  NewsBloc _bloc;

  List<News> newsList = [];

  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  void _loadData() {
    _bloc?.add(NewsEvent(
      category: widget.activeCategory,
      query: widget.searchText,
    ));

    _refreshController.loadComplete();
  }

  @override
  Widget build(BuildContext context) {
    _bloc = BlocProvider.of<NewsBloc>(context);

    _loadData();
    return Expanded(
      child: StreamBuilder(
        stream: _bloc,
        builder: (context, snapshot) {
          return _buildNewsListView(context, snapshot);
        },
      ),
    );
  }

  Widget _buildNewsListView(BuildContext context, AsyncSnapshot snapshot) {
    NewsState state = snapshot.data;

    if (state is NewsOccurredError) {
      return ErrorAlert(_loadData);
    } else if (state is NewsWasLoaded) {
      newsList.addAll(state.news);

      if (newsList.isEmpty) {
        return _buildEmptyResult();
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
    } else if (state == null || state is NewsIsLoading) {
      return Center(
        child: LoaderSpinkit(),
      );
    } else {
      throw NotImplementedStateError("Not implemented state");
    }
  }

  Widget _buildEmptyResult() {
    return Center(
        child: Text(
      TextConstants.emptyListOfNewsText,
      style: TextStyle(
        fontSize: 20.0,
        height: 1.5,
        fontWeight: FontWeight.w500,
      ),
    ));
  }
}
