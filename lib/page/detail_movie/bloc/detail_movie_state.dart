import 'package:equatable/equatable.dart';
import 'package:flutter_movie/repository/model/entity/movie.dart';

enum DetailMovieStatus { NOTHING, LOADING, SUCCESS, ERROR, FINISH }

class DetailMovieState extends Equatable {
  const DetailMovieState._({
    this.status,
    this.movie,
  });

  const DetailMovieState.nothing() : this._();

  const DetailMovieState.loading() : this._(status: DetailMovieStatus.LOADING);

  const DetailMovieState.success(Movie movie)
      : this._(status: DetailMovieStatus.SUCCESS, movie: movie);

  const DetailMovieState.error() : this._(status: DetailMovieStatus.ERROR);

  const DetailMovieState.finish() : this._(status: DetailMovieStatus.FINISH);

  final DetailMovieStatus status;

  final Movie movie;

  @override
  List<Object> get props => [status, movie];
}
