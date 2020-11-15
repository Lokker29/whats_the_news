import 'package:flutter_dotenv/flutter_dotenv.dart';

class APISettings {
  APISettings._();

  static String newsApiKey = DotEnv().env['NEWS_API_KEY'];

  static const String newsApiDomain = 'http://newsapi.org';
  static const String newsApiTopHeadlines = '/v2/top-headlines';
  static const String newsApiEverything = '/v2/everything';

  static const int defaultPageSize = 20;
  static const String defaultCountry = 'gb';
}
