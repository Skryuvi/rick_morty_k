// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'db_provider.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

abstract class $DataBaseAppBuilderContract {
  /// Adds migrations to the builder.
  $DataBaseAppBuilderContract addMigrations(List<Migration> migrations);

  /// Adds a database [Callback] to the builder.
  $DataBaseAppBuilderContract addCallback(Callback callback);

  /// Creates the database and initializes it.
  Future<DataBaseApp> build();
}

// ignore: avoid_classes_with_only_static_members
class $FloorDataBaseApp {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static $DataBaseAppBuilderContract databaseBuilder(String name) =>
      _$DataBaseAppBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static $DataBaseAppBuilderContract inMemoryDatabaseBuilder() =>
      _$DataBaseAppBuilder(null);
}

class _$DataBaseAppBuilder implements $DataBaseAppBuilderContract {
  _$DataBaseAppBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  @override
  $DataBaseAppBuilderContract addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  @override
  $DataBaseAppBuilderContract addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  @override
  Future<DataBaseApp> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$DataBaseApp();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$DataBaseApp extends DataBaseApp {
  _$DataBaseApp([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  ChapterResultsDao? _chapterResultDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `ChapterResults` (`id` INTEGER NOT NULL, `name` TEXT, `status` TEXT, `species` TEXT, `type` TEXT, `gender` TEXT, `image` TEXT, `url` TEXT, `created` TEXT, PRIMARY KEY (`id`))');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  ChapterResultsDao get chapterResultDao {
    return _chapterResultDaoInstance ??=
        _$ChapterResultsDao(database, changeListener);
  }
}

class _$ChapterResultsDao extends ChapterResultsDao {
  _$ChapterResultsDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _chapterResultsInsertionAdapter = InsertionAdapter(
            database,
            'ChapterResults',
            (ChapterResults item) => <String, Object?>{
                  'id': item.id,
                  'name': item.name,
                  'status': item.status,
                  'species': item.species,
                  'type': item.type,
                  'gender': item.gender,
                  'image': item.image,
                  'url': item.url,
                  'created': item.created
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<ChapterResults> _chapterResultsInsertionAdapter;

  @override
  Future<List<ChapterResults>> getChapterResults() async {
    return _queryAdapter.queryList('SELECT * FROM ChapterResults',
        mapper: (Map<String, Object?> row) => ChapterResults(
            id: row['id'] as int,
            name: row['name'] as String?,
            status: row['status'] as String?,
            species: row['species'] as String?,
            type: row['type'] as String?,
            gender: row['gender'] as String?,
            image: row['image'] as String?,
            url: row['url'] as String?,
            created: row['created'] as String?));
  }

  @override
  Future<ChapterResults?> getChapterById(int id) async {
    return _queryAdapter.query('SELECT * FROM ChapterResults WHERE id =?1',
        mapper: (Map<String, Object?> row) => ChapterResults(
            id: row['id'] as int,
            name: row['name'] as String?,
            status: row['status'] as String?,
            species: row['species'] as String?,
            type: row['type'] as String?,
            gender: row['gender'] as String?,
            image: row['image'] as String?,
            url: row['url'] as String?,
            created: row['created'] as String?),
        arguments: [id]);
  }

  @override
  Future<void> insertChapterResult(ChapterResults result) async {
    await _chapterResultsInsertionAdapter.insert(
        result, OnConflictStrategy.replace);
  }
}
