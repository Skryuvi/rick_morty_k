import 'package:rick_morty/data/repository/rick_morty_repository.dart';
import 'package:rick_morty/di/di_config.dart';
import 'models/chapter_response.dart';

class GetCharactersUseCase {
  final _repository = getIt<RickMortyRepository>();

  Future<CharacterResponse> call() async {
    return _repository.getCharacters();
  }
}

class GetChapterResultsLocalUseCase {
  final _repository = getIt<RickMortyRepository>();

  Future<List<ChapterResults>> call() async {
    return _repository.getChapterResultsLocal();
  }
}

class GetChapterByIdLocalUseCase {
  final _repository = getIt<RickMortyRepository>();

  Future<ChapterResults> call(int id) async {
    return _repository.getChapterResultByIdLocal(id);
  }
}
