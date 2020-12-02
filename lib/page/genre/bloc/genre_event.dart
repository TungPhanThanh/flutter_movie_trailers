import 'package:equatable/equatable.dart';

class GenreEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class GenreStarted extends GenreEvent {}

class GenreRequest extends GenreEvent {
  GenreRequest({this.apiKey, this.lang}) : super();

  final String apiKey;
  final String lang;
}
