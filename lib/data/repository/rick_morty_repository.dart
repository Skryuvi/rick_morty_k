import 'package:injectable/injectable.dart';
import 'package:rick_morty/data/local_source/local_source.dart';
import 'package:rick_morty/data/remote_source/remote_source.dart';

import '../../domain/models/chapter_response.dart';

@Singleton(as: RickMortyRepository)
class RickMortyRepositoryImpl extends RickMortyRepository {
  final RemoteSource _remoteSource;
  final LocalSource _localSource;

  RickMortyRepositoryImpl(this._remoteSource, this._localSource);

  @override
  Future<CharacterResponse> getCharacters() async {
    var response = await _remoteSource.getCharacters();
    await _localSource.insertChapterResults(response.results);
    return response;
  }

  @override
  Future<List<ChapterResults>> getChapterResultsLocal() =>
      _localSource.getChapterResults();

  @override
  Future<ChapterResults> getChapterResultByIdLocal(int id) async {
    try {
      var result = await _localSource.getChapterById(id);
      if (result == null) throw Exception('item not found');
      return result;
    } catch (e) {
      print('error: $e');
      throw Exception(e.toString());
    }
  }
}

abstract class RickMortyRepository {
  Future<CharacterResponse> getCharacters();

  Future<List<ChapterResults>> getChapterResultsLocal();

  Future<ChapterResults> getChapterResultByIdLocal(int id);
}
