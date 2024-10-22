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
      required this.next, this.prev});

  factory ChapterInfo.fromJson(Map<String, dynamic> json) =>
      _$ChapterInfoFromJson(json);
}

@JsonSerializable()
class ChapterResults {
  final int id;
  final String name;
  final String status;
  final String species;
  final String type;
  final String gender;
  final Origin origin;
  final Location location;
  final String image;
  final List<String> episode;
  final String url;
  final String created;

  ChapterResults(
      {required this.id,
      required this.name,
      required this.status,
      required this.species,
      required this.type,
      required this.gender,
      required this.origin,
      required this.location,
      required this.image,
      required this.episode,
      required this.url,
      required this.created});

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
