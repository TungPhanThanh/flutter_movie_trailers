import 'package:flutter_movie/repository/model/entity/belong_collection.dart';
import 'package:flutter_movie/repository/model/entity/genre.dart';
import 'package:flutter_movie/repository/model/entity/production_company.dart';
import 'package:flutter_movie/repository/model/entity/production_country.dart';
import 'package:flutter_movie/repository/model/entity/spoken_language.dart';
import 'package:json_annotation/json_annotation.dart';

part 'movie.g.dart';

@JsonSerializable()
class Movie {
  Movie({
    this.adult,
    this.backdropPath,
    this.belongsToCollection,
    this.budget,
    this.genres,
    this.homepage,
    this.id,
    this.imdbId,
    this.originalLanguage,
    this.originalTitle,
    this.overview,
    this.popularity,
    this.posterPath,
    this.productionCompanies,
    this.productionCountries,
    this.releaseDate,
    this.revenue,
    this.runtime,
    this.spokenLanguages,
    this.status,
    this.tagline,
    this.title,
    this.video,
    this.voteAverage,
    this.voteCount,
  });

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);
  Map<String, dynamic> toJson() => _$MovieToJson(this);

  bool adult;
  @JsonKey(name: 'backdrop_path')
  String backdropPath;
  @JsonKey(name: 'belongs_to_collection')
  BelongsToCollection belongsToCollection;
  int budget;
  List<Genre> genres;
  String homepage;
  int id;
  @JsonKey(name: 'imdb_id')
  String imdbId;
  String originalLanguage;
  @JsonKey(name: 'original_title')
  String originalTitle;
  String overview;
  double popularity;
  @JsonKey(name: 'poster_path')
  String posterPath;
  @JsonKey(name: 'production_companies')
  List<ProductionCompany> productionCompanies;
  @JsonKey(name: 'production_countries')
  List<ProductionCountry> productionCountries;
  @JsonKey(name: 'release_date')
  DateTime releaseDate;
  int revenue;
  int runtime;
  @JsonKey(name: 'spoken_languages')
  List<SpokenLanguage> spokenLanguages;
  String status;
  String tagline;
  String title;
  bool video;
  @JsonKey(name: 'vote_average')
  double voteAverage;
  @JsonKey(name: 'vote_count')
  int voteCount;
}