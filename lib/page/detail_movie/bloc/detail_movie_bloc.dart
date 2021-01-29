import 'package:flutter_movie/common/config/core/base_bloc.dart';
import 'package:flutter_movie/page/detail_movie/bloc/detail_movie_event.dart';
import 'package:flutter_movie/page/detail_movie/bloc/detail_movie_state.dart';
import 'package:flutter_movie/repository/preferences/sessions_pref.dart';
import 'package:flutter_movie/repository/remote/movie/movie_repo.dart';

class DetailMovieBloc extends BaseBloc<DetailMovieEvent, DetailMovieState> {
  DetailMovieBloc(this.movieRepo, this.sessionsPref) : super(const DetailMovieState.nothing());

  final MovieRepo movieRepo;
  final SessionsPref sessionsPref;

  @override
  Stream<DetailMovieState> mapEventToState(DetailMovieEvent event) async*{
    if (event is DetailMovieStarted) {
      yield* _mapGetMovieDetail(event);
    }
  }

  Stream<DetailMovieState> _mapGetMovieDetail(DetailMovieStarted event) async* {
    try {
      yield const DetailMovieState.loading();
      final data = await movieRepo.getDetailMovie(event.movieId);
      yield DetailMovieState.success(data);
    } catch (error) {
      print (error);
      yield const DetailMovieState.error();
    }
  }
}
