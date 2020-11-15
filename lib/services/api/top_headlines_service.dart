import 'package:chopper/chopper.dart';
import 'package:whats_the_news/resources/api_settings.dart';

part 'top_headlines_service.chopper.dart';

@ChopperApi(baseUrl: APISettings.newsApiTopHeadlines)
abstract class TopHeadlinesNewsService extends ChopperService {
  static TopHeadlinesNewsService create([ChopperClient client]) =>
      _$TopHeadlinesNewsService(client);

  @Get()
  Future<Response> getNews(@QueryMap() Map<String, dynamic> query);
}
