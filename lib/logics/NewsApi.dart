import 'dart:convert';

import 'package:http/http.dart';
import 'package:whats_the_news/exceptions.dart';
import 'package:whats_the_news/settings.dart';

class NewsAPI {
  Map<String, String> getApiKeyHeader() {
    return {'X-Api-Key': NEWS_API_KEY};
  }

  Future everything() async {
    String url = NEWS_API_TOP_HEADLINES + '?country=us';

    Map<String, String> headers = getApiKeyHeader();
    Response response = await get(url, headers: headers);

    if (response.statusCode == 200) {
      Map jsonResponse = jsonDecode(response.body);
      return jsonResponse['articles'];
    }
    throw NewsApiException;
  }
}
