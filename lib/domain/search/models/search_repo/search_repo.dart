import 'package:json_annotation/json_annotation.dart';
import 'package:netflix_bloc/core/constants.dart';

part 'search_repo.g.dart';

@JsonSerializable()
class SearchRepo {
  @JsonKey(name: "results")
  List<SearchResultData> results;

  SearchRepo({
    this.results = const [],
  });

  factory SearchRepo.fromJson(Map<String, dynamic> json) {
    return _$SearchRepoFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SearchRepoToJson(this);
}

@JsonSerializable()
class SearchResultData {
  @JsonKey(name: "id")
  int? id;

  @JsonKey(name: 'original_title')
  String? originalTitle;

  @JsonKey(name: 'poster_path')
  String? posterPath;

  String get posterImageUrl => '$imageAppentUrl$posterPath';

  SearchResultData({
    this.id,
    this.originalTitle,
    this.posterPath,
  });

  factory SearchResultData.fromJson(Map<String, dynamic> json) {
    return _$SearchResultDataFromJson(json);
  }

  Map<String, dynamic> toJson() => _$SearchResultDataToJson(this);
}
