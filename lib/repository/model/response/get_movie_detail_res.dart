import 'package:flutter_movie/repository/model/entity/movie.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_movie_detail_res.g.dart';

@JsonSerializable()
class GetMovieDetailRes {
  GetMovieDetailRes({this.movie});

  factory GetMovieDetailRes.fromJson(Map<String, dynamic> json) =>
      _$GetMovieDetailResFromJson(json);

  Map<String, dynamic> toJson() => _$GetMovieDetailResToJson(this);

  Movie movie;
}
