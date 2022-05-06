import 'package:chopper/chopper.dart';
import 'package:news_list_chopper/model/news.dart';

part 'api_client.chopper.dart';

@ChopperApi(baseUrl: 'https://jsonplaceholder.typicode.com')
abstract class ApiClient extends ChopperService {
  static ApiClient create() => _$ApiClient(ChopperClient());

  @Get(path: '/posts')
  Future<Response> getNews();
}
