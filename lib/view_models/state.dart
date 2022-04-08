import 'package:coffee_list_chopper/models/news.dart';
import 'package:coffee_list_chopper/repositories/repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final repositoryProvider = Provider((ref) => Repository());

final listProvider = FutureProvider<List<News>>((ref) async {
  final repository = ref.read(repositoryProvider);
  return await repository.getNews();
});
