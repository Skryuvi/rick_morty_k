import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_morty/domain/models/chapter_response.dart';
import 'package:rick_morty/features/page_chapter/chapter_result_vm.dart';

class PageChapterResult extends StatelessWidget {
  const PageChapterResult({super.key});

  static Widget create(int id) => ChangeNotifierProvider(
      create: (context) => ChapterResultVm(id),
      child: const PageChapterResult());

  @override
  Widget build(BuildContext context) {
    var result = context.watch<ChapterResultVm>().results;
    return Scaffold(
        appBar: AppBar(),
        body: Column(children: [
          if (result != null)
            Image.network(
              result.image ?? '',
              errorBuilder: (context, error, stackTrace) =>
                  const Icon(Icons.error),
            ),
        ]));
  }
}
