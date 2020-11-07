// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'news_everything_service.dart';

// **************************************************************************
// ChopperGenerator
// **************************************************************************

class _$EverythingNewsService extends EverythingNewsService {
  _$EverythingNewsService([ChopperClient client]) {
    if (client == null) return;
    this.client = client;
  }

  final definitionType = EverythingNewsService;

  Future<Response> getNews(Map<String, dynamic> query) {
    final $url = '/v2/everything';
    final $params = query;
    final $request = Request('GET', $url, client.baseUrl, parameters: $params);
    return client.send<dynamic, dynamic>($request);
  }
}
