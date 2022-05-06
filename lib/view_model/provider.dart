import 'package:news_list_chopper/model/news.dart';
import 'package:news_list_chopper/repository/repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final repositoryProvider = Provider((ref) => Repository());

final listProvider = FutureProvider<List<News>>((ref) async {
  final repository = ref.read(repositoryProvider);
  return await repository.getNews();
});
