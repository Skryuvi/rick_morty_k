import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rick_morty/domain/models/chapter_response.dart';
import 'package:rick_morty/features/page_chapter/page_chapter_result.dart';

class ChaptersList extends StatelessWidget {
  final List<ChapterResults> chapters;

  const ChaptersList({super.key, required this.chapters});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemCount: chapters.length,
      itemBuilder: (context, index) {
        final item = chapters[index];
        return GestureDetector(
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => PageChapterResult.create(item.id)));
            },
            child: ListTile(title: Text(item.name ?? '')));
      },
      separatorBuilder: (context, index) {
        return const SizedBox(height: 8);
      },
    );
  }
}
