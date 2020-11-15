import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whats_the_news/models/category.dart';
import 'package:whats_the_news/models/news.dart';
import 'package:whats_the_news/pages/news.dart';
import 'package:whats_the_news/services/news_api_client.dart';

class CategoryBloc extends Bloc<CategoryName, Category> {
  CategoryBloc(Category initialState) : super(initialState);

  @override
  Stream<Category> mapEventToState(CategoryName event) async* {
    yield Category.getCategoryByEnumName(event);
  }
}

class NewsEvent {
  int page = 1;
  String query;
  Category category;

  NewsEvent({this.page, this.query, @required this.category});
}

class NewsBloc extends Bloc<NewsEvent, List<News>> {
  final _apiNews = NewsAPI();

  NewsBloc(List<News> initialState) : super(initialState);

  @override
  Stream<List<News>> mapEventToState(NewsEvent event) {
    Map filters = {
      'q': event.query ?? "",
      'page': event.page,
      'category': event.category?.name
    };

    return _apiNews.getTopHeadlines(filters: filters);
  }
}
