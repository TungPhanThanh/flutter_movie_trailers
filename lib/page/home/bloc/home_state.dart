import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_movie/repository/model/entity/movie.dart';
import 'package:flutter_movie/repository/model/response/get_list_movie_res.dart';

enum HomeStatus {
  NOTHING,
  LOADING,
  NOW_PLAYING_SUCCESS,
  POPULAR_SUCCESS,
  TOP_RATE_SUCCESS,
  UPCOMING_SUCCESS,
  ERROR
}

class HomeState extends Equatable {
  final HomeStatus status;

  final GetListMovieRes data;

  final List<Movie> listNowPlaying;

  final List<Movie> listPopular;

  final List<Movie> listTopRate;

  final List<Movie> listUpcoming;

  final DioError dioError;

  const HomeState._({
    this.listNowPlaying,
    this.listPopular,
    this.listTopRate,
    this.listUpcoming,
    this.data,
    this.status = HomeStatus.NOTHING,
    this.dioError,
  });

  const HomeState.nothing() : this._();

  const HomeState.loading() : this._(status: HomeStatus.LOADING);

  const HomeState.getListNowPlayingSuccess(List<Movie> listNowPlaying)
      : this._(status: HomeStatus.NOW_PLAYING_SUCCESS, listNowPlaying: listNowPlaying);

  const HomeState.getListPopularSuccess(List<Movie> listPopular)
      : this._(status: HomeStatus.POPULAR_SUCCESS, listPopular: listPopular);

  const HomeState.getListTopRateSuccess(List<Movie> listTopRate)
      : this._(status: HomeStatus.TOP_RATE_SUCCESS, listTopRate: listTopRate);

  const HomeState.getListUpcomingSuccess(List<Movie> listUpcoming)
      : this._(status: HomeStatus.UPCOMING_SUCCESS, listUpcoming: listUpcoming);

  const HomeState.error() : this._(status: HomeStatus.ERROR);

  @override
  List<Object> get props => [
        status,
        data,
        listNowPlaying,
        listPopular,
        listTopRate,
        listUpcoming,
      ];
}
