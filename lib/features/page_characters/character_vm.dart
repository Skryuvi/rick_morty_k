import 'package:flutter/material.dart';
import 'package:rick_morty/domain/models/chapter_response.dart';

import '../../domain/use_case.dart';

class CharacterVm extends ChangeNotifier {
  final _getCharactersUseCase = GetCharactersUseCase();
  CharacterResponse? _response;

  CharacterVm() {
    init();
  }

  CharacterResponse? get character => _response;

  Future<void> init() async {
    _response = null;
    notifyListeners();
    final result = await _getCharactersUseCase();
    _response = result;
    notifyListeners();
  }
}
