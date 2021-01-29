import 'package:equatable/equatable.dart';

abstract class DetailMovieEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class DetailMovieStarted extends DetailMovieEvent {
  DetailMovieStarted(this.movieId);

  final String movieId;
}
