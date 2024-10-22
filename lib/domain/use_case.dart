import 'package:rick_morty/data/repository/rick_morty_repository.dart';
import 'package:rick_morty/di/di_config.dart';

import 'models/chapter_response.dart';

class GetCharactersUseCase {
  final _repository = getIt<RickMortyRepository>();

  Future<CharacterResponse> call() async {
    return _repository.getCharacters();
  }
}
