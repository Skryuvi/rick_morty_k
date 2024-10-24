import 'package:floor/floor.dart';
import 'package:json_annotation/json_annotation.dart';

part 'chapter_response.g.dart';

@JsonSerializable()
class CharacterResponse {
  final ChapterInfo info;
  final List<ChapterResults> results;

  CharacterResponse({required this.info, required this.results});

  factory CharacterResponse.fromJson(Map<String, dynamic> json) =>
      _$CharacterResponseFromJson(json);
}

@JsonSerializable()
class ChapterInfo {
  final int count;
  final int pages;
  final String next;
  final String? prev;

  ChapterInfo(
      {required this.count,
      required this.pages,
      required this.next,
      this.prev});

  factory ChapterInfo.fromJson(Map<String, dynamic> json) =>
      _$ChapterInfoFromJson(json);
}

@JsonSerializable()
@entity
class ChapterResults {
  @primaryKey
  final int id;
  final String? name;
  final String? status;
  final String? species;
  final String? type;
  final String? gender;
  @ignore
  final Origin? origin;
  @ignore
  final Location? location;
  final String? image;
  @ignore
  final List<String>? episode;
  final String? url;
  final String? created;

  ChapterResults(
      {required this.id,
      this.name,
      this.status,
      this.species,
      this.type,
      this.gender,
      this.origin,
      this.location,
      this.image,
      this.episode,
      this.url,
      this.created});

  factory ChapterResults.fromJson(Map<String, dynamic> json) =>
      _$ChapterResultsFromJson(json);
}

@JsonSerializable()

class Origin {

  final String name;
  final String url;
  Origin({required this.name, required this.url});

  factory Origin.fromJson(Map<String, dynamic> json) => _$OriginFromJson(json);
}

@JsonSerializable()
class Location {
  final String name;
  final String url;

  Location({required this.name, required this.url});

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);
}
