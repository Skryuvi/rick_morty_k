import 'package:flutter/widgets.dart';
import 'package:rick_morty/domain/models/chapter_response.dart';

import '../../domain/use_case.dart';

class ChapterResultVm extends ChangeNotifier {
  final int id;

  ChapterResultVm(this.id) {
    init();
  }
  ChapterResults? results;

  void init() {
    _getChapterUseCase.call(id).then((v) {
      results = v;
      notifyListeners();
    });
  }

  late final GetChapterByIdLocalUseCase _getChapterUseCase =
      GetChapterByIdLocalUseCase();
}
