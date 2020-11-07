import 'dart:io';

import 'package:chopper/chopper.dart';
import 'package:whats_the_news/exceptions.dart';
import 'package:whats_the_news/models/news.dart';
import 'package:whats_the_news/resources/settings.dart';

import 'api/everything/news_everything_service.dart';
import 'api/top_headlines/news_top_headlines_service.dart';

class NewsAPI {
  static final ChopperClient _chopperClient = ChopperClient(
      baseUrl: APISettings.newsApiDomain,
      services: [
        EverythingNewsService.create(),
        TopHeadlinesNewsService.create()
      ],
      converter: JsonConverter(),
      interceptors: [
        HeadersInterceptor({'X-Api-Key': APISettings.newsApiKey})
      ]);

  static final newsEverythingService =
      _chopperClient.getService<EverythingNewsService>();

  static final newsTopHeadlinesService =
      _chopperClient.getService<TopHeadlinesNewsService>();

  Future<List<News>> getEverything() async {
    var dataFromAPI =
        (await _makeCheckedCall(() => newsEverythingService.getNews({
                  'sources': 'bbc-news',
                  'pageSize': 10,
                })))
            .body['articles'] as List<dynamic>;

    return dataFromAPI.map((data) => News.fromJson(data)).toList();
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
