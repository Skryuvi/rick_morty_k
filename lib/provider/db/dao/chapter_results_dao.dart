import 'package:floor/floor.dart';
import 'package:rick_morty/provider/db/queries.dart';

import '../../../domain/models/chapter_response.dart';

@dao
abstract class ChapterResultsDao {
  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertChapterResult(ChapterResults result);

  @Query(QueryName.chapterResultValues)
  Future<List<ChapterResults>> getChapterResults();

  @Query(QueryName.getChapterById)
  Future<ChapterResults?> getChapterById(int id);
}
