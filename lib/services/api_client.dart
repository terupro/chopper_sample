import 'package:chopper/chopper.dart';
import 'package:coffee_list_chopper/models/news.dart';

part 'api_client.chopper.dart';

@ChopperApi(baseUrl: 'https://jsonplaceholder.typicode.com')
abstract class ApiClient extends ChopperService {
  static ApiClient create() => _$ApiClient(ChopperClient());

  @Get(path: '/posts')
  Future<Response> getNews();
}
