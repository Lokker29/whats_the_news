import 'package:chopper/chopper.dart';
import 'package:whats_the_news/resources/settings.dart';

part 'news_everything_service.chopper.dart';

@ChopperApi(baseUrl: APISettings.newsApiEverything)
abstract class EverythingNewsService extends ChopperService {
  static EverythingNewsService create([ChopperClient client]) =>
      _$EverythingNewsService(client);

  @Get()
  Future<Response> getNews(@QueryMap() Map<String, dynamic> query);
}
