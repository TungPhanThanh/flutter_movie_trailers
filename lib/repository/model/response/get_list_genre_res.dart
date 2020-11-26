import 'package:flutter_movie/repository/model/entity/genre.dart';
import 'package:json_annotation/json_annotation.dart';

part 'get_list_genre_res.g.dart';

@JsonSerializable()
class GetListGenreRes {
  GetListGenreRes({
    this.genres,});

  factory GetListGenreRes.fromJson(Map<String, dynamic> json) => _$GetListGenreResFromJson(json);

  Map<String, dynamic> toJson() => _$GetListGenreResToJson(this);

  List<Genre> genres;
}