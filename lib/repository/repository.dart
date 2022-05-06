import 'dart:convert';

import 'package:news_list_chopper/model/news.dart';
import 'package:news_list_chopper/service/api_client.dart';

class Repository {
  Future<List<News>> getNews() {
    return ApiClient.create().getNews().then((value) {
      final list = json.decode(value.body) as List<dynamic>;
      final result = List<News>.from(list.map((e) => News.fromJson(e)));
      return result;
    });
  }
}
