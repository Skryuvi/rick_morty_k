import 'package:floor/floor.dart';
import 'package:injectable/injectable.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'dart:async';
import '../../domain/models/chapter_response.dart';
import 'dao/chapter_results_dao.dart';

part 'db_provider.g.dart';

@Database(version: 1, entities: [ChapterResults])
abstract class DataBaseApp extends FloorDatabase {
  ChapterResultsDao get chapterResultDao;
}

@singleton
class DatabaseProvider {
  late DataBaseApp db;

  Future<void> init() async {
    db = await $FloorDataBaseApp.databaseBuilder('database.db').build();
  }
}
