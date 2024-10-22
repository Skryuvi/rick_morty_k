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
  Future<CharacterResponse> getCharacters() => _remoteSource.getCharacters();
}

abstract class RickMortyRepository {
  Future<CharacterResponse> getCharacters();
}
