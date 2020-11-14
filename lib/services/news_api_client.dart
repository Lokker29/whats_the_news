import 'dart:io';

import 'package:chopper/chopper.dart';
import 'package:whats_the_news/exceptions.dart';
import 'package:whats_the_news/mocks/news.dart';
import 'package:whats_the_news/models/news.dart';
import 'package:whats_the_news/resources/settings.dart';

import 'api/everything/news_everything_service.dart';
import 'api/top_headlines/news_top_headlines_service.dart';

class NewsAPI {
  static final ChopperClient _chopperClient = ChopperClient(
      baseUrl: APISettings.newsApiDomain,
      services: [
        TopHeadlinesNewsService.create()
      ],
      converter: JsonConverter(),
      interceptors: [
        HeadersInterceptor({'X-Api-Key': APISettings.newsApiKey})
      ]);

  static final newsTopHeadlinesService =
      _chopperClient.getService<TopHeadlinesNewsService>();

  Stream<News> getTopHeadlines({Map filters, int page = 1}) async* {
    var localFilters = Map<String, dynamic>.from(filters);
    localFilters['page'] = page;
    localFilters['pageSize'] = 10;
    localFilters['country'] = 'gb';

    var dataFromAPI =
        (await _makeCheckedCall(() => newsTopHeadlinesService.getNews(localFilters)))
            .body['articles'] as List<dynamic>;

    var newsFromApi = dataFromAPI.map((data) => News.fromJson(data)).toList();
    for (var news in newsFromApi) yield news;
  }

  Future<Response> _makeCheckedCall(Future<Response> Function() call) async {
    try {
      final response = await call();
      if (response.statusCode != 200 || response.body['status'] != 'ok') {
        throw APINotSuccessRequestError();
      }

      return response;
    } on SocketException {
      throw ConnectionError();
    }
  }
}
