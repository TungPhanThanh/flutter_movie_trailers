import 'package:flutter_movie/common/config/core/base_bloc.dart';
import 'package:flutter_movie/page/genre/bloc/genre_event.dart';
import 'package:flutter_movie/page/genre/bloc/genre_state.dart';
import 'package:flutter_movie/repository/remote/genre/genre_repo.dart';

class GenreBloc extends BaseBloc<GenreEvent, GenreState> {
  GenreBloc(this.genreRepo) : super(const GenreState.nothing());

  final GenreRepo genreRepo;

  @override
  Stream<GenreState> mapEventToState(GenreEvent event) async* {
    if (event is GenreStarted) {
      yield* _mapRequestToState();
    } else if (event is GenreRequest) {
      yield* _mapRequestToState();
    }
  }

  Stream<GenreState> _mapRequestToState() async* {
    try {
      yield const GenreState.loading();
      final data = await genreRepo.getListGenre();
      yield GenreState.success(data);
      print('data : ${data.genres}');
    } catch (error) {
      yield const GenreState.error();
    }
  }
}
