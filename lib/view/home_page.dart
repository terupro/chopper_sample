import 'package:news_list_chopper/model/news.dart';
import 'package:news_list_chopper/view_model/provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncValue = ref.watch(listProvider);
    return Scaffold(
      appBar: AppBar(title: Text('News List')),
      body: Center(
        child: asyncValue.when(
          data: (data) {
            return data.isNotEmpty
                ? ListView(
                    children: data
                        .map(
                          (News news) => Card(
                            child: GestureDetector(
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return SimpleDialog(
                                      title: Text(news.title!),
                                      children: [
                                        SimpleDialogOption(
                                          child: Text(news.body!),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              },
                              child: ListTile(
                                title: Text(news.title!),
                                subtitle: Text(news.body!),
                                trailing: const Icon(Icons.more_vert),
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  )
                : const Text('Data is empty.');
          },
          loading: () => const CircularProgressIndicator(),
          error: (error, _) => Text(error.toString()),
        ),
      ),
    );
  }
}
