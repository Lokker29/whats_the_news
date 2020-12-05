import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whats_the_news/models/api_filters.dart';
import 'package:whats_the_news/models/category.dart';
import 'package:whats_the_news/models/news.dart';
import 'package:whats_the_news/services/news_api_client.dart';

class NewsEvent {
  String query;
  Category category;

  NewsEvent({this.query, @required this.category});
}

abstract class NewsState {}

class NewsIsLoading extends NewsState {}

class NewsWasLoaded extends NewsState {
  final List<News> news;

  NewsWasLoaded(this.news);
}

class NewsOccurredError extends NewsState {}

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final _apiNews = NewsAPI();
  int _page = 1;

  NewsBloc(NewsState initialState) : super(initialState);

  @override
  Stream<NewsState> mapEventToState(NewsEvent event) async* {
    APIFilters filters = APIFilters(
      page: _page,
      category: event.category,
      query: event.query,
    );

    try {
      List<News> newsList = await _apiNews.getTopHeadlines(filters: filters);

      yield NewsWasLoaded(newsList);
      ++_page;
    } catch (exception) {
      yield NewsOccurredError();
    }
  }
}
