// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_top_headlines_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

class _$TopHeadlinesNewsService extends TopHeadlinesNewsService {
  _$TopHeadlinesNewsService([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  final definitionType = TopHeadlinesNewsService;

  Future<Response> getNews(Map<String, dynamic> query) {
    final $url = '/v2/top-headlines';
    final $params = query;
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<dynamic, dynamic>($request);
  }
}
