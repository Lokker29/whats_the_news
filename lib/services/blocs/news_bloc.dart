import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    Map filters = {
      'q': event.query ?? "",
      'page': _page,
      'category': event.category?.name
    };
    try {
      List<News> newsList = await _apiNews.getTopHeadlines(filters: filters);

      ++_page;
      yield NewsWasLoaded(newsList);
    } catch (e) {
      yield NewsOccurredError();
    }
  }
}
