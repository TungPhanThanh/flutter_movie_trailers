import 'package:flutter_movie/common/config/core/base_bloc.dart';
import 'package:flutter_movie/page/home/bloc/bloc.dart';
import 'package:flutter_movie/repository/remote/movie/movie_repo.dart';

class HomeBloc extends BaseBloc<HomeEvent, HomeState> {
  HomeBloc(this.movieRepo) : super(const HomeState.nothing());

  final MovieRepo movieRepo;

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    if (event is HomeStarted) {
    } else if (event is HomeRequestListNowPlaying) {
      yield* _mapGetListNowPlaying();
    } else if (event is HomeRequestListPopular) {
      yield* _mapGetListPopular();
    } else if (event is HomeRequestListTopRate) {
      yield* _mapGetListTopRate();
    } else if (event is HomeRequestListUpcoming) {
      yield* _mapGetListUpcoming();
    }
  }

  Stream<HomeState> _mapGetListNowPlaying() async* {
    try {
      yield const HomeState.loading();
      final data = (await movieRepo.getListNowPlaying()).results;
      yield HomeState.getListNowPlayingSuccess(data);
    } catch (error) {
      yield const HomeState.error();
    }
  }

  Stream<HomeState> _mapGetListPopular() async* {
    try {
      // yield const HomeState.loading();
      final data = (await movieRepo.getListPopular()).results;
      yield HomeState.getListPopularSuccess(data);
    } catch (error) {
      yield const HomeState.error();
    }
  }

  Stream<HomeState> _mapGetListTopRate() async* {
    try {
      // yield const HomeState.loading();
      final data = (await movieRepo.getListTopRated()).results;
      yield HomeState.getListTopRateSuccess(data);
    } catch (error) {
      yield const HomeState.error();
    }
  }

  Stream<HomeState> _mapGetListUpcoming() async* {
    try {
      // yield const HomeState.loading();
      final data = (await movieRepo.getListUpcoming()).results;
      yield HomeState.getListUpcomingSuccess(data);
    } catch (error) {
      yield const HomeState.error();
    }
  }
}
