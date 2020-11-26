import 'package:flutter_movie/repository/model/entity/dates.dart';
import 'package:flutter_movie/repository/model/entity/movie.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_list_movie_res.g.dart';

@JsonSerializable()
class GetListMovieRes {
  GetListMovieRes({
    this.total_pages,
    this.dates,
    this.page,
    this.total_results,
    this.results,
  });

  factory GetListMovieRes.fromJson(Map<String, dynamic> json) =>
      _$GetListMovieResFromJson(json);

  Map<String, dynamic> toJson() => _$GetListMovieResToJson(this);

  List<Movie> results;
  int total_pages;
  Dates dates;
  int page;
  int total_results;
}
