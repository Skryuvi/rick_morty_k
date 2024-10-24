import 'package:injectable/injectable.dart';
import 'package:rick_morty/provider/db/db_provider.dart';

import '../../domain/models/chapter_response.dart';

@singleton
class LocalSource {
  final DatabaseProvider _dbProvider;

  LocalSource(this._dbProvider);

  Future<void> insertChapterResult(ChapterResults result) async {
    _dbProvider.db.chapterResultDao.insertChapterResult(result);
  }

  Future<List<ChapterResults>> getChapterResults() async {
    return _dbProvider.db.chapterResultDao.getChapterResults();
  }

  Future<ChapterResults?> getChapterById(int id) async {
    return _dbProvider.db.chapterResultDao.getChapterById(id);
  }
  Future<void> insertChapterResults(List<ChapterResults> results) async {
    await Future.forEach(results, (chapterResult) async {
      _dbProvider.db.chapterResultDao.insertChapterResult(chapterResult);
    });
  }
}
