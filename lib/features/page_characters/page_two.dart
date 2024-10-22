import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_morty/domain/models/chapter_response.dart';
import 'package:rick_morty/features/page_characters/character_vm.dart';
import 'package:rick_morty/features/page_characters/widgets/charactesrs_list.dart';

class PageTwo extends StatelessWidget {
  const PageTwo({super.key});

  static Widget create() => ChangeNotifierProvider(
      create: (context) => CharacterVm(), child: const PageTwo());

  @override
  Widget build(BuildContext context) {
    final vm = context.read<CharacterVm>();
    return Scaffold(
        appBar: AppBar(
          actions: [
            CupertinoButton(
                child: const Icon(Icons.refresh),
                onPressed: () {
                  vm.init();
                })
          ],
          leading: CupertinoButton(
              onPressed: () => Navigator.of(context).pop('page two'),
              child: const Icon(Icons.arrow_back_ios, color: Colors.black)),
          title: Text('page two'),
        ),
        body: SingleChildScrollView(
            child: Column(children: [
          ChaptersList(
              chapters: context.watch<CharacterVm>().character?.results ??
                  <ChapterResults>[])
        ])));
  }
}
