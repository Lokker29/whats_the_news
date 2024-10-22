import 'dart:io';

import 'package:chopper/chopper.dart';
import 'package:whats_the_news/exceptions.dart';
import 'package:whats_the_news/models/api_filters.dart';
import 'package:whats_the_news/models/news.dart';
import 'package:whats_the_news/resources/api_settings.dart';

import 'api/top_headlines_service.dart';

class NewsAPI {
  static final ChopperClient _chopperClient = ChopperClient(
      baseUrl: APISettings.newsApiDomain,
      services: [TopHeadlinesNewsService.create()],
      converter: JsonConverter(),
      interceptors: [
        HeadersInterceptor({'X-Api-Key': APISettings.newsApiKey})
      ]);

  static final newsTopHeadlinesService =
      _chopperClient.getService<TopHeadlinesNewsService>();

  Future<List<News>> getTopHeadlines({APIFilters filters}) async {
    var dataFromAPI = (await _makeCheckedCall(
            () => newsTopHeadlinesService.getNews(filters.toJson())))
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
    } catch (exception) {
      throw APINotSuccessRequestError();
    }
  }
}
