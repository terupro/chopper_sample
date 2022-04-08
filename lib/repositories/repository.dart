import 'dart:convert';

import 'package:coffee_list_chopper/models/news.dart';
import 'package:coffee_list_chopper/services/api_client.dart';

class Repository {
  Future<List<News>> getNews() {
    return ApiClient.create().getNews().then((value) {
      final list = json.decode(value.body) as List<dynamic>;
      final result = List<News>.from(list.map((e) => News.fromJson(e)));
      return result;
    });
  }
}
