import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:rick_morty/provider/network_provider.dart';
import 'package:rick_morty/provider/urls.dart';

import '../../domain/models/chapter_response.dart';

@singleton
class RemoteSource {
  final NetworkProvider networkProvider;

  RemoteSource(this.networkProvider);

  Future<CharacterResponse> getCharacters() async {
    final response = await networkProvider.dio.get(Urls.characters,
        options: Options(headers: {'Content-Type': 'application/json'}));
    return CharacterResponse.fromJson(response.data);
  }
}
